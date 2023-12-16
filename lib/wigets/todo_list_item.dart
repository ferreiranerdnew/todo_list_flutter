import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListItem extends StatelessWidget {
  // definir um parametro obrigadorio required this.title  e final String? title;  ( o ? define que não pode ser null)
  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  // final String title;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // RF PEDDING; Column; eixocruzado; fonte, margin, DateFormat
    // quando se utiliza um Container o mesmo por padrão tem  um parametro de PEDDING
    // Resumo  "margin"  afastamento forda do container, "pedding" afastamento dentro do container
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[200],
      ),
      // o parametro margin e parecido com o padding, porém ao inverso d ao afastamento por fora do container
      // assim conseguimos separar os itens dentro da lista deixando um aspecto com uma linha no meio de cada um      
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(16),
      //  colocando os textop dentro da coluna, a mesma por padrão mantem seus item centralizados
      child: Column(
        //  expecificar o alinhamento do eixocruzado star = esqueda, end = direita, center = centro
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(            
            // para utilizar o Dateformat, é preciso ter a dependencia intl:, importada
            DateFormat('dd/MM/yyyy').format(todo.dateTime),
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
    );
  }
}
