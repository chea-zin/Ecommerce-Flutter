import 'package:ecommerce_rupp/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/wishlist_controller.dart';

class WishlistPage extends StatelessWidget {
  final WishlistController controller = Get.put(WishlistController());
  final VoidCallback? onNavigateToCategories;

  WishlistPage({super.key, this.onNavigateToCategories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.wishlistItems.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/wishlist.png', width: 250, height: 250),
                  const Text(
                    'Your Wishlist is Empty!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Looks like you have not added anything to your wishlist. Go ahead and explore top categories.',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to categories or explore page
                    },
                    child: const Text(
                      'Explore categories now!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 70, right: 10, left: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "My Wishlist",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Product list section
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.wishlistItems.length,
                    itemBuilder: (context, index) {
                      final product = controller.wishlistItems[index];
                      return WishlistProductCard(
                        product: product,
                        onRemove: () =>
                            controller.removeFromWishlist(product.id),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

class WishlistProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const WishlistProductCard({
    super.key,
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
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
            width: 120,
            height: 120,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${product.price} ",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_shopping_cart_outlined, color: Color(0xFF964B00),  size: 35)),
                    const SizedBox(height: 18),
                IconButton(
                  onPressed: () {
                    _showRemoveConfirmationDialog(context, onRemove);
                  },
                  icon: const Icon(Icons.delete_outline, color: Colors.red, size: 35,),
                ),
              ]
              )
            )
        ],
      ),
    );
  }
}

void _showRemoveConfirmationDialog(
    BuildContext context, VoidCallback onRemove) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 50, left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_amber_rounded,
                size: 50, color: Colors.red),
            const SizedBox(height: 10),
            const Text(
              "Remove from Wishlist?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Are you sure you want to remove this item from your wishlist?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        onRemove(); //Remove item from wishlist
                        Navigator.pop(context); //close the dialog
                      },
                      child: Text(
                        'Remove',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black87),
                      )),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
