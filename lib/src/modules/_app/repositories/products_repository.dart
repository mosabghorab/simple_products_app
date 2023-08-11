import 'package:simple_products_app/src/modules/_app/data_sources/local_data_source/shared_pref_source/products_service.dart';
import 'package:simple_products_app/src/modules/_app/models/entities/product.dart';

class ProductsRepository {
  static ProductsRepository? _instance;
  late final ProductsService _productsService = ProductsService.instance;

  // private constructor.
  ProductsRepository._();

  // singleton pattern.
  static ProductsRepository get instance =>
      _instance ?? (_instance = ProductsRepository._());

/////////////////////////////////////////////////////////////////////////////////

  // get all products.
  List<Product>? getProducts() {
    return _productsService.getProducts();
  }

  // add product.
  Future<void> addProduct({
    required String name,
    required num price,
    required List<String> images,
    required String storeName,
    required String categoryName,
  }) async {
    await _productsService.addProduct(
      name: name,
      price: price,
      images: images,
      storeName: storeName,
      categoryName: categoryName,
    );
  }
}
