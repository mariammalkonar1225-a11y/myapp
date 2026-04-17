import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  int rating = 0;
  TextEditingController controller = TextEditingController();
  List<Map> reviews = [];

  Widget stars() {
    return Row(
      children: List.generate(5, (i) {
        return IconButton(
          icon: Icon(
            Icons.star,
            color: i < rating ? Colors.orange : Colors.grey,
          ),
          onPressed: () => setState(() => rating = i + 1),
        );
      }),
    );
  }

  void add() {
    if (controller.text.isEmpty || rating == 0) return;

    setState(() {
      reviews.add({"text": controller.text, "stars": rating});
      controller.clear();
      rating = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reviews")),
      body: Column(
        children: [
          stars(),
          TextField(controller: controller),
          ElevatedButton(onPressed: add, child: Text("Submit")),

          Expanded(
            child: ListView(
              children: reviews.map((r) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(r["text"]),
                    subtitle: Row(
                      children: List.generate(
                        r["stars"],
                        (i) => Icon(Icons.star, color: Colors.orange, size: 16),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
