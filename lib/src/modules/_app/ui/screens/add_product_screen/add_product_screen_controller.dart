import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:simple_products_app/src/config/core/enums.dart';
import 'package:simple_products_app/src/config/helpers.dart';
import 'package:simple_products_app/src/managers/navigation_manager.dart';
import 'package:simple_products_app/src/modules/_app/app_router.dart';
import 'package:simple_products_app/src/modules/_app/repositories/products_repository.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/pick_images_widget.dart';
import 'package:simple_products_app/src/modules/_app/ui/widgets/select_option_widget.dart';

class AddProductScreenController with ChangeNotifier {
  // notifiable.
  bool _nImages = false;

  bool get nImages => _nImages;

  void notifyImages() {
    _nImages = !_nImages;
    notifyListeners();
  }

  // repositories.
  late final ProductsRepository _productsRepository =
      ProductsRepository.instance;

  // form key.
  late final GlobalKey<FormState> formKey = GlobalKey();

  // text editing controller.
  late final TextEditingController categoryNameTextEditingController =
      TextEditingController();

  // images.
  List<File> images = [];

  // categories.
  List<String> categories = [
    'التصنيف الثالث',
    'التصنيف الثاني',
    'التصنيف الأول'
  ];

  // fields.
  String? name;
  num? price;
  String? image;
  String? storeName;
  String? categoryName;

  // constructor.
  AddProductScreenController();

  // add product.
  void addProduct() async {
    try {
      if (!formKey.currentState!.validate()) return;
      formKey.currentState!.save();
      if (images.isEmpty) {
        Helpers.showMessage(
            text: 'يجب اضافة صور للمنتج',
            messageType: MessageType.failureMessage);
        return;
      }
      Helpers.showLoading(title: 'جاري اضافة المنتج');
      await Future.delayed(const Duration(seconds: 1));
      await _productsRepository.addProduct(
        name: name!,
        price: price!,
        images: images.map((e) => e.path).toList(),
        storeName: storeName!,
        categoryName: categoryName!,
      );
      N.back();
      N.offAllNamed(AppRouter.homeScreen);
      Helpers.showMessage(
          text: 'تمت اضافة المنتج بنجاح',
          messageType: MessageType.successMessage);
    } catch (error) {
      // error.
      debugPrint('error : $error');
      N.back();
    }
  }

  // pick images.
  void pickImages() async {
    List<File>? images = await Helpers.bottomSheet(
      child: const PickImagesWidget(
          imageSelectionMode: ImageSelectionMode.multiple),
    );
    if (images != null && images.isNotEmpty) {
      this.images.addAll(images);
      notifyImages();
    }
  }

  // remove image.
  void removeImage({
    required int index,
  }) async {
    images.removeAt(index);
    notifyImages();
  }

  // select category.
  void selectCategory() {
    Helpers.bottomSheet(
      child: SelectOptionWidget(
        title: 'اختر التصنيف',
        options: categories
            .map((e) => {
                  'isSelected': e == categoryName,
                  'title': e,
                  'value': e,
                })
            .toList(),
        onOptionSelected: (List<dynamic> values) {
          categoryName = values.first;
          categoryNameTextEditingController.text = categoryName!;
        },
      ),
    );
  }

  // dispose.
  @override
  void dispose() {
    categoryNameTextEditingController.dispose();
    super.dispose();
  }
}
