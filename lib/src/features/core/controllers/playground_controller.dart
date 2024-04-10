import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:solarsense/src/features/core/models/myplan_model.dart';
import 'package:solarsense/src/features/core/models/plaground_stats_model.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/myplan_repository/myplan_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class PlaygroundController extends GetxController {
  static PlaygroundController get instance => Get.find();

  /// Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());


  //
  Future<void> createPlaygroundStats(PlaygroundStatsModel playgroundStatsModel) async {
    await _userRepo.createPlaygroundStats(playgroundStatsModel);
  }


  getPlaygroundStats() {
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null) {
      return _userRepo.getPlaygroundStats(email);
    } else {
      //Get.snackbar("E  rror", "Login to continue");
    }
  }

  // updateMyPlan(UserModel user) async {
  //   await _userRepo.updateUser(user);
  // }
}