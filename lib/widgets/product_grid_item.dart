import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/models/flower_item.dart';
import 'package:first_flutter_project/widgets/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final FlowerItem productItem;

  const ProductCard({super.key, required this.productItem});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Image.asset(
                widget.productItem.imgUrl,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              widget.productItem.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: primaryColor,
              ),
            ),

            Row(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .start,
              children: [
                Text(
                  "\$${widget.productItem.price}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: darkPink,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: primaryColor),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: lightGray,
                        duration: const Duration(milliseconds: 500),
                        content: Text(
                          tr('snakBarMessege'),
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
