import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_fade/image_fade.dart';
import 'package:provider/provider.dart';
import 'package:simple_products_app/src/config/constants.dart';
import 'package:simple_products_app/src/modules/_app/ui/screens/add_product_screen/add_product_screen_controller.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/custom_app_bar_widget.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/custom_button_widget.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/custom_text_field_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // controller.
  late final AddProductScreenController _addProductScreenController =
      context.read<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'اضافة منتج',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'صور المنتج',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              5.verticalSpace,
              Selector<AddProductScreenController, bool>(
                selector: (_, value) => value.nImages,
                builder: (_, nImages, __) => _addProductScreenController
                        .images.isEmpty
                    ? const SizedBox()
                    : SizedBox(
                        height: 100.h,
                        child: ListView.separated(
                          itemCount: _addProductScreenController.images.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, index) => 5.horizontalSpace,
                          itemBuilder: (_, index) => Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: ImageFade(
                                  height: 80.h,
                                  width: 80.h,
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    _addProductScreenController.images[index],
                                  ),
                                  duration: const Duration(milliseconds: 900),
                                  syncDuration:
                                      const Duration(milliseconds: 150),
                                  alignment: Alignment.center,
                                  loadingBuilder:
                                      (context, progress, chunkEvent) => Center(
                                    child: SizedBox(
                                      width: 15.h,
                                      height: 15.h,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  errorBuilder: (context, error) => Center(
                                    child: Icon(
                                      Icons.broken_image_rounded,
                                      color: Colors.black,
                                      size: 25.h,
                                    ),
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                end: 5.w,
                                top: 5.h,
                                child: InkWell(
                                  onTap: () {
                                    _addProductScreenController.removeImage(
                                        index: index);
                                  },
                                  child: SvgPicture.asset(
                                    '${Constants.assetsVectorsPath}close.svg',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
              15.verticalSpace,
              InkWell(
                onTap: _addProductScreenController.pickImages,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 11.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          '${Constants.assetsVectorsPath}add-square.svg',
                          color: Colors.white,
                        ),
                        10.horizontalSpace,
                        Text(
                          'اضغط لاضافة الصور',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Form(
                key: _addProductScreenController.formKey,
                child: Column(
                  children: [
                    CustomTextFieldWidget(
                      title: 'اسم المنتج',
                      hintText: 'اسم المنتج',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'اسم المنتج مطلوب';
                        }
                        return null;
                      },
                      onSaved: (value) =>
                          _addProductScreenController.name = value!.trim(),
                    ),
                    15.verticalSpace,
                    CustomTextFieldWidget(
                      title: 'اسم المتجر',
                      hintText: 'اسم المتجر',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'اسم المتجر مطلوب';
                        }
                        return null;
                      },
                      onSaved: (value) =>
                          _addProductScreenController.storeName = value!.trim(),
                    ),
                    15.verticalSpace,
                    CustomTextFieldWidget(
                      title: 'السعر',
                      hintText: 'السعر',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'السعر مطلوب';
                        }
                        return null;
                      },
                      onSaved: (value) => _addProductScreenController.price =
                          num.parse(value!.trim()),
                    ),
                    15.verticalSpace,
                    CustomTextFieldWidget(
                      onTap: _addProductScreenController.selectCategory,
                      controller: _addProductScreenController
                          .categoryNameTextEditingController,
                      title: 'التصنيف',
                      hintText: 'التصنيف',
                      keyboardType: TextInputType.number,
                      suffix: Padding(
                        padding: EdgeInsets.all(8.h),
                        child: SvgPicture.asset(
                          '${Constants.assetsVectorsPath}arrow-circle-down.svg',
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'التصنيف مطلوب';
                        }
                        return null;
                      },
                      onSaved: (value) => _addProductScreenController
                          .categoryName = value!.trim(),
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
              CustomButtonWidget(
                title: 'اضافة المنتج',
                onTap: _addProductScreenController.addProduct,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
