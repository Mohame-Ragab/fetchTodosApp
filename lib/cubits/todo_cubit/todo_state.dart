part of 'todo_cubit.dart';

sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoSuccess extends TodoState {}

final class TodoFailure extends TodoState {
  TodoFailure({required this.errorMessage});
  String? errorMessage;
}
