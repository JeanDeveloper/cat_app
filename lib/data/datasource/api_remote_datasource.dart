import 'package:myapp/core/utils/constants.dart';
import 'package:myapp/data/models/cat_model.dart';
import 'package:dio/dio.dart';

abstract class ApiRemoteDatasource {
  Future<List<CatModel>> getCats();
}

class ApiRemoteDatasourceImpl implements ApiRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<List<CatModel>> getCats() async {
    dio.options.headers["x-api-key"] = Constants.apiKey;
    final Response resp = await dio.get('${Constants.pathApi}breeds');
    List<dynamic> json = resp.data as List<dynamic>;
    final resp1 = catModelFromJson(json);
    return resp1;
  }
}
