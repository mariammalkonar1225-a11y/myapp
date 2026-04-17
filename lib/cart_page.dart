import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String payment = "UPI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(title: Text("Item 1"), subtitle: Text("₹1299")),
                ListTile(title: Text("Item 2"), subtitle: Text("₹699")),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                RadioListTile(
                  value: "UPI",
                  groupValue: payment,
                  title: Text("UPI Payment"),
                  onChanged: (v) => setState(() => payment = v.toString()),
                ),
                RadioListTile(
                  value: "COD",
                  groupValue: payment,
                  title: Text("Cash on Delivery"),
                  onChanged: (v) => setState(() => payment = v.toString()),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Place Order")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
