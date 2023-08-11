import 'package:simple_products_app/src/managers/shared_preferences_manager.dart';
import 'package:simple_products_app/src/modules/_app/models/entities/product.dart';

class ProductsService {
  static ProductsService? _instance;
  late final SharedPreferencesManager _sharedPreferencesManager =
      SharedPreferencesManager.instance;

  // private constructor.
  ProductsService._();

  // singleton pattern.
  static ProductsService get instance =>
      _instance ?? (_instance = ProductsService._());

/////////////////////////////////////////////////////////////////////////////////

  // get all products.
  List<Product>? getProducts() {
    return _sharedPreferencesManager.getProducts();
  }

  // add product.
  Future<void> addProduct({
    required String name,
    required num price,
    required List<String> images,
    required String storeName,
    required String categoryName,
  }) async {
    List<Product> products = getProducts() ?? [];
    products.add(
      Product(
        name: name,
        price: price,
        images: images,
        storeName: storeName,
        categoryName: categoryName,
      ),
    );
    await _sharedPreferencesManager.setProducts(products);
  }
}
