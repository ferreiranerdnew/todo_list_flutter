import 'package:shared_preferences/shared_preferences.dart';

class TodoRepository {
  TodoRepository() {
    SharedPreferences.getInstance().then((value) => sharePreferences=value);
  }
  // RF late
  /*late significa que ser ainiciada no futuro a variavel e so podemos utilizar depois que a mesma for reiniciada 
  poderia ficar desta forma tambe, SharedPreferences? sharePreferences;  indicando que a variavel não é null
   */
  late SharedPreferences sharePreferences;

  void exemplo(){
    sharePreferences.setString('nome', 'Renato');
    // lendo string depois
    sharePreferences.getString('nome');

  }
}