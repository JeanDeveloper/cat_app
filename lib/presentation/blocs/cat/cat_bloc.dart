import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/domain/entities/cat.dart';
import 'package:myapp/domain/usecases/get_cats.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final GetCats getCats;
  final List<Cat> listCats = [];

  CatBloc(this.getCats) : super(CatInitial()) {
    on<CatEvent>((event, emit) async {
      if (event is GetCatsEvent) {
        emit(CatLoading());
        final catList = await getCats();
        emit(_failureOrSuccess(catList));
      }
    });
  }

  CatState _failureOrSuccess(Either<Failure, List<Cat>> failureOrSuccess) {
    return failureOrSuccess.fold( (failure) => 
      CatError(_mapFailureToMessage(failure)), 
      (list) {
        listCats.clear();
        listCats.addAll(list);
        return CatLoaded(list);
      }
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      default:
        return "Error inesperado";
    }
  }
}
