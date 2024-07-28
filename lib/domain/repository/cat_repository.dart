import 'package:myapp/core/error/failure.dart';
import 'package:myapp/domain/entities/cat.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, List<Cat>>> getCats();
}
