import "package:flutter/material.dart";

class ImageHome extends StatelessWidget {
  const ImageHome({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/images/f4.png',
          width: screenWidth * 0.4,
          height: screenWidth * 0.5,
        ),
        Image.network(
          "https://static.vecteezy.com/system/resources/thumbnails/023/742/329/small_2x/banana-plant-in-flowerpot-illustration-ai-generative-free-png.png",
          width: screenWidth * 0.4,
          height: screenWidth * 0.5,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image, size: 80);
          },
        ),
      ],
    );
  }
}
