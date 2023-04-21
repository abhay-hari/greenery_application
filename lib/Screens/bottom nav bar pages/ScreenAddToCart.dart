import 'package:flutter/material.dart';

class ScreenAddToCart extends StatefulWidget {
  const ScreenAddToCart({super.key});

  @override
  State<ScreenAddToCart> createState() => _ScreenAddToCartState();
}

class _ScreenAddToCartState extends State<ScreenAddToCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: Text("Add to cart")),
    );
  }
}
