import 'package:flutter/cupertino.dart';
import 'package:simple_products_app/src/managers/navigation_manager.dart';
import 'package:simple_products_app/src/modules/_app/app_router.dart';
import 'package:simple_products_app/src/modules/_app/models/entities/product.dart';
import 'package:simple_products_app/src/modules/_app/repositories/products_repository.dart';

class HomeScreenController with ChangeNotifier {
  // notifiable.
  int? _selectedCategoryIndex;
  bool _nProducts = false;
  bool _horizontalDisplay = false;

  int? get selectedCategoryIndex => _selectedCategoryIndex;

  set selectedCategoryIndex(int? value) {
    _selectedCategoryIndex = value;
    notifyListeners();
  }

  bool get nProducts => _nProducts;

  void notifyProducts() {
    _nProducts = !_nProducts;
    notifyListeners();
  }

  bool get horizontalDisplay => _horizontalDisplay;

  void toggleDisplay() {
    _horizontalDisplay = !_horizontalDisplay;
    notifyListeners();
    notifyProducts();
  }

  // flags.
  bool isLoading = true;
  bool isLoadingFailed = false;

  // repositories.
  late final ProductsRepository _productsRepository =
      ProductsRepository.instance;

  // products.
  List<Product> products = [];

  // categories.
  List<Map<String, String>> categories = [
    {
      'name': 'التصنيف الثالث',
      'image':
          'https://images.pexels.com/photos/1667071/pexels-photo-1667071.jpeg?auto=compress&cs=tinysrgb&w=1200',
    },
    {
      'name': 'التصنيف الثاني',
      'image':
          'https://images.pexels.com/photos/3735655/pexels-photo-3735655.jpeg?auto=compress&cs=tinysrgb&w=1200',
    },
    {
      'name': 'التصنيف الأول',
      'image':
          'https://images.pexels.com/photos/3735149/pexels-photo-3735149.jpeg?auto=compress&cs=tinysrgb&w=1200',
    },
  ];

  // constructor.
  HomeScreenController() {
    getProducts();
  }

  // get products.
  void getProducts({
    bool notifyLoading = false,
  }) async {
    try {
      if (notifyLoading) {
        isLoading = true;
        isLoadingFailed = false;
        notifyProducts();
      }
      await Future.delayed(const Duration(seconds: 1));
      products = _productsRepository.getProducts() ?? [];
      isLoading = false;
      notifyProducts();
    } catch (error) {
      // error.
      debugPrint('error : $error');
      isLoadingFailed = true;
      isLoading = false;
      notifyProducts();
    }
  }

  // refresh products.
  Future<void> refreshProducts() async {
    getProducts(notifyLoading: true);
  }

  // on category tapped.
  void onCategoryTapped({
    int? index,
  }) {
    selectedCategoryIndex = index;
    if (selectedCategoryIndex == null) {
      products = _productsRepository.getProducts() ?? [];
    } else {
      products = _productsRepository.getProducts() ?? [];
      products = products.any((element) =>
              element.categoryName ==
              categories[selectedCategoryIndex!]['name'])
          ? products
              .where((element) =>
                  element.categoryName ==
                  categories[selectedCategoryIndex!]['name'])
              .toList()
          : [];
    }
    notifyProducts();
  }

  // navigate to add product screen.
  void navigateToAddProductScreen() {
    N.toNamed(AppRouter.addProductScreen);
  }
}
