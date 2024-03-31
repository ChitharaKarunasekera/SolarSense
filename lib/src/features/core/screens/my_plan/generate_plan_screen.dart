// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//
// import '../../../../constants/size.dart';
// import '../../controllers/myplan_controller.dart';
// import '../../controllers/profile_controller.dart';
// import '../../models/user_model.dart';
//
// class GeneratePlanScreen extends StatelessWidget {
//
//   const GeneratePlanScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController());
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () => Get.back(),
//             icon: const Icon(LineAwesomeIcons.angle_left)),
//         title: Text("Generate Plan Screen", style: Theme.of(context).textTheme.headline4),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(solarSenseDefaultSize),
//           child: FutureBuilder(
//             future: controller.getUserdata(),
//             builder: (context, snapshot){
//               if(snapshot.connectionState == ConnectionState.done) {
//                 if(snapshot.hasData) {
//                   UserModel userdata = snapshot.data as UserModel;
//
//                   //Controllers
//                   final email = TextEditingController(text: userdata.email);
//                   final fullName = TextEditingController(text: userdata.fullName);
//                   final password = TextEditingController(text: userdata.password);
//                   final phoneNumber = TextEditingController(text: userdata.phoneNumber);
//                   final location = TextEditingController(text: userdata.location);
//                   final electricalAppliances = TextEditingController(text: userdata.electricalAppliances);
//                   final averageMonthlyBill = TextEditingController(text: userdata.averageMonthlyBill);
//
//                   return Column(
//                     children: [
//
//
//                       // -- Form Fields
//                       Form(
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               controller: fullName,
//                               //initialValue: userdata.fullName,
//                               decoration: const InputDecoration(
//                                   label: Text(solarSenseFullName),
//                                   prefixIcon: Icon(LineAwesomeIcons.user)),
//                             ),
//                             const SizedBox(height: solarSenseFormHeight - 20),
//                             TextFormField(
//                               controller: email,
//                               //initialValue: userdata.email,
//                               decoration: const InputDecoration(
//                                   label: Text(solarSenseEmail),
//                                   prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
//                             ),
//                             const SizedBox(height: solarSenseFormHeight - 20),
//                             TextFormField(
//                               controller: phoneNumber,
//                               //initialValue: userdata.phoneNumber,
//                               decoration: const InputDecoration(
//                                   label: Text(solarSensePhoneNo),
//                                   prefixIcon: Icon(LineAwesomeIcons.phone)),
//                             ),
//                             const SizedBox(height: solarSenseFormHeight - 20),
//                             TextFormField(
//                               controller: password,
//                               //initialValue: userdata.password,
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                 label: const Text(solarSensePassword),
//                                 prefixIcon: const Icon(Icons.fingerprint),
//                                 suffixIcon: IconButton(
//                                     icon: const Icon(LineAwesomeIcons.eye_slash),
//                                     onPressed: () {}),
//                               ),
//                             ),
//                             const SizedBox(height: solarSenseFormHeight),
//
//                             // -- Form Submit Button
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () async {
//                                   final user = UserModel(
//                                       id: userdata.id,
//                                       email: email.text.trim(),
//                                       fullName: fullName.text.trim(),
//                                       phoneNumber: phoneNumber.text.trim(),
//                                       password: password.text.trim(),
//                                       location: location.text.trim(),
//                                       electricalAppliances: electricalAppliances.text.trim(),
//                                       averageMonthlyBill: averageMonthlyBill.text.trim()
//                                   );
//                                   await controller.updateRecord(user);
//                                 },
//                                 //Get.to(() => const UpdateProfileScreen()),
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: SolarSenseColors.primaryColor,
//                                     side: BorderSide.none,
//                                     shape: const StadiumBorder()),
//                                 child: const Text(editProfile,
//                                     style: TextStyle(color: SolarSenseColors.darkColor)),
//                               ),
//                             ),
//                             const SizedBox(height: solarSenseFormHeight),
//
//                             // -- Created Date and Delete Button
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text.rich(
//                                   TextSpan(
//                                     text: joined,
//                                     style: TextStyle(fontSize: 12),
//                                     children: [
//                                       TextSpan(
//                                           text: joinedAt,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 12))
//                                     ],
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor:
//                                       Colors.redAccent.withOpacity(0.1),
//                                       elevation: 0,
//                                       foregroundColor: Colors.red,
//                                       shape: const StadiumBorder(),
//                                       side: BorderSide.none),
//                                   child: const Text(delete),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 } else if(snapshot.hasError) {
//                   return Center(child: Text(snapshot.error.toString()),);
//                 } else {
//                   return const Center(child: Text("Something went wrong"));
//                 }
//               }  else {
//                 return const Center(child: CircularProgressIndicator(),);
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }