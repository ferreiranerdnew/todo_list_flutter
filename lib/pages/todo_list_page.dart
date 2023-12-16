/* RF TOP PAGINA todo_list_item.dat

passar informações de item pais para filhos ou vice versa
do pai para o filho : sempre passar atravez d eum parametro
do filho para o pai : utilizar um callback
 */
import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/wigets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  // List<String> todos = [];
  // buscando a informação dentro da classe Todo na pasta models
  List<Todo> todos = [];
  // BUG  TENTAR ATUALIZAR flutter_slidable: E USAR A FUNÇÃO ABAIXO COM onPressed:  SEGUINDO A DOCUMENTAÇÃO REFAZER O actionPane: PARA endactionPane:   do todo_list_item.dart
  Todo? deletedTodo;
  int? deletedTodoPos;

  @override
  Widget build(BuildContext context) {
    // RF 01 CORRIGIR OS ELEMENTOS QUE PASSA ACIMA DA SINFORMAÇÕES DO CELULAR COLOCAR O Scaffold DENTRO DE UM WIGET SafeArea, vai manter dentro da area segura do dispositivo
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            // RF 02 apos colocar o 01 corrigir padding: const EdgeInsets.symmetric(horizontal: 16), para oque ficou abaixo
            // assim temos uma melhor distancia da barra superior com nosso campos o valro de 16 e de escolha propria
            //descola tanto em ciam quando em baixo
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex. Estudar Flutter',
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // RF DICAS ELEMENTO onPressed
                        //  pegando a informação digitada na labal
                        String text = todoController.text;
                        //  comando para o flutter refazer a tela
                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                        });
                        //  comando de limpar a label apso execução
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 102, 255, 255),
                        //  ESPAÇAMENTO BUTTON ENTRE O TEXTO
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      //  pode ser desta forma com simbolo ou com icon
                      // child: Text(
                      //   '+',
                      //   style: TextStyle(fontSize: 40),
                      //  colocando o sinal de + com um icon
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // RF SizedBox; listviwer; scroll; buttom; variaveis; length = len;
                //  Criando a listviwer
                //  o SizedBox tambem é um widget e serve para deter minar a largura de outros objetos,muitas veze sutilizamos como um widget vazio
                // colocando a ListView dentro de um wiget flexible, par acresce e não quebrar a tela, possibilitando scroll
                Flexible(
                  child: ListView(
                    //   este comando shrinkWrap: = true deixa a lista o mais inchuta possivel tambem possibilitando o crescimento importante
                    shrinkWrap: true,
                    children: [
                      //  utiliza rum comando for dentrod a lista para apresenatr em tela
                      for (Todo todo in todos)
                        // criando um wiget personalizado proprio em uma todo_list_item.dart esta dentro da pasta de wigets
                        TodoListItem(
                          // passar o objeto todo por completo
                          todo: todo,
                          // passando o callback de filho para pai
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                //  iniciando uma nova row com cmapo de texto e um buttom
                Row(
                  children: [
                    //  Expanded utiliza a maior area disponivel na row ateo proximo objeto
                    Expanded(
                      child: Text(
                        // consumindo a variavel todos e contandop quantos elementos temso dentrod a mesma length = len
                        'Você possui ${todos.length} tarefas pendesnte',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: showDleteTodosConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 102, 255, 255),
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Limpar Tudo',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*exemplo de um callback passando de filho para pai
  */
  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });

    //apresentar messagem no rodape da pagina ao deleta rum item ou tarefa
    // e adcionar um buttom para desfazer a ação do delete
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // comando para limpar a snck bar rapidamente
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi removida com sucesso !',
          style: TextStyle(color: Color(0xff060708)),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          // mudar a cor do buttom
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            // BUG o ponto de ! e para garantir ao sistema que a variavel não e null da Mesma forma que ? você est ainformando que criou a variavel null
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
          },
        ),
        // identificar a duração do snack bar na tela
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo'),
        content:
            Text(' Vocês tem certeza que deseja apagar todas as tarefas? '),
        actions: [
          TextButton(
            onPressed: () {
              // fechar o dialogo sem nenhuma mudança pelo botão cancelar
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Color(0xff00d7f3)),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 243, 0, 0)),
            child: Text('Limpar Tudo'),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
  }
}
