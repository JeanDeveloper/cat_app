part of 'cat_bloc.dart';

@immutable
sealed class CatEvent {}

class InitialEvent extends CatEvent {}

class GetCatsEvent extends CatEvent {}
