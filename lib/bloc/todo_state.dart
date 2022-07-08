import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TodoState extends Equatable {} // First create an state for the data


// Now from the state we have created we can create variants of it


class InitialTodoState extends TodoState { // this would be our initial state
  @override
  List<Object?> get props => [];
}

class LoadingState extends TodoState { // this is emitted when the api is fetching
  @override
  List<Object?> get props => [];
}

class LoadedState extends TodoState { // this state is emitted when the api is 
                                      // finished calling and data is returned
  final todos;

  LoadedState({this.todos});

  @override
  List<Object?> get props => [todos]; // this state returns a todos property
                                      // which contains the api data
}

class ErrorState extends TodoState { // this state is called when every we have 
                                     // an error during api call
  @override
  List<Object> get props => [];
}
