class ListProduct {
  int id;
  String name;
  String image;
  String description;
  String category;
  double price;

  List<double> rating = [];
  ListProduct({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
  });
}

List listproduct = [
  ListProduct(
    id: 1001,
    name: "Product 1",
    image: "https//",
    description: "product detail",
    category: "categori",
    price: 45.6,
    rating: [
      2.3,
      4.5,
      4.9,
    ],
  )
];
