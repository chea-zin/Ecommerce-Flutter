import 'package:ecommerce_rupp/models/products.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  // Observable list of wishlist items
  final wishlistItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Add a product to the wishlist
  void addToWishlist(Product product) {
    if (!wishlistItems.any((item)=> item.id == product.id)){
      wishlistItems.add(product);
    }
  }

  // Remove a product from the wishlist
  void removeFromWishlist(String productId) {
   wishlistItems.removeWhere((item) => item.id == productId);
  }

  // Toggle wishlist status
  void toggleWishlist(Product product) {
    if (isInWishlist(product.id)) {
      removeFromWishlist(product.id);
    } else {
      addToWishlist(product);
    }
  }

  // Check if a product is in the wishlist
  bool isInWishlist(String productId) {
    return wishlistItems.any((item) => item.id == productId);
  }

  // Clear the entire wishlist
  void clearWishlist() {
    wishlistItems.clear();
  }
}
