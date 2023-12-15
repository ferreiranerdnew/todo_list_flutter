/*

 */
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      // TODO pegando a informação digitada na labal
                      String text = todoController.text;                    
                      // TODO comando para o flutter refazer a tela
                      setState(() {
                        todos.add(text);                        
                      });
                      // TODO comando de limpar a label apso execução
                      todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 102, 255, 255),
                      // TODO: ESPAÇAMENTO BUTTON ENTRE O TEXTO
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // TODO: pode ser desta forma com simbolo ou com icon
                    // child: Text(
                    //   '+',
                    //   style: TextStyle(fontSize: 40),
                    // TODO colocando o sinal de + com um icon
                    child: const Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // TODO: Criando a listviwer
              // TODO: o SizedBox tambem é um widget e serve para deter minar a largura de outros objetos,muitas veze sutilizamos como um widget vazio
              // TODO colocando a ListView dentro de um wiget flexible, par acresce e não quebrar a tela, possibilitando scroll
              Flexible(
                child: ListView(
                  //  TODO: este comando shrinkWrap: = true deixa a lista o mais inchuta possivel tambem possibilitando o crescimento importante
                  shrinkWrap: true,
                  children: [
                    // TODO utiliza rum comando for dentrod a lista para apresenatr em tela
                    for (String todo in todos)
                      ListTile(
                        title: Text(todo),
                        // subtitle: Text('20/11/2020'),
                        // TODO: Pode ser colocado icon da seguinte forma com leading
                        // leading: Icon(
                        //   Icons.save,
                        //   size: 30,
                        // ),
                        // TODO: Pode ser transformado em um Buttom tambem com onTap
                        onTap: () {
                          print('Tarefa: $todo');
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // TODO: iniciando uma nova row com cmapo de texto e um buttom
              Row(
                children: [
                  // TODO: Expanded utiliza a maior area disponivel na row ateo proximo objeto
                  Expanded(
                    child: Text(
                      'Você possui 0 tarefas pendesnte',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
    );
  }
}
