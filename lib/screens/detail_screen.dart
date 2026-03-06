import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(product.image)),
            SizedBox(height: 10),
            Text("Price: ${product.price} ${product.currency}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Description:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Expanded(child: Scrollbar(child: SingleChildScrollView(child: Text(product.description, style: TextStyle(fontSize: 16))))),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Cart.items.add(product);
                });
              
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Sepete eklendi")),
                );
              },
              child: Text("Sepete Ekle"),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}