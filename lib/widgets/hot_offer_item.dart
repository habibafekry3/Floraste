import 'package:first_flutter_project/models/offer_item.dart';
import 'package:first_flutter_project/widgets/colors.dart';
import 'package:flutter/material.dart';

class HotOfferItem extends StatelessWidget {
  final OfferItem hotOffers;
  final int index;

  const HotOfferItem({super.key, required this.hotOffers, required this.index});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.only(bottom: 14),
      elevation: 10,
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: screenWidth * 0.2,
                    decoration: BoxDecoration(
                      color: lightGray,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(150),
                        top: Radius.circular(300),
                      ),
                    ),
                  ),
                  Image.asset(
                    hotOffers.imgUrl,
                    height: screenWidth * 0.25,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(
                    text: hotOffers.title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                      color: primaryColor,
                    ),
                    children: [
                      TextSpan(
                        text: "\n${hotOffers.offer}",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w900,
                          color: darkPink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
