import 'package:flutter/material.dart';
import 'detail_page.dart';

class Product {
  final String name;
  final String image;
  final String price;
  final String description;
  final Map<String, String> about;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.about,
  });
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = "";

  List<Product> items = [
    Product(
      name: "KC Copper Handi Set",
      image: "https://m.media-amazon.com/images/I/41JFqcmG-KL.jpg",
      price: "₹1499",
      description: "Copper Bottom Handi set 5 pieces",
      about: {"Material": "Copper", "Brand": "KC"},
    ),
    Product(
      name: "Tramontina Cookware",
      image: "https://m.media-amazon.com/images/I/31HL+AbsCxL.jpg",
      price: "₹2999",
      description: "Ceramic non-stick cookware set",
      about: {"Material": "Ceramic"},
    ),
    Product(
      name: "Milton Pro Cook Set",
      image: "https://m.media-amazon.com/images/I/711stZJUuFL.jpg",
      price: "₹2199",
      description: "Non-stick aluminium cookware set",
      about: {"Material": "Aluminium"},
    ),
    Product(
      name: "Wooden Spoon Set",
      image: "https://m.media-amazon.com/images/I/41TWz5MKhbL.jpg",
      price: "₹699",
      description: "7 pcs wooden kitchen tools",
      about: {"Material": "Wood"},
    ),
    Product(
      name: "Pigeon Gift Set",
      image: "https://m.media-amazon.com/images/I/31dJEUhp+5L.jpg",
      price: "₹1899",
      description: "7 piece cookware set",
      about: {"Brand": "Pigeon"},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var filtered = items
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.orange],
            ),
          ),
          child: Column(
            children: [
              Text(
                "Kitchen Store",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (v) => setState(() => query = v),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search products...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: filtered.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, i) {
              final p = filtered[i];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailPage(product: p)),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.orange.shade50],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.network(p.image, fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              p.name,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                p.price,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
