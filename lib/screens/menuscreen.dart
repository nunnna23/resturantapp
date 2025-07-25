// import 'package:flutter/material.dart';
// import 'package:restaurantmobileapp/models/fooditem.dart';
// import 'package:restaurantmobileapp/providers/cartprovidor.dart';
// import 'package:provider/provider.dart';
// import 'food_details_screen.dart';

// class MenuScreen extends StatelessWidget {
//   const MenuScreen({super.key});

//   static final List<FoodItem> foods = [
//     FoodItem(
//       name: 'Ordinary Burgers',
//       price: 17230,
//       imageUrl:
//           'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg',
//     ),
//     FoodItem(
//       name: 'Burger With Meat',
//       price: 17230,
//       imageUrl:
//           'https://images.pexels.com/photos/1639561/pexels-photo-1639561.jpeg',
//     ),
//     FoodItem(
//       name: 'Cheese Burger',
//       price: 18000,
//       imageUrl:
//           'https://images.pexels.com/photos/1639563/pexels-photo-1639563.jpeg',
//     ),
//     FoodItem(
//       name: 'Double Burger',
//       price: 20000,
//       imageUrl:
//           'https://images.pexels.com/photos/1639564/pexels-photo-1639564.jpeg',
//     ),
//     FoodItem(
//       name: 'Chicken Burger',
//       price: 15000,
//       imageUrl:
//           'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg',
//     ),
//     FoodItem(
//       name: 'Veggie Burger',
//       price: 14000,
//       imageUrl:
//           'https://images.pexels.com/photos/1435906/pexels-photo-1435906.jpeg',
//     ),
//     FoodItem(
//       name: 'Spicy Burger',
//       price: 16000,
//       imageUrl:
//           'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
//     ),
//     FoodItem(
//       name: 'Classic Burger',
//       price: 15500,
//       imageUrl:
//           'https://images.pexels.com/photos/161674/appetite-beef-big-bread-161674.jpeg',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffFFF8F0),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text('Menu', style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart, color: Colors.orange),
//             onPressed: () => Navigator.pushNamed(context, '/cart'),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           // Banner/Header
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.orange.shade100,
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Row(
//                 children: [
//                   // صورة بانر
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(24),
//                     child: Image.network(
//                       'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg',
//                       width: 110,
//                       height: 110,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   // نص ترحيبي
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Provide the best food for you",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.orange,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "All the best restaurants with their top menu waiting for you, they can't wait for your order!!",
//                           style: TextStyle(fontSize: 13, color: Colors.black54),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           // المنتجات في Grid
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: foods.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 18,
//                 crossAxisSpacing: 12,
//                 childAspectRatio: 0.75,
//               ),
//               itemBuilder: (context, i) => FoodGridItem(item: foods[i]),
//             ),
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }

// class FoodGridItem extends StatelessWidget {
//   final FoodItem item;
//   const FoodGridItem({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context, listen: false);

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => FoodDetailsScreen(item: item)),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(22),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.orange.withOpacity(0.08),
//               blurRadius: 12,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // صورة أكل فقط
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Image.network(
//                   item.imageUrl,
//                   width: double.infinity,
//                   height: 90,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     color: Colors.grey[200],
//                     height: 90,
//                     child: const Icon(
//                       Icons.fastfood,
//                       color: Colors.orange,
//                       size: 40,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // اسم الأكلة
//               Text(
//                 item.name,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 6),
//               // تقييم والمسافة
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(Icons.star, color: Colors.orange, size: 16),
//                   SizedBox(width: 2),
//                   Text('4.9', style: TextStyle(fontSize: 13)),
//                   SizedBox(width: 8),
//                   Icon(Icons.location_on, color: Colors.orange, size: 15),
//                   SizedBox(width: 2),
//                   Text('190m', style: TextStyle(fontSize: 13)),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               // السعر
//               Text(
//                 "\$ ${item.price.toStringAsFixed(0)}",
//                 style: const TextStyle(
//                   color: Colors.orange,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               const Spacer(),
//               // زر إضافة إلى العربة
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     elevation: 0,
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     textStyle: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {
//                     cart.addToCart(item);
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${item.name} added to cart!'),
//                         duration: const Duration(seconds: 1),
//                       ),
//                     );
//                   },
//                   icon: const Icon(
//                     Icons.add_shopping_cart,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   label: const Text(
//                     'Add to Cart',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:restaurantmobileapp/models/fooditem.dart';
import 'package:restaurantmobileapp/providers/cartprovidor.dart';
import 'package:provider/provider.dart';
import 'food_details_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static final List<FoodItem> foods = [
    FoodItem(
      name: 'Ordinary Burgers',
      price: 17230,
      imageUrl:
          'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg',
    ),
    FoodItem(
      name: 'Burger With Meat',
      price: 17230,
      imageUrl:
          'https://images.pexels.com/photos/1639561/pexels-photo-1639561.jpeg',
    ),
    FoodItem(
      name: 'Cheese Burger',
      price: 18000,
      imageUrl:
          'https://images.pexels.com/photos/1639563/pexels-photo-1639563.jpeg',
    ),
    FoodItem(
      name: 'Double Burger',
      price: 20000,
      imageUrl:
          'https://images.pexels.com/photos/1639564/pexels-photo-1639564.jpeg',
    ),
    FoodItem(
      name: 'Chicken Burger',
      price: 15000,
      imageUrl:
          'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg',
    ),
    FoodItem(
      name: 'Veggie Burger',
      price: 14000,
      imageUrl:
          'https://images.pexels.com/photos/1435906/pexels-photo-1435906.jpeg',
    ),
    FoodItem(
      name: 'Spicy Burger',
      price: 16000,
      imageUrl:
          'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
    ),
    FoodItem(
      name: 'Classic Burger',
      price: 15500,
      imageUrl:
          'https://images.pexels.com/photos/161674/appetite-beef-big-bread-161674.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Menu', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.orange),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Banner/Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  // صورة بانر
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg',
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // نص ترحيبي
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Provide the best food for you",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "All the best restaurants with their top menu waiting for you, they can't wait for your order!!",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // المنتجات في Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, i) => FoodGridItem(item: foods[i]),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class FoodGridItem extends StatelessWidget {
  final FoodItem item;
  const FoodGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FoodDetailsScreen(item: item)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              // ✅  ***  الإصلاح هنا  ***
              color: Color.fromRGBO(255, 152, 0, 0.08),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة أكل فقط
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item.imageUrl,
                  width: double.infinity,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    height: 90,
                    child: const Icon(
                      Icons.fastfood,
                      color: Colors.orange,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // اسم الأكلة
              Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              // تقييم والمسافة
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  SizedBox(width: 2),
                  Text('4.9', style: TextStyle(fontSize: 13)),
                  SizedBox(width: 8),
                  Icon(Icons.location_on, color: Colors.orange, size: 15),
                  SizedBox(width: 2),
                  Text('190m', style: TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(height: 8),
              // السعر
              Text(
                "\$ ${item.price.toStringAsFixed(0)}",
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              // زر إضافة إلى العربة
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    cart.addToCart(item);

                    // ✅  ***  إصلاح إضافي هنا لضمان الأمان  ***
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} added to cart!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
