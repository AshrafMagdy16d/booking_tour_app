class Tour {
  final int id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  Tour({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'description': description,
    };
  }

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    );
  }
}
