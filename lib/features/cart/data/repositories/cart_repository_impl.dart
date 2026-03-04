import '../../../../core/result.dart';
import '../../../../exports.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService _service;

  CartRepositoryImpl(this._service);

  @override
  Future<Result<CartItemDto>> addProduct({required String productId}) async {
    try {
      final result = await _service.addProduct(productId);
      return Success(result);
    } on RestClientException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(Exception('Erro ao adicionar produto.'));
    }
  }

  @override
  Future<Result<void>> removeProduct({required String productId}) async {
    try {
      await _service.addProduct(productId);
      return const Success(null);
    } on RestClientException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(Exception('Erro ao remover produto.'));
    }
  }
}
