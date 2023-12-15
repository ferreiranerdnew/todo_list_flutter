/*  RF quanto temos uma variavel do tipo String podemos consumir a mesma no codiogo da seguinte forma '$nome_da_variavel'
RF tomar cuidado com $ dentro do codigo Flutter

*/
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({Key? key}) : super(key: key);

  // TODO: armazenar a informacao digitada pelo usuario
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //  TODO: incluindo um deter minado afastamento do TEXTO DAS BORDAS COMPLETO COM Padding
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // TODO: utilizando campo de texto digitavel
          child: Column(
            // TODO: definir o eixo da column para min
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                //  TODO: passando as informações paga gravar o controler que foi criado acima
                controller: emailController,
                // TODO: iniciar decoração do campo mudar colocar informações
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  // TODO: colocar exemplopar ao usuario como ele deve digitar as informações
                  hintText: 'exemplo@exemplo.com',
                  // TODO: colocar borda em todo o campo
                  border: OutlineInputBorder(),
                  //TODO: caso queira colocar informação de erro no campo pode ser usado os exemplos abaixo
                  // errorText: 'Campo obrigatório',
                  errorText: null,
                  // TODO: utilizando $ sem variavel
                  // prefixText: 'R\$ ',
                  // TODO: exibir texto a direita do TextField
                  // suffixText: 'cm',
                  // TODO: personalizar toda a label
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // TODO: deixar a informação obscura tipo uns  *********
                // obscureText: true,
                // TODO: é possivel definir o caracter qeu queremos exibir trocar o padrão ****** por algo qualquer exemplo %%%%%%%%
                // obscuringCharacter: '%'
                // TODO: apenas teclado numero, exemplo pode ser trocado por varios tipos
                // keyboardType: TextInputType.number,
                // TODO: stylo do texto
                // style: TextStyle(
                //   fontSize: 20,
                //   color: Colors.black,
                // TODO: dar um peso a fonte e como colocar em negrito texto normal e w500
                // fontWeight: FontWeight.w700,
                // ),
                // TODO: VERIFICAR TODA VEZ QUE OUVER MODIFICAÇÃO NO TEXTO necessario a criação d euma função conforme abaixo no rodapé
                onChanged: onChanged,
                // TODO: funciona d eform apareceida com onChanged, porém, so funciona se o usuario apertar o enter do teclado
                onSubmitted: onSubmitted,
              ),
              // TODO: Criando um bottom
              ElevatedButton(
                onPressed: login,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: Criando um função par ao buttom
  void login() {
    // TODO: Texto digitado no campo Controller passando par avariavel text
    String text = emailController.text;
    print(text);
    // RF pode usar o controller para modifica ro texto tambem Exemplo apagar
    // emailController.clear();
    // RF modificando a digitação do usuario
    emailController.text = 'Renato Ferreira';
  }

  void onChanged(String text) {
    // print(text);
  }
  void onSubmitted(String text) {
    print(text);
  }
}
