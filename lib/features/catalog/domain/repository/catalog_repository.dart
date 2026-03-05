import '../../../../core/result.dart';
import '../../../../exports.dart';

abstract class CatalogRepository {
  Future<Result<List<CatalogModel>>> getProducts();
}
