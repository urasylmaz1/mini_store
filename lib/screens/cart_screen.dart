import 'package:flutter/material.dart';
import '../data/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Cart.items;

    return Scaffold(
      appBar: AppBar(title: Text("Sepet", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36))),
      body: cartItems.isEmpty
          ? Center(child: Text("Sepet boş", style: TextStyle(fontSize: 18)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (_, index) {
                      final item = cartItems[index];

                      return ListTile(
                        title: Text(item.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle:
                            Text("${item.price} ${item.currency}", style: TextStyle(fontSize: 16)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              Cart.remove(item);
                            });

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              SnackBar(
                                  content: Text("Ürün silindi")),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Toplam",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                      Text(
                        "\$${Cart.totalPrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}