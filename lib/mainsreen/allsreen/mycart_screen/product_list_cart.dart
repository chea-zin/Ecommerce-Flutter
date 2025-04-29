import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/mycart_controller.dart';
import '../../../models/products.dart';

class ProductListCart extends StatelessWidget {
  final Product product;
  final int index;
  final MyCartController controller =
      Get.find(); // Use Get.find() to access the controller

  ProductListCart({
    super.key,
    required this.product,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    // Get the current quantity from the controller
    final quantity = controller.itemQuantities[product.id] ?? 1;
    final totalPrice = product.price * quantity; // This ensures double result
    return Card(
      elevation: 0.1,
      shadowColor: Colors.white,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$$totalPrice", // Simplified price display
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            //update the quantity in the cartItems list
                            controller.updateQuantity(product.id, quantity-1);
                          }
                        },
                        icon: Icon(Icons.remove, size: 22),
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        onPressed: () {
                          //update the quantity in the cartItems list
                          controller.updateQuantity(product.id, quantity+1);
                        },
                        icon: Icon(Icons.add, size: 22),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.check_box, color: Color(0xFF964B00)),
              ),
              const SizedBox(height: 25),
              IconButton(
                onPressed: () {
                  controller.removeFromCart(index);
                },
                icon: Icon(Icons.delete_outline, color: Colors.blueGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
