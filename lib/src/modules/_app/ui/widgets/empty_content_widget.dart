import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_products_app/src/config/constants.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/custom_button_widget.dart';

class EmptyContentWidget extends StatelessWidget {
  final String title;
  final String description;
  final String iconName;
  final String? actionButtonName;
  final VoidCallback? onActionTapped;

  const EmptyContentWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.iconName,
    this.actionButtonName,
    this.onActionTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            '${Constants.assetsVectorsPath}$iconName.svg',
            width: 50.h,
            height: 50.h,
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'عذراً!',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2.h,
                fontSize: 13.sp,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          if (onActionTapped != null && actionButtonName != null)
            CustomButtonWidget(
              onTap: onActionTapped!,
              title: actionButtonName!,
            ),
          // SizedBox(
          //   height: 5.h,
          // ),
          // CustomButtonWidget(
          //   onTap: () {},
          //   title: 'إستيراد من نور المركزي',
          // ),
        ],
      ),
    );
  }
}
