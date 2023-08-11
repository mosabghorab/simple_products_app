import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_products_app/src/config/constants.dart';
import 'package:simple_products_app/src/managers/navigation_manager.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSize? bottom;
  final Color? backgroundColor;
  final Color? leadingIconColor;
  final double? titleFontSize;
  final double? leadingWidth;
  final double? elevation;
  final bool centerTitle;

  const CustomAppBarWidget({
    Key? key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.bottom,
    this.backgroundColor,
    this.leadingIconColor,
    this.titleFontSize,
    this.leadingWidth,
    this.elevation,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      iconTheme: IconThemeData(color: leadingIconColor ?? Colors.black),
      elevation: elevation ?? 0,
      toolbarHeight: 80.h,
      centerTitle: centerTitle,
      title: titleWidget == null && title == null
          ? null
          : titleWidget ??
              Text(
                title!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: titleFontSize?.sp ?? 18.sp,
                ),
              ),
      leadingWidth: leadingWidth ?? 60.w,
      leading: leading ??
          (Navigator.canPop(context)
              ? Center(
                  child: InkWell(
                    onTap: () {
                      N.back();
                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                        start: 16.w,
                      ),
                      width: 40.h,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(color: const Color(0xffECECEC)),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          '${Constants.assetsVectorsPath}arrow-right.svg',
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox()),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + 10.h + (bottom?.preferredSize.height ?? 0));
}
