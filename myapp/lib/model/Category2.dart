class Category2 {
  final int id;
  final String name;
  final String imageUrl;

  const Category2({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Category2.fromJson(Map<String, dynamic> json) {
    return Category2(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  @override
  String toString() => 'Category(id: $id, name: $name, imageUrl: $imageUrl)';
}

// Assuming you have a list of JSON data
List<Category2> categories = [];

void parseCategories(List<dynamic> jsonData) {
  categories = jsonData.map((data) => Category2.fromJson(data)).toList();
}

void main() {
  // Replace with your actual JSON data
  final jsonData = [
    {
      "id": 1,
      "name": "Frash Fruits & Vegetable",
      "imageUrl": "https://food.unl.edu/food-calendar/fresh-fruit-vegetables-month.png"
    },
    // ... other JSON objects
  ];

  parseCategories(jsonData);

  // Now you can access the parsed categories:
  for (var category in categories) {
    print(category);
  }
}
