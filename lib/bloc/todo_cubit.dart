import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flut_bloc_app/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Now can create a business login using CUBIT
// a cubit is very similar to the bloc but it does not rely on events
// read more here 👇
// https://pub.dev/documentation/bloc/latest/bloc/Cubit-class.html
// Simple 🏞 of bloc vs cubit here 👇
// https://miro.medium.com/max/1400/0*DVDQeqP1lacfyU5K

class TodoCubit extends Cubit<TodoState> {
  // Cubits need a initial state
  TodoCubit()
      : super(InitialTodoState()); // hence we pass our initial todo state

  // This function can be called on UI to get all the todos and render it
  void getTodos() async {
    emit(LoadingState()); // emitting loading
    try {
      var responseValue = // making api calls
          await Dio().get("https://jsonplaceholder.typicode.com/todos");
      emit(LoadedState(todos: responseValue.data)); // emitting data to UI
    } catch (e) {
      emit(ErrorState()); // emitting error
      log(e.toString()); // logging caught error
    }
  }
}
