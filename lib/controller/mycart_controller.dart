
import 'package:get/get.dart';
import 'package:ecommerce_rupp/models/products.dart';

class MyCartController extends GetxController {
  var cartItems = <Product>[].obs;
  var itemQuantities = <String, int>{}.obs; // ProductID → Quantity
  var cartTotal = 0.0.obs;
  var shippingCost = 2.5.obs;
  var discountAmount = 0.0.obs;     // Discount from vouchers
  var finalTotal = 0.0.obs;
  var voucherMessage = ''.obs;
  var voucherApplied = false.obs; //track if a voucher is already used

  void addToCart(Product product) {
    final productId = product.id;
    if (itemQuantities.containsKey(productId)) {
      itemQuantities[productId] = itemQuantities[productId]! + 1; // Increment
    } else {
      cartItems.add(product);
      itemQuantities[productId] = 1; // Initialize
    }
    updateTotalPrice();
  }

  void updateTotalPrice() {
    double subtotal = 0.0;
    for (var product in cartItems) {
      final quantity = itemQuantities[product.id] ?? 1;
      subtotal += double.parse(product.price) * quantity.toDouble();
    }
    cartTotal.value = subtotal;
    finalTotal.value = cartTotal.value - discountAmount.value + shippingCost.value;
  }

  void applyVoucher(double discountPercent) {
    discountAmount.value = cartTotal.value * discountPercent / 100;
    updateTotalPrice(); // Recalculate final total
  }

  void removeFromCart(int index) {
    final product = cartItems[index];
    itemQuantities.remove(product.id); // Remove quantity tracking
    cartItems.removeAt(index); // Remove product
    updateTotalPrice();
  }

  void updateQuantity(String productId, int newQuantity) {
    if (newQuantity > 0) {
      itemQuantities[productId] = newQuantity;
    } else {
      // Remove if quantity is 0
      final index = cartItems.indexWhere((p) => p.id == productId);
      if (index >= 0) {
        cartItems.removeAt(index);
        itemQuantities.remove(productId);
      }
    }
    updateTotalPrice();
  }

  bool applyVoucherCode(String code) {
    if (voucherApplied.value) {
      voucherMessage.value = "Voucher already applied!";
      return false;
    }

    if (code == 'SAVE10') {
      applyVoucher(10);
      voucherMessage.value = "10% discount applied!";
      voucherApplied.value = true;
      return true;
    } else if (code == 'SAVE20') {
      applyVoucher(20);
      voucherMessage.value = "20% discount applied!";
      voucherApplied.value = true;
      return true;
    } else {
      voucherMessage.value = "Invalid voucher code!";
      return false;
    }
  }
  void resetVoucher() {
    discountAmount.value = 0.0;
    voucherApplied.value = false;
    voucherMessage.value = "";
    updateTotalPrice();
  }
}