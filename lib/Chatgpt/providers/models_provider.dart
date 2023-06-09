
import 'package:flutter/material.dart';

import '../models/models_model.dart';
import '../services/api_services.dart';

class ModelsProvider with ChangeNotifier {
  String currentModels = "gpt-3.5-turbo";
  String get getCurrentModel {
    return currentModels;
  }

  void setCurrentModel(String newModel) {
    currentModels = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelsList = [];

  List<ModelsModel> get getModelsList {
    return modelsList;
  }

  Future<List<ModelsModel>> getAllModels() async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}
