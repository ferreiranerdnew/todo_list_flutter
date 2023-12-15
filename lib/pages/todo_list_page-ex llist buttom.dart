/*

 */
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex. Estudar Flutter',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
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
                    child: const Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              //  TODO: Criando a listviwer
              // TODO: o SizedBox tambem é um widget e serve para deter minar a largura de outros objetos,muitas veze sutilizamos como um widget vazio
              ListView(
                //  TODO: este comando shrinkWrap: = true deixa a lista o mais inchuta possivel
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text('Tarefa 1'),
                    subtitle: Text('20/11/2020'),
                    // TODO: Pode ser colocado icon da seguinte forma com leading
                    leading: Icon(
                      Icons.save,
                      size: 30,
                    ),
                    // TODO: Pode ser transformado em um Buttom tambem com onTap
                    onTap: () {
                      print('Tarefa 1');
                    },
                  ),
                  ListTile(
                    title: Text('Tarefa 1'),
                    subtitle: Text('20/11/2020'),
                    // TODO: Pode ser colocado icon da seguinte forma com leading
                    leading: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    // TODO: Pode ser transformado em um Buttom tambem com onTap
                    onTap: () {
                      print('Tarefa 2');
                    },
                  ),
                ],
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
