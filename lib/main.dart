import 'package:flut_bloc_app/bloc/todo_cubit.dart';
import 'package:flut_bloc_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

// 🙏 Welcome to simple bloc pattern application
// Simple data flow of this application is 🎏
// STATE  <===> BLOC/CUBIT <===> UI/WIDGETS

// To go through this application source visit files in this order
// 1. lib/bloc/todo_state.dart : The State layer
// 2. lib/bloc/todo_cubit.dart : The Bloc layer
// 3. lib/main.dart            : BlocProvider to link bloc layer to UI
// 4. lib/home.dart            : UI layer where the data from bloc is rendered

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider<TodoCubit>(
          // make use of bloc provider to have your cubit available through out your app
          create: (context) => TodoCubit(), // create our TodoCubit
          child: HomePage()),
    );
  }
}
