import 'package:flutter/material.dart';
import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            product.image,
            height: 280,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  product.price,
                  style: TextStyle(fontSize: 18, color: Colors.orange),
                ),

                SizedBox(height: 10),
                Text(product.description),

                SizedBox(height: 15),
                Text("About", style: TextStyle(fontWeight: FontWeight.bold)),

                ...product.about.entries.map(
                  (e) => Text("${e.key}: ${e.value}"),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Added to Cart")));
                  },
                  child: Text("Add to Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
