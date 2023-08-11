// import 'package:simple_products_app/src/modules/_app/models/extracted/custom_error.dart';
// import 'package:simple_products_app/src/modules/_app/ui/widgets/custom_button_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class FailureWidget extends StatelessWidget {
//   final CustomError customError;
//   final void Function() onTryAgainTapped;
//   final bool horizontalDesign;
//
//   const FailureWidget({
//     Key? key,
//     required this.customError,
//     required this.onTryAgainTapped,
//     this.horizontalDesign = false,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 16.h),
//         child: horizontalDesign
//             ? Row(
//                 children: [
//                   // Lottie.asset(
//                   //   '${Constants.assetsAnimationsPath}${() {
//                   //     if (customError.customErrorType ==
//                   //         CustomErrorType.server) {
//                   //       return 'server_error_animation';
//                   //     } else if (customError.customErrorType ==
//                   //         CustomErrorType.notFound) {
//                   //       return 'not_found_error_animation';
//                   //     } else if (customError.customErrorType ==
//                   //         CustomErrorType.noInternetConnection) {
//                   //       return 'no_internet_error_animation';
//                   //     } else {
//                   //       return 'unknown_error_animation';
//                   //     }
//                   //   }()}.json',
//                   //   repeat: true,
//                   //   height: 50.h,
//                   //   width: 50.h,
//                   // ),
//                   SizedBox(
//                     width: 15.w,
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           customError.title,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 13.sp,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text(
//                           customError.description,
//                           style: TextStyle(
//                             fontSize: 10.sp,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15.w,
//                   ),
//                   InkWell(
//                     onTap: onTryAgainTapped,
//                     child: Icon(
//                       CupertinoIcons.refresh_circled_solid,
//                       color: Colors.red,
//                       size: 25.h,
//                     ),
//                   )
//                 ],
//               )
//             : Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Lottie.asset(
//                   //   '${Constants.assetsAnimationsPath}${() {
//                   //     if (customError.customErrorType ==
//                   //         CustomErrorType.server) {
//                   //       return 'server_error_animation';
//                   //     } else if (customError.customErrorType ==
//                   //         CustomErrorType.notFound) {
//                   //       return 'not_found_error_animation';
//                   //     } else if (customError.customErrorType ==
//                   //         CustomErrorType.noInternetConnection) {
//                   //       return 'no_internet_error_animation';
//                   //     } else {
//                   //       return 'app_error_animation';
//                   //     }
//                   //   }()}.json',
//                   //   repeat: true,
//                   //   height: 200.h,
//                   //   width: 200.h,
//                   // ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Text(
//                     customError.title,
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16.sp,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Text(
//                     customError.description,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   CustomButtonWidget(
//                     title: 'Try Again'.tr,
//                     onTap: onTryAgainTapped,
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
