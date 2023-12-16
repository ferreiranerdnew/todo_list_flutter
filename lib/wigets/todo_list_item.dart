import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // RF PEDDING; Column; eixocruzado; fonte
    // quando se utiliza um Container o memso por padrão tem  um parametro de PEDDING
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16),
      //  colocando os textop dentro da coluna, a mesma por padrão mantem seus item centralizados
      child: Column(
        //  expecificar o alinhamento do eixocruzado star = esqueda, end = direita, center = centro
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '20/11/2023',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            'Tarefa 123',
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
