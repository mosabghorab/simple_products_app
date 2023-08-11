// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:simple_products_app/src/config/constants.dart';
// import 'package:simple_products_app/src/modules/_app/ui/widgets/custom_button_widget.dart';
//
// import 'change_language_widget_controller.dart';
//
// class ChangeLanguageWidget extends StatefulWidget {
//   const ChangeLanguageWidget({Key? key}) : super(key: key);
//
//   @override
//   State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
// }
//
// class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
//   // controller.
//   late final ChangeLanguageWidgetController _changeLanguageWidgetController =
//       context.find<ChangeLanguageWidgetController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.h),
//       margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Change Language'.tr,
//             style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(
//             height: 15.h,
//           ),
//           GetBuilder<ChangeLanguageWidgetController>(
//             id: 'selectedAppLanguage',
//             builder: (controller) => Column(
//               children: List.generate(
//                 Constants.supportedLocales.length,
//                 (index) => Column(
//                   children: [
//                     ListTile(
//                       onTap: () {
//                         controller.selectedAppLanguage =
//                             Constants.supportedLocales.keys.elementAt(index);
//                       },
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.r),
//                       ),
//                       tileColor: controller.selectedAppLanguage ==
//                               Constants.supportedLocales.keys.elementAt(index)
//                           ? Colors.grey.shade300
//                           : null,
//                       title: Text(
//                         Constants.supportedLocales.values.elementAt(index),
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           color: Colors.black,
//                         ),
//                       ),
//                       trailing: controller.selectedAppLanguage ==
//                               Constants.supportedLocales.keys.elementAt(index)
//                           ? Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(
//                                   Icons.check,
//                                   color: Theme.of(context).primaryColor,
//                                   size: 20.h,
//                                 )
//                               ],
//                             )
//                           : null,
//                     ),
//                     SizedBox(
//                       height: 5.h,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 15.h,
//           ),
//           Center(
//             child: CustomButtonWidget(
//               title: 'Save'.tr,
//               onTap: _changeLanguageWidgetController.onSaveButtonTapped,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
