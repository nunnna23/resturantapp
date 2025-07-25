import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmobileapp/providers/cartprovidor.dart';
// ignore: unused_import
import 'package:restaurantmobileapp/models/fooditem.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // لتحديد العناصر المختارة (كلها مختارة افتراضياً)
  late List<bool> selected;
  late List<int> quantities;
  String promoCode = '';
  double discount = 0;

  @override
  void initState() {
    super.initState();
    final cart = Provider.of<CartProvider>(context, listen: false);
    selected = List.generate(cart.cart.length, (_) => true);
    quantities = List.generate(cart.cart.length, (_) => 1);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    // تحديث القوائم إذا تغيرت السلة
    if (selected.length != cart.cart.length) {
      selected = List.generate(cart.cart.length, (_) => true);
      quantities = List.generate(cart.cart.length, (_) => 1);
    }

    double subtotal = 0;
    for (int i = 0; i < cart.cart.length; i++) {
      if (selected[i]) {
        subtotal += cart.cart[i].price * quantities[i];
      }
    }
    double deliveryFee = 0;
    double total = subtotal + deliveryFee - discount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: cart.cart.isEmpty
          ? const Center(child: Text('Cart is empty'))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان وموقع التوصيل
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Delivery Location",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.orange,
                            side: const BorderSide(color: Colors.orange),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Change Location"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // كود الخصم
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Promo Code...",
                              prefixIcon: const Icon(
                                Icons.discount,
                                color: Colors.orange,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(
                                  color: Colors.orange.shade100,
                                ),
                              ),
                            ),
                            onChanged: (v) => promoCode = v,
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              // خصم تجريبي
                              if (promoCode.trim().toLowerCase() ==
                                  "discount10") {
                                discount = subtotal * 0.2;
                              } else {
                                discount = 0;
                              }
                            });
                          },
                          child: const Text("Apply"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // عناصر السلة
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cart.cart.length,
                      itemBuilder: (context, i) {
                        final item = cart.cart[i];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // Checkbox
                                Checkbox(
                                  value: selected[i],
                                  activeColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  onChanged: (v) {
                                    setState(() => selected[i] = v ?? true);
                                  },
                                ),
                                // صورة
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    item.imageUrl,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                // اسم وسعر وكمية
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "\$ ${item.price.toStringAsFixed(0)}",
                                        style: const TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.orange,
                                            ),
                                            onPressed: quantities[i] > 1
                                                ? () => setState(
                                                    () => quantities[i]--,
                                                  )
                                                : null,
                                            iconSize: 22,
                                            padding: EdgeInsets.zero,
                                          ),
                                          Text(
                                            '${quantities[i]}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.orange,
                                            ),
                                            onPressed: () =>
                                                setState(() => quantities[i]++),
                                            iconSize: 22,
                                            padding: EdgeInsets.zero,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // زر حذف
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      cart.removeFromCart(item);
                                      selected.removeAt(i);
                                      quantities.removeAt(i);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    // ملخص الدفع
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Payment Summary",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _summaryRow(
                            "Total Items (${selected.where((v) => v).length})",
                            "\$${subtotal.toStringAsFixed(0)}",
                          ),
                          _summaryRow(
                            "Delivery Fee",
                            deliveryFee == 0
                                ? "Free"
                                : "\$${deliveryFee.toStringAsFixed(0)}",
                          ),
                          _summaryRow(
                            "Discount",
                            discount > 0
                                ? "-\$${discount.toStringAsFixed(0)}"
                                : "-",
                          ),
                          const Divider(),
                          _summaryRow(
                            "Total",
                            "\$${total.toStringAsFixed(0)}",
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // زر الدفع (Checkout)
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
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
                          // تنفيذ الدفع
                        },
                        child: const Text('Checkout'),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
