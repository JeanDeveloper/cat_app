import 'package:get_it/get_it.dart';
import 'package:myapp/data/datasource/api_remote_datasource.dart';
import 'package:myapp/data/repository/cat_repository_impl.dart';
import 'package:myapp/domain/repository/cat_repository.dart';
import 'package:myapp/domain/usecases/get_cats.dart';
import 'package:myapp/presentation/blocs/cat/cat_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  //BLOC
  di.registerFactory(() => CatBloc(di()));

  //USE CASES
  di.registerFactory(() => GetCats(repository: di()));

  //REPOSITORY
  di.registerFactory<CatRepository>( () => CatRepositoryImpl(apiRemoteDatasource: di()));

  //DATASOURCE
  di.registerFactory<ApiRemoteDatasource>(() => ApiRemoteDatasourceImpl());
}
