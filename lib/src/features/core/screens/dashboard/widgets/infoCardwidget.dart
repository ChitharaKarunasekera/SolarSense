// import 'package:flutter/material.dart';
// import 'package:solarsense/src/features/core/screens/dashboard/llm_functions/give_feedback.dart';
//
// import '../../../../../constants/colors.dart';
//
// void infoCardWidget(BuildContext context) {
//   String? advice;
//
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext bc) {
//
//
//       return FutureBuilder<String>(
//         future:
//             GiveFeedback.instance.getAdvice("450", "inverter", "panelOutput"),
//         builder: (context, innerSnapshot) {
//           if (innerSnapshot.connectionState == ConnectionState.done) {
//             if (innerSnapshot.hasData) {
//               advice = innerSnapshot.data!;
//               print("Product Recommendation: $advice");
//
//               return Container(
//                 padding: EdgeInsets.all(20),
//                 child: const Wrap(
//                   children: <Widget>[
//                     ListTile(
//                       leading: Icon(Icons.info_outline),
//                       title: Text('Info Card Title'),
//                       if (advice != null) {
//                         subtitle: Text(advice),
//               } else {
//                         subtitle: Text('No advice available'),
//                       },
//                       subtitle: Text(advice?),
//                     ),
//                     // Add more widgets or text here as needed
//                   ],
//                 ),
//               );
//
//             } else if (innerSnapshot.hasError) {
//               return Text('Error: ${innerSnapshot.error}');
//             }
//           }
//           return const Center(
//             child: CircularProgressIndicator(
//               // Set the color of the CircularProgressIndicator
//               valueColor:
//                   AlwaysStoppedAnimation<Color>(SolarSenseColors.primaryColor),
//             ),
//           );
//         },
//       );
//     },
//   );
// }
