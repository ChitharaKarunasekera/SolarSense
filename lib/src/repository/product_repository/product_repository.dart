import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:solarsense/src/features/core/models/products/inverter_model.dart';
import 'package:solarsense/src/features/core/models/products/product_model.dart';

import '../../features/core/models/products/panel_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // return all solar panels in the database
  Future<List<PanelModel>> getAllPanels() async {
    final snapshot = await _db
        .collection("products")
        .where("product_type", isEqualTo: "panel")
        .get();
    final panels =
        snapshot.docs.map((e) => PanelModel.fromSnapshot(e)).toList();
    return panels;
  }

  // return all inverters in the database
  Future<List<InverterModel>> getAllInverters() async {
    final snapshot = await _db
        .collection("products")
        .where("product_type", isEqualTo: "inverter")
        .get();
    final inverter =
        snapshot.docs.map((e) => InverterModel.fromSnapshot(e)).toList();
    return inverter;
  }

  // return the required inverter in the database
  Future<List<ProductModel>> getPickedProducts(String inverterID, String panelID) async {
    List<ProductModel> products = [];

    // Query for the inverterID
    var snapshot = await _db
        .collection("products")
        .where("product_id", isEqualTo: inverterID)
        .get();
    products.addAll(snapshot.docs.map((e) => InverterModel.fromSnapshot(e)).toList());

    // Query for the panelID
    snapshot = await _db
        .collection("products")
        .where("product_id", isEqualTo: panelID)
        .get();
    products.addAll(snapshot.docs.map((e) => PanelModel.fromSnapshot(e)).toList());

    return products;
  }

  // return the required panel model in the database
  Future<InverterModel> getPanelModel(String panelID) async {
    final snapshot = await _db
        .collection("products")
        .where("product_type", isEqualTo: "panel")
        .where("product_id", isEqualTo: panelID)
        .get();
    final inverter =
        snapshot.docs.map((e) => InverterModel.fromSnapshot(e)).single;
    return inverter;
  }
}
