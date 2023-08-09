import 'package:flutter/material.dart';
import 'package:https/viewmodels/base_view_model.dart';
import '../data/label_entity.dart';
import '../services/product_api_service.dart';

class HomeViewModel extends BaseViewModel{
  List<LabelEntity> _labels = [];

  List<LabelEntity> get labels => List<LabelEntity>.from(_labels);

  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  String text = '';

  void onInit() {
    textEditingController.clear();
  }

  void onSetText() {
    text = textEditingController.text;
    focusNode.unfocus();
    onInit();
    updateUI();
  }

  @override
  void onInitView(BuildContext context) {
    super.onInitView(context);
    fetchProductLabel();
  }

  Future<List<LabelEntity>> getLabels() async {
    return ProductAPIService.instance.getLabels();
  }

  Future<LabelEntity> createLabels(LabelEntity labelEntity) async {
    return ProductAPIService.instance.createLabels(labelEntity);
  }

  Future<LabelEntity> updateLabels(LabelEntity labelEntity, String labelId) async {
    return ProductAPIService.instance.updateLabels(labelEntity, labelId);
  }

  Future<void> deleteLabels(String labelId) async {
    return ProductAPIService.instance.deleteLabels(labelId: labelId);
  }

  void fetchProductLabel() async {
    try {
      _labels = await getLabels();
      print(labels.length);
      updateUI();
    } catch (e) {
      print(e);
    }
  }
}