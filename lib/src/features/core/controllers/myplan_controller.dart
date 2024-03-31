import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:solarsense/src/features/core/models/myplan_model.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/myplan_repository/myplan_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class MyPlanController extends GetxController {
  static MyPlanController get instance => Get.find();

  /// Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  final _myplanRepo = Get.put(MyPlanRepository());


  //
  Future<void> createGeneratedPlan(MyPlanModel myPlanModel) async {
    await _userRepo.createGeneratedPlan(myPlanModel);
  }


  getMyPlanData() {
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null) {
      return _myplanRepo.getMyPlan(email);
    } else {
      //Get.snackbar("E  rror", "Login to continue");
    }
  }

  updateMyPlan(UserModel user) async {
    await _userRepo.updateUser(user);
  }
}