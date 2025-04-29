import 'package:ecommerce_rupp/models/products.dart';
import 'package:flutter/material.dart';
import 'buildProductInfo.dart'; // Import the buildProductInfo widget

Widget buildProductCard({
  required Product product,
  required Size size,
  required bool isFavorite,
  required Function(bool) onFavoriteToggle,
}) {
  // Adjust the height and width for different screen sizes
  double imageHeight =
      size.height * 0.12; // Image height based on screen height
  double imageWidth = size.width * 0.2; // Image width based on screen width
  double cardWidth = size.width * 0.4; // Card width based on screen width
  double cardPadding = size.width * 0.02; // Dynamic padding

  return Container(
    width: cardWidth, // Dynamic width
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10),
        ]),
    child: Stack(
      children: [
        // Image container, using Flexible to adapt to available space
        Positioned(
          top: cardPadding * 2, // Dynamic top position
          right: cardPadding * 5, // Dynamic right position
          child: Center(
            child: Container(
              height: imageHeight, // Dynamically set image height
              width: imageWidth, // Dynamically set image width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        // Positioned Wishlist Icon outside of the image container and in front of the card
        Positioned(
          top: cardPadding, // Dynamic top position
          right: cardPadding, // Dynamic right position
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60), // Circular border
            ),
            child: IconButton(
              onPressed: () {
                onFavoriteToggle(!isFavorite); // Toggle the state
                print("Favorite clicked: $isFavorite");
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                color: Color(0xFF964B00),
                size: 30, // Dynamic icon size
              ),
            ),
          ),
        ),
        // Product info section below the image
        Positioned(
          bottom: size.height * 0.01, // Dynamic bottom position
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(cardPadding), // Dynamic padding
            child:
                buildProductInfo(product), // Use the updated buildProductInfo
          ),
        ),
        // Add to Cart icon next to the price
        Positioned(
          bottom: size.height * 0.01, // Dynamic bottom position
          right: cardPadding * 2, // Dynamic right position
          child: IconButton(
            onPressed: () {
              // Add to cart functionality
            },
            icon: Icon(Icons.shopping_cart, color: Colors.black87, size: 30),
          ),
        ),
      ],
    ),
  );
}
