import '../../../../core/result.dart';
import '../../../../domain/models/product/product.dart';


abstract class CatalogRepository {
  Future<Result<List<Product>>> getProducts();
}
