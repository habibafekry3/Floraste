import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/models/flower_item.dart';
import 'package:first_flutter_project/models/offer_item.dart';
import 'package:first_flutter_project/pages/home_page.dart';
import 'package:first_flutter_project/widgets/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/hot_offer_item.dart';
import '../widgets/product_grid_item.dart';
import '../widgets/our_product_item.dart';

class ShoppingPage extends StatefulWidget {
  final Future<void> Function() changeLang;
  const ShoppingPage({super.key, required this.changeLang});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<FlowerItem> products = [
      FlowerItem(name: tr('f1'), imgUrl: "assets/images/f1.png", price: 10.0),
      FlowerItem(name: tr('f2'), imgUrl: "assets/images/f2.png", price: 8.5),
      FlowerItem(name: tr('f3'), imgUrl: "assets/images/f3.png", price: 12.0),
      FlowerItem(name: tr('f4'), imgUrl: "assets/images/f4.png", price: 11.5),
    ];

    final List<OfferItem> hotOffersProducts = [
      OfferItem(
        title: tr('hotOffer'),
        offer: tr('offer'),
        imgUrl: 'assets/images/f4.png',
      ),
      OfferItem(title: tr('flowerBouquet'), imgUrl: 'assets/images/f20.png'),
      OfferItem(title: tr('redRoses'), imgUrl: 'assets/images/f6.png'),
      OfferItem(title: tr('summerFlowers'), imgUrl: 'assets/images/f3.png'),
      OfferItem(title: tr('weddingBouquet'), imgUrl: 'assets/images/fw.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(changeLang: widget.changeLang),
                ),
              );
            },
            icon: Icon(Icons.home, size: 25, color: secondaryColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              size: 25,
              color: secondaryColor,
            ),
          ),
          IconButton(
            onPressed: () async {
              await widget.changeLang();
            },
            icon: Icon(Icons.language, size: 25, color: secondaryColor),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            tr('logo'),
            style: TextStyle(
              fontSize: screenWidth * 0.065,
              fontWeight: .bold,
              color: primaryColor,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: .vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  tr('ourProducts'),
                  style: TextStyle(
                    fontSize: screenWidth * 0.052,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const OurProducts(),

              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    ProductCard(productItem: products[index]),
              ),

              const SizedBox(height: 30),

              Text(
                tr('hotOffer'),
                style: TextStyle(
                  fontSize: screenWidth * 0.052,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),

              const SizedBox(height: 12),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotOffersProducts.length,
                itemBuilder: (context, index) {
                  return HotOfferItem(
                    hotOffers: hotOffersProducts[index],
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
