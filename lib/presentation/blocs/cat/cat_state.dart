part of 'cat_bloc.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final List<Cat> cats;
  CatLoaded(this.cats);
}

class CatError extends CatState {
  final String message;
  CatError(this.message);
}
