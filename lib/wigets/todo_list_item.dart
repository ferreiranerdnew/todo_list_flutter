import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  // definir um parametro obrigadorio required this.title  e final String? title;  ( o ? define que não pode ser null)
  const TodoListItem({Key? key, required this.todo, required this.onDelete})
      : super(key: key);

  // final String title;
  final Todo todo;
  // RF recebendo o callback de filho para pai, sempre procurar como callback ou de filho para pai esta referenciado desta forma
  final Function(Todo) onDelete;


  @override
  Widget build(BuildContext context) {
    // RF PEDDING; Column; eixocruzado; fonte; margin; DateFormat; stretch = coluna sempre eocupar a maior largura possivel sempre
    // quando se utiliza um Container o mesmo por padrão tem  um parametro de PEDDING
    // Resumo  "margin"  afastamento forda do container, "pedding" afastamento dentro do container
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[200],
          ),
          // o parametro margin e parecido com o padding, porém ao inverso d ao afastamento por fora do container
          // assim conseguimos separar os itens dentro da lista deixando um aspecto com uma linha no meio de cada um
          // margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.all(16),
          //  colocando os textop dentro da coluna, a mesma por padrão mantem seus item centralizados
          child: Column(
            //  expecificar o alinhamento do eixocruzado star = esqueda, end = direita, center = centro
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                // para utilizar o Dateformat, é preciso ter a dependencia intl:, importada
                // verificar a documentação, porém caso fique assim 'dd/MMM/yyyy' com 3 M modifica para o nome do mês em ingles
                // existe formar par adeixar em portugues tambem
                // outra forma e 'dd/MM/yyyy - EE ' mostr ao dia da semana
                DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime),
                // todo.dateTime.toString(),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  // deixando a fonte em negrito mais conhecido como dar peso ao texto
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        // The end action pane is the one at the right or the bottom side.
        endActionPane: const ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              // spacing: 6,
              flex: 1,
              backgroundColor: Color.fromARGB(255, 250, 3, 3),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              onPressed: () {
                // chamando um função que esta em todo_list_page.dart 
                onDelete(todo);
              },
            ),
            SlidableAction(
              onPressed: null,
              backgroundColor: Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.save,
              label: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
