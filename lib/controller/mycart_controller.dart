import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartController extends GetxController {
  var cartTotal = 0.0.obs;
  var discountApplied = false.obs;
  var appliedVoucher = "".obs;
  var shippingCost = 2.5.obs;
  var voucherMessage = "".obs; // Feedback message
  var finalTotal = 0.0.obs;
  // List of valid vouchers with discount percentages
  final Map<String, double> validVouchers = {
    "SAVE10": 10.0, // 10% discount
    "DISCOUNT20": 20.0, // 20% discount
  };

  // Define cartItems as an observable list
  var cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    updateTotalPrice(cartItems); // Ensure subtotal is updated

    if (discountApplied.value && appliedVoucher.value.isNotEmpty) {
      applyVoucherCode(appliedVoucher.value); // Reapply discount
    }
    // Initialize cartItems with some data
    cartItems.addAll([
      {
        "image": "assets/products/watch.png",
        "name": "Loop Silicone Strong Magnetic Watch Band",
        "originalPrice": 200.0,
        "discountPrice": 150.0,
        "quantity": 1,
      },
      {
        "image": "assets/products/watch1.png",
        "name": "Loop Silicone Strong Magnetic Watch Band",
        "originalPrice": 250.0,
        "discountPrice": 180.0,
        "quantity": 1,
      },
    ]);
  }

  void updateFinalTotal() {
    double discountAmount =
        (discountApplied.value && appliedVoucher.value.isNotEmpty)
            ? (cartTotal.value * validVouchers[appliedVoucher.value]!) / 100
            : 0;

    finalTotal.value = cartTotal.value - discountAmount;
  }

  void updateTotalPrice(List<Map<String, dynamic>> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      double discountPrice = item["discountPrice"];
      int quantity =
          item["quantity"] ?? 1; // Default to 1 if quantity is not set
      total += discountPrice * quantity;
    }
    cartTotal.value = total;
    updateFinalTotal(); //ensure that the final total is updated when the cart changes
  }

  bool applyVoucherCode(String enteredCode) {
    if (discountApplied.value) {
      voucherMessage.value = "Voucher already applied!";
      return false;
    }

    if (validVouchers.containsKey(enteredCode)) {
      discountApplied.value = true;
      appliedVoucher.value = enteredCode;
      updateFinalTotal(); //update the final total after voucher code applied

      voucherMessage.value =
          "Voucher Applied! You saved \$${((cartTotal.value * validVouchers[enteredCode]!) / 100).toStringAsFixed(2)}";
      return true; // Successful application
    } else {
      voucherMessage.value = "Voucher Code is not valid";
      return false; // Failed application
    }
  }
}

void showVoucherDialog(
    MyCartController controller, TextEditingController voucherCodeController) {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 70),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Apply Voucher',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextField(
            controller: voucherCodeController,
            decoration: InputDecoration(
              labelText: 'Enter Voucher Code',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey.withAlpha(128)), // Transparent border
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey.withAlpha(128)), // When not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey.withAlpha(200),
                    width: 2), // When focused, less transparent
              ),
            ),
          ),
          SizedBox(height: 10),
          Obx(() => Text(
                controller.voucherMessage.value, // Display the feedback message
                style: TextStyle(
                  color: Colors.green, // Change color based on feedback
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      String enteredCode = voucherCodeController.text;
                      bool isSuccess = controller.applyVoucherCode(enteredCode);

                      if (isSuccess) {
                        Get.back(); // ⬅ Close the dialog immediately if successful
                      }

                      Get.snackbar(
                        "Voucher Status",
                        controller.voucherMessage.value,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: isSuccess ? Colors.green : Colors.red,
                        colorText: Colors.white,
                        duration: const Duration(seconds: 4),
                        animationDuration: const Duration(milliseconds: 800),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .black, // Set the button background color to black
                        padding: EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                    child: Text(
                      'Apply',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}
void removeFromCart(MyCartController controller, int index){
  if(index >= 0 && index < controller.cartItems.length){
    controller.cartItems.removeAt(index);
    controller.updateTotalPrice(controller.cartItems); // Call the method to update the total
    Get.snackbar('success', 'Product removed from cart');
  }
}

