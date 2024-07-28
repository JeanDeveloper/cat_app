import 'package:myapp/core/error/failure.dart';
import 'package:myapp/domain/entities/cat.dart';
import 'package:myapp/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetCats {
  final CatRepository repository;

  GetCats({required this.repository});

  Future<Either<Failure, List<Cat>>> call() {
    return repository.getCats();
  }
}
