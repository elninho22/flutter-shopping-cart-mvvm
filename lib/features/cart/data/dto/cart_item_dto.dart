class CartItemDto {
  final String productId;
  final int quantity;

  CartItemDto({
    required this.productId,
    required this.quantity,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) => CartItemDto(
      productId: json['productId'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
      };
}