import 'package:https/services/request_api_service.dart';

import '../data/label_entity.dart';

class ProductAPIService {
  static const kProductLabelsPath = "/products/labels";

  ProductAPIService._();

  static ProductAPIService? _instance;

  static ProductAPIService get instance {
    _instance ??= ProductAPIService._();
    return _instance!;
  }

  Future<List<LabelEntity>> getLabels() async {
    final response = await RequestAPIService.instance.get(url: kProductLabelsPath);
    return List.from(response['data'])
        .map((e) => LabelEntity.fromJson(e))
        .toList();
  }

  Future<LabelEntity> createLabels(LabelEntity labelEntity) async {
    final response = await RequestAPIService.instance.post(url: kProductLabelsPath, data: labelEntity.toJson());
    return LabelEntity.fromJson(response);
  }

  Future<LabelEntity> updateLabels(LabelEntity labelEntity, String labelId) async {
    final response = await RequestAPIService.instance
        .put(url: '$kProductLabelsPath/$labelId', data: labelEntity.toJsonUpdate());
    return LabelEntity.fromJson(response);
  }

  Future<void> deleteLabels({required String labelId}) async {
    await RequestAPIService.instance.delete(url: '$kProductLabelsPath/$labelId');
  }
}
