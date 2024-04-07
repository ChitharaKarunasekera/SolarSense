import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:solarsense/src/features/core/models/products/inverter_model.dart';
import 'package:solarsense/src/features/core/models/products/panel_model.dart';
import 'package:solarsense/src/features/core/models/products/product_model.dart';
import 'package:solarsense/src/repository/product_repository/product_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// Repositories
  final _productRepo = Get.put(ProductRepository());

  /// Fetch list of all inverters
  Future<List<InverterModel>> getAllInverters() async =>
      await _productRepo.getAllInverters();

  /// Fetch list of all inverters
  Future<List<PanelModel>> getAllPanels() async =>
      await _productRepo.getAllPanels();

  /// Get user email and password from the UserRepository to fetch user details
  Future<List<ProductModel>> getPickedProducts(String inverterID, String panelID) async =>
      await _productRepo.getPickedProducts(inverterID, panelID);
}
