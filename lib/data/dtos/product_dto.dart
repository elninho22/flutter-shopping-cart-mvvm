class RatingDto {
  final double rate;
  final int count;

  RatingDto({required this.rate, required this.count});

  factory RatingDto.fromJson(Map<String, dynamic> json) => RatingDto(
        rate: (json['rate'] as num).toDouble(),
        count: (json['count'] as num).toInt(),
      );
}

class ProductDto {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingDto? rating;

  ProductDto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        id: json['id'] as int,
        title: json['title'] as String,
        price: (json['price'] as num).toDouble(),
        description: json['description'] as String? ?? '',
        category: json['category'] as String? ?? '',
        image: json['image'] as String,
        rating: json['rating'] != null
            ? RatingDto.fromJson(json['rating'] as Map<String, dynamic>)
            : null,
      );
}