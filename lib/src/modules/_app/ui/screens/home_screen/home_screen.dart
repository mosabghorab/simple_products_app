import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_products_app/src/config/constants.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/home_screen/home_screen_controller.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/category_widget.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/custom_app_bar_widget.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // controller.
  late final HomeScreenController _homeScreenController =
      context.read<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'المنتجات',
        actions: [
          Center(
            child: InkWell(
              onTap: _homeScreenController.navigateToAddProductScreen,
              child: Container(
                width: 40.h,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: const Color(0xffECECEC)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    '${Constants.assetsVectorsPath}add.svg',
                  ),
                ),
              ),
            ),
          ),
          16.horizontalSpace,
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _homeScreenController.refreshProducts,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(16.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'التصنيفات',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                5.verticalSpace,
                SizedBox(
                  height: 100.h,
                  child: Selector<HomeScreenController, int?>(
                    selector: (_, value) => value.selectedCategoryIndex,
                    builder: (_, selectedCategoryIndex, __) =>
                        ListView.separated(
                      itemCount: _homeScreenController.categories.length + 1,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, index) => 5.horizontalSpace,
                      itemBuilder: (_, index) => index == 0
                          ? InkWell(
                              onTap: () {
                                _homeScreenController.onCategoryTapped(
                                    index: null);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6.h, horizontal: 8.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: selectedCategoryIndex == null
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 55.h,
                                      width: 70.h,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6.h, horizontal: 8.w),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.h),
                                        child: SvgPicture.asset(
                                          '${Constants.assetsVectorsPath}all.svg',
                                        ),
                                      ),
                                    ),
                                    15.verticalSpace,
                                    const Text(
                                      'الكل',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : CategoryWidget(
                              onTap: () {
                                _homeScreenController.onCategoryTapped(
                                    index: index - 1);
                              },
                              image: _homeScreenController.categories[index - 1]
                                  ['image']!,
                              name: _homeScreenController.categories[index - 1]
                                  ['name']!,
                              isSelected: index - 1 == selectedCategoryIndex,
                            ),
                    ),
                  ),
                ),
                15.verticalSpace,
                Row(
                  children: [
                    const Spacer(),
                    Selector<HomeScreenController, bool>(
                      selector: (_, value) => value.horizontalDisplay,
                      builder: (_, horizontalDisplay, __) => InkWell(
                        onTap: _homeScreenController.toggleDisplay,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                '${Constants.assetsVectorsPath}display-option.svg',
                              ),
                              10.horizontalSpace,
                              Text(
                                horizontalDisplay
                                    ? 'تغيير عرض المنتجات الي عمودي'
                                    : 'تغيير عرض المنتجات الي افقي',
                                style: TextStyle(
                                  color: const Color(0xffFF4155),
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                Selector<HomeScreenController, bool>(
                  selector: (_, value) => value.nProducts,
                  builder: (_, nProducts, __) => _homeScreenController.isLoading
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Center(
                            child: SpinKitFadingCube(
                              color: Theme.of(context).primaryColor,
                              size: 20.r,
                            ),
                          ),
                        )
                      : _homeScreenController.isLoadingFailed
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Center(
                                child: InkWell(
                                  onTap: _homeScreenController.refreshProducts,
                                  child: Icon(
                                    CupertinoIcons.refresh_circled_solid,
                                    size: 30.h,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          : _homeScreenController.products.isEmpty
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: const Center(
                                    child: Text(
                                      'لا يوجد منتجات',
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height:
                                      _homeScreenController.horizontalDisplay
                                          ? 100.h
                                          : null,
                                  child: ListView.separated(
                                    itemCount:
                                        _homeScreenController.products.length,
                                    shrinkWrap: !_homeScreenController
                                        .horizontalDisplay,
                                    physics: _homeScreenController
                                            .horizontalDisplay
                                        ? null
                                        : const NeverScrollableScrollPhysics(),
                                    scrollDirection:
                                        _homeScreenController.horizontalDisplay
                                            ? Axis.horizontal
                                            : Axis.vertical,
                                    separatorBuilder: (_, index) =>
                                        10.verticalSpace,
                                    itemBuilder: (_, index) => SizedBox(
                                      width: _homeScreenController
                                              .horizontalDisplay
                                          ? 200.w
                                          : null,
                                      child: ProductWidget(
                                        product: _homeScreenController
                                            .products[index],
                                      ),
                                    ),
                                  ),
                                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
