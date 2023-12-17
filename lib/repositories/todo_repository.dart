import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

const todoListKey = 'todo_list';
class TodoRepository {

  // RF late
  /*late significa que ser ainiciada no futuro a variavel e so podemos utilizar depois que a mesma for reiniciada 
  poderia ficar desta forma tambe, SharedPreferences? sharePreferences;  indicando que a variavel não é null
   */
  late SharedPreferences sharePreferences;

  Future<void> getTodoList() async{
    sharePreferences = await SharedPreferences.getInstance();
    // caso não encontrar um valor anterior e seja  aprimeir avez do usuario iniciar uam lista vazia ?? '[]'
    final String jsonString = sharePreferences.getString(todoListKey)?? '[]';
    final List jsonDecode = json.decode(jsonString) as List;

  }

 //Salvando informações, precisa criar um function esta informações são carregadas do todo.dart apos inicialização
 //fica um pouco confuso porém estas informaçõe sdeve ser carregadas no todo_list_page.dart
 void saveTodoList(List<Todo> todos){
  //converter a lista todo em um Json 
  // desta forma a lista e transforma em um json
  final String jsonString =  json.encode(todos);
  // armazenando salvando
  sharePreferences.setString(todoListKey, jsonString);
 }
}