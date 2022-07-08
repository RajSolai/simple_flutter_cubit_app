import 'package:flut_bloc_app/bloc/todo_cubit.dart';
import 'package:flut_bloc_app/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // User the BlocBuilder to make use of your cubit
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            if (state is LoadingState) {
              // Check for loading state
              return const Center(
                child: Text("Loading todos"),
              );
            }
            if (state is ErrorState) {
              // Check for error state
              return const Center(
                child: Text("Error occurred check logs"),
              );
            }
            if (state is LoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.todos[index]["title"] ?? "Null"),
                      ), // Access todos from state here
                    ),
                  );
                },
              );
            }
            return Center(
              // handle fetch api button render
              child: TextButton(
                  onPressed: () {
                    // You can freely access the cubit's methods or functions
                    // using the context (BuildContext) unlike bloc where we
                    // would be using events
                    context.read<TodoCubit>().getTodos(); 
                  },
                  child: const Text("Get Todos")),
            );
          },
        ),
      ),
    );
  }
}
