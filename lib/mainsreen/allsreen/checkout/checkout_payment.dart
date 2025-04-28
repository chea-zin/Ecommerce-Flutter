import 'package:ecommerce_rupp/mainsreen/allsreen/checkout/checkout_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    // Use GetX to manage the selected payment method
    final PaymentController paymentController = Get.put(PaymentController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Checkout',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Form(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          // Checkout Steps
          Row(
          children: [
          _buildStep("Shipping", Icons.local_shipping, true),
          _buildDivider(true),
          _buildStep("Payment", Icons.payment, false),
          _buildDivider(false),
          _buildStep("Review", Icons.check_circle, false),
          ],
        ),
        const SizedBox(height: 20),
        // Payment Methods
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Credit Card Payment
              Obx(() => _buildPaymentMethod(
                'assets/image/card.png',
                isSelected: paymentController.selectedMethod.value == PaymentMethod.creditCard,
                onTap: () => paymentController.selectPaymentMethod(PaymentMethod.creditCard),
              )),
                const Text('or'),
                // ABA Pay Payment
                Obx(() => _buildPaymentMethod(
                  'assets/image/aba.png',
                  isSelected: paymentController.selectedMethod.value == PaymentMethod.abaPay,
                  onTap: () => paymentController.selectPaymentMethod(PaymentMethod.abaPay),
                )),
                ],
              ),
        ),
            const SizedBox(height: 20),
            // Show Credit Card Form only if Credit Card is selected
            if (paymentController.selectedMethod.value == PaymentMethod.creditCard) ...[
              // Card Holder Name
              const Text(
                'Card Holder Name *',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter card holder name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your card holder name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Card Number
              const Text(
                'Card Number *',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '4111 1111 1111 1111',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your card number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Expiry Date and CVV
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Expiration *',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'MM/YY',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter expiration';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CVV *',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '123',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter CVV';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            // Show QR Code for ABA Pay
            Obx((){
              if (paymentController.selectedMethod.value == PaymentMethod.abaPay){
                return Column(
                  children: [
                    const SizedBox(height: 20,),
                    const Center(
                      child: Text('Scan the QR Code to Pay',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ]
                        ),
                        child: Image.asset(
                          'assets/image/aba_qr.jpg',
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Center(
                      child: Text(
                        'Pay with ABA Mobile App',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: 90),
            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: TextButton(
                onPressed: () => Get.to(() => CheckoutReview()),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildStep(String title, IconData icon, bool isActive) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: isActive ? Color(0xFF21D4B4) : Colors.grey),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: isActive ? Color(0xFF21D4B4) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(bool isActive) {
    return Container(
      width: 50,
      height: 2,
      color: isActive ? Color(0xFF21D4B4) : Colors.grey,
    );
  }

  Widget _buildPaymentMethod(String imagePath, {required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF21D4B4).withOpacity(0.3) : Color(0xFFDDEEE6),

          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Color(0xFF21D4B4) : Colors.transparent,
            width: 2,
          ),
        ),
        constraints: const BoxConstraints(

          maxWidth: 200,

          maxHeight: 200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath, height: 60, fit: BoxFit.contain,),
        ),
      ),
    );
  }
}

// Payment Method Enum
enum PaymentMethod {
  creditCard,
  abaPay,
}

// Payment Controller
class PaymentController extends GetxController {
  final selectedMethod = PaymentMethod.creditCard.obs;

  void selectPaymentMethod(PaymentMethod method) {
    selectedMethod.value = method;
  }
}