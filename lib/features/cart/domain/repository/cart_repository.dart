import '../../../../core/result.dart';
import '../../../../domain/models/product/product.dart';
import '../../cart_export.dart';


abstract class CartRepository {
  Future<Result<List<CartItem>>> addToCart({
    required Product product,
    required int quantity,
    required List<CartItem> currentItems,
  });

  Future<Result<List<CartItem>>> removeFromCart({
    required String productId,
    required List<CartItem> currentItems,
  });

  Future<Result<List<CartItem>>> updateQuantity({
    required String productId,
    required int quantity,
    required List<CartItem> currentItems,
  });

  Future<Result<void>> finalizeCart({
    required List<CartItem> currentItems,
  });
}
