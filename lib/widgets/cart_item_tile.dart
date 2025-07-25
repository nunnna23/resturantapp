import 'package:flutter/material.dart';
import 'package:restaurantmobileapp/models/fooditem.dart';
import 'package:restaurantmobileapp/providers/cartprovidor.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  final FoodItem item;
  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Card(
      child: ListTile(
        leading: Image.network(
          item.imageUrl,
          width: 50,
          height: 50,
          errorBuilder: (_, __, ___) => const Icon(Icons.fastfood),
        ),
        title: Text(item.name),
        subtitle: Text('${item.price.toStringAsFixed(2)} \$'),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle),
          onPressed: () => cart.removeFromCart(item),
        ),
      ),
    );
  }
}
