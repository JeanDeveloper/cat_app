import 'package:myapp/domain/entities/weight.dart';

List<WeightModel> weightModelFromJson(List<dynamic> jsonList) {
  return jsonList
      .map(
        (e) => WeightModel.fromJson(e as Map<String, dynamic>),
      )
      .toList();
}

class WeightModel extends Weight {
  WeightModel({required super.imperial, required super.metric});

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      imperial: json["imperial"],
      metric: json["imperial"],
    );
  }
}
