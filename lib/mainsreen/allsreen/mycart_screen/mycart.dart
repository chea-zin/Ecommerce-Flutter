import 'package:ecommerce_rupp/mainsreen/allsreen/mycart_screen/product_list_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_rupp/controller/mycart_controller.dart';

class Mycarts extends StatelessWidget {
  final MyCartController controller = Get.put(MyCartController());
  final TextEditingController voucherCodeController = TextEditingController();
  final VoidCallback? onNavigateToCategories;

  Mycarts({super.key, this.onNavigateToCategories});

  @override
  Widget build(BuildContext context) {
    // Initialize the total price when the widget is built
    controller.updateTotalPrice(controller.cartItems);
    print('Cart items: ${controller.cartItems}');  // Add this for debugging
    return Scaffold(
      backgroundColor: Colors.white,
      body: controller.cartItems.isEmpty // Check if the cart is empty
          ? Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/cart.png', width: 250, height: 250,),
                const Text('Your Cart is Empty!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      'Looks like you have not added anything in your cart. Go ahead and explore top categories.',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.center,

                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                    onPressed: (){

                    },
                    child: Text('Explore categories now!',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),))
              ],
            ),
          ),

        )
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 10, left: 10, top: 50, bottom: 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: onNavigateToCategories,
                  icon: const Icon(Icons.arrow_back, size: 25, color: Colors.black87),
                ),
                Text(
                  "My Cart",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    showVoucherDialog(controller, voucherCodeController); // Pass the controller and TextEditingController
                  },
                  child: Text(
                    "Voucher Code",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF964B00),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Product list section
          Expanded(
            child: Obx(() {  // Wrap the ListView.builder with Obx to observe changes to cartItems
              return ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return ProductListCart(
                    image: item["image"],
                    name: item["name"],
                    originalPrice: item["originalPrice"],
                    discountPrice: item["discountPrice"],
                    itemCount: item["quantity"],
                    index: index, // Pass the index to the ProductListCart widget
                  );
                },
              );
            }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order Info",
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtotal",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Obx(() => Text(
                          "\$${controller.cartTotal.value.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Shipping Cost",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Obx(() => Text(
                          "\$${controller.shippingCost.value.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                        )),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Text(
                      "\$${(controller.finalTotal.value + controller.shippingCost.value).toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          Get.toNamed('/checkout');
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF964B00),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        )
                      ),
                        child:  Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
