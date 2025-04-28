import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutReviewItem extends StatelessWidget {
  const CheckoutReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Items',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        itemCount: 2, // Replace with your actual item count
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/image/product2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name and Edit Button
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'M6 Smart watch IP67 Waterproof',
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle edit action
                            },
                            icon: const Icon(Icons.edit, size: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Price
                      Text(
                        '\$15.25',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Discounted Price
                      Text(
                        '\$20.00',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Quantity Selector
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle decrease quantity
                            },
                            icon: const Icon(Icons.remove, size: 20),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '1',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              // Handle increase quantity
                            },
                            icon: const Icon(Icons.add, size: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
