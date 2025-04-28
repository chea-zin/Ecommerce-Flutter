import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/mycart_controller.dart';


class ProductListCart extends StatelessWidget {
  final String image;
  final String name;
  final double originalPrice;
  final double discountPrice;
  final int itemCount; // This will be passed from my carts
  final int index;
  final MyCartController controller = Get.find(); // Use Get.find() to access the controller

  ProductListCart({
    super.key,
    required this.image,
    required this.name,
    required this.originalPrice,
    required this.discountPrice,
    required this.itemCount,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    // The current item count is now an observable value in the controller
    RxInt currentCount = RxInt(itemCount);

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
                image: AssetImage(image),
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
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                      "\$${(discountPrice * currentCount.value).toStringAsFixed(2)}", // Updated price
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    )),
                    const SizedBox(height: 3),
                    Obx(() => Text(
                      "\$${(originalPrice * currentCount.value).toStringAsFixed(2)}", // Updated original price
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )),
                  ],
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
                          if (currentCount.value > 1) {
                            currentCount.value--;
                            //update the quantity in the cartItems list
                            controller.cartItems[index]["quantity"] = currentCount.value;
                            // Update total price in the controller
                            controller.updateTotalPrice(controller.cartItems);
                          }
                        },
                        icon: Icon(Icons.remove, size: 22),
                      ),
                      Obx(() => Text(currentCount.value.toString())), // Display current item count
                      IconButton(
                        onPressed: () {
                          currentCount.value++;
                          //update the quantity in the cartItems list
                          controller.cartItems[index]["quantity"] = currentCount.value;
                          // Update total price in the controller
                          controller.updateTotalPrice(controller.cartItems);
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

