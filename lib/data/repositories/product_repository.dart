import '../../core/result.dart';
import '../../domain/models/product.dart';

class ProductRepository {
  Future<Result<List<Product>>> getProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 1)); 

      return ResultHelper.success(_mockProducts);
    } catch (e) {
      return ResultHelper.success(_mockProducts);
    }
  }

  final List<Product> _mockProducts = [
    Product(
      id: '1',
      name: 'Flutter T-Shirt',
      price: 29.99,
      imageUrl: 'https://storage.googleapis.com/cms-storage-bucket/a9d6ce81aee44ae017ee.png', 
      description: 'Uma camisa legal do Flutter',
    ),
    Product(
      id: '2',
      name: 'Dart Coffee Mug',
      price: 15.50,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
      description: 'Caneca para programadores',
    ),
    Product(
      id: '3',
      name: 'MacBook Pro',
      price: 1299.00,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg',
      description: 'Ferramenta de trabalho',
    ),
    Product(
      id: '4',
      name: 'Monitor Ultrawide',
      price: 499.00,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/e/e8/Svg_example3.svg',
      description: 'Para ver mais código',
    ),
  ];
}

extension ResultHelper<T> on Result<T> {
  static Result<T> success<T>(T value) => Success(value);
  static Result<T> failure<T>(Exception error) => Failure(error);
}
