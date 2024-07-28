import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/data/datasource/api_remote_datasource.dart';
import 'package:myapp/domain/entities/cat.dart';
import 'package:myapp/domain/repository/cat_repository.dart';

class CatRepositoryImpl implements CatRepository{

  final ApiRemoteDatasource apiRemoteDatasource;

  CatRepositoryImpl({required this.apiRemoteDatasource});

  @override
  Future<Either<Failure, List<Cat>>> getCats() async {
    try {
      final List<Cat> resp = await apiRemoteDatasource.getCats();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

}