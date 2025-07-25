import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmobileapp/providers/cartprovidor.dart';
import '../models/fooditem.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodItem item;
  const FoodDetailsScreen({super.key, required this.item});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    // ignore: unused_local_variable
    final total = widget.item.price * quantity;

    return Scaffold(
      backgroundColor: const Color(0xffFFF8F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // صورة كبيرة
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                widget.item.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 18),
            // اسم الأكلة والسعر
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$ ${widget.item.price.toStringAsFixed(0)}",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // تفاصيل إضافية
                  Row(
                    children: const [
                      Icon(
                        Icons.local_shipping,
                        color: Colors.orange,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text('Free Delivery', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 16),
                      Icon(Icons.timer, color: Colors.orange, size: 18),
                      SizedBox(width: 4),
                      Text('20 - 30', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 16),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      SizedBox(width: 4),
                      Text('4.5', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 18),
                  // اختيار الكمية
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.orange,
                            ),
                            onPressed: quantity > 1
                                ? () => setState(() => quantity--)
                                : null,
                          ),
                          Text(
                            '$quantity',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.orange,
                            ),
                            onPressed: () => setState(() => quantity++),
                          ),
                        ],
                      ),
                      // السعر الإجمالي
                      Text(
                        "\$ ${(widget.item.price * quantity).toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // زر إضافة إلى العربة
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        for (int i = 0; i < quantity; i++) {
                          cart.addToCart(widget.item);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${widget.item.name} added to cart!'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 24,
                      ),
                      label: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
