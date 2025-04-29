import 'package:ecommerce_rupp/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_rupp/Service/api_service.dart';
import '../../../models/products.dart';
import 'buildProductCard.dart';
import 'buildProductsSectionHeader.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductsSectionState createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  final WishlistController wishlistController = Get.find();


  // Store the Future to prevent re-fetching on every rebuild
  late Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the Future only once in initState
    productsFuture = ApiService().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return buildLastProductsSection(context, size);
  }

  Widget buildLastProductsSection(BuildContext context, Size size) {
    return FutureBuilder<List<Product>>(
      future: productsFuture, // Use the stored Future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          var products = snapshot.data!;
          // Initialize favorite status for new products

          return Column(
            children: [
              buildProductSectionHeader('All Products', context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25 ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Obx(() => buildProductCard(
                      product: product,
                      size: size,
                      isFavorite: wishlistController.isInWishlist(product.id),
                      onFavoriteToggle: (newValue){
                        wishlistController.toggleWishlist(product);
                      }
                    )
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}