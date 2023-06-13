import 'package:flutter/material.dart';
import 'package:https/viewmodels/base_view_model.dart';
import '../data/label_entity.dart';
import '../services/product_api_service.dart';

class HomeViewModel extends BaseViewModel{
  List<LabelEntity> _labels = [];

  List<LabelEntity> get labels => List<LabelEntity>.from(_labels);


  @override
  void onInitView(BuildContext context) {
    super.onInitView(context);
    _fetchProductLabel();
  }

  Future<List<LabelEntity>> getLabels() async {
    return ProductAPIService.instance.getLabels();
  }

  void _fetchProductLabel() async {
    try {
      _labels = await getLabels();
      print(labels.length);
      updateUI();
    } catch (e) {
      print(e);
    }
  }
}