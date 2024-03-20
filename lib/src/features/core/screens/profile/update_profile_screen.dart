import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:solarsense/src/constants/colors.dart';
import 'package:solarsense/src/constants/image_strings.dart';
import 'package:solarsense/src/constants/size.dart';
import 'package:solarsense/src/constants/text_strings.dart';
import 'package:solarsense/src/features/core/models/user_model.dart';

import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {

  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(editProfile, style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(solarSenseDefaultSize),
          child: FutureBuilder(
            future: controller.getUserdata(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasData) {
                  UserModel userdata = snapshot.data as UserModel;

                  //Controllers
                  final email = TextEditingController(text: userdata.email);
                  final fullName = TextEditingController(text: userdata.fullName);
                  final password = TextEditingController(text: userdata.password);
                  final phoneNumber = TextEditingController(text: userdata.phoneNumber);
                  final location = TextEditingController(text: userdata.location);
                  final electricalAppliances = TextEditingController(text: userdata.electricalAppliances);
                  final averageMonthlyBill = TextEditingController(text: userdata.averageMonthlyBill);

                  return Column(
                    children: [
                      // -- IMAGE with ICON
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(image: AssetImage(profileImage1))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: SolarSenseColors.primaryColor),
                              child: const Icon(LineAwesomeIcons.camera,
                                  color: Colors.black, size: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),

                      // -- Form Fields
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: fullName,
                              //initialValue: userdata.fullName,
                              decoration: const InputDecoration(
                                  label: Text(solarSenseFullName),
                                  prefixIcon: Icon(LineAwesomeIcons.user)),
                            ),
                            const SizedBox(height: solarSenseFormHeight - 20),
                            TextFormField(
                              controller: email,
                              //initialValue: userdata.email,
                              decoration: const InputDecoration(
                                  label: Text(solarSenseEmail),
                                  prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                            ),
                            const SizedBox(height: solarSenseFormHeight - 20),
                            TextFormField(
                              controller: phoneNumber,
                              //initialValue: userdata.phoneNumber,
                              decoration: const InputDecoration(
                                  label: Text(solarSensePhoneNo),
                                  prefixIcon: Icon(LineAwesomeIcons.phone)),
                            ),
                            const SizedBox(height: solarSenseFormHeight - 20),
                            TextFormField(
                              controller: password,
                              //initialValue: userdata.password,
                              obscureText: true,
                              decoration: InputDecoration(
                                label: const Text(solarSensePassword),
                                prefixIcon: const Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                    icon: const Icon(LineAwesomeIcons.eye_slash),
                                    onPressed: () {}),
                              ),
                            ),
                            const SizedBox(height: solarSenseFormHeight),

                            // -- Form Submit Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final user = UserModel(
                                      id: userdata.id,
                                      email: email.text.trim(),
                                      fullName: fullName.text.trim(),
                                      phoneNumber: phoneNumber.text.trim(),
                                      password: password.text.trim(),
                                      location: location.text.trim(),
                                      electricalAppliances: electricalAppliances.text.trim(),
                                      averageMonthlyBill: averageMonthlyBill.text.trim()
                                  );
                                  await controller.updateRecord(user);
                                },
                                    //Get.to(() => const UpdateProfileScreen()),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: SolarSenseColors.primaryColor,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: const Text(editProfile,
                                    style: TextStyle(color: SolarSenseColors.darkColor)),
                              ),
                            ),
                            const SizedBox(height: solarSenseFormHeight),

                            // -- Created Date and Delete Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: joined,
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: joinedAt,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.redAccent.withOpacity(0.1),
                                      elevation: 0,
                                      foregroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                      side: BorderSide.none),
                                  child: const Text(delete),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if(snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()),);
                } else {
                  return const Center(child: Text("Something went wrong"));
                }
              }  else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      ),
    );
  }
}
