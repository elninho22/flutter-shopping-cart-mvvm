import '../../../../core/result.dart';
import '../../../../exports.dart';

abstract class CartRepository {
  Future<Result<CartItemDto>> addProduct({required String productId});
  Future<Result<void>> removeProduct({required String productId});
}
