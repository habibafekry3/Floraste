import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/widgets/colors.dart';
import 'package:first_flutter_project/widgets/image_home.dart';
import 'package:first_flutter_project/widgets/text_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Future<void> Function() changeLang;

  const HomePage({super.key, required this.changeLang});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        backgroundColor: lightGray,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: primaryColor),
        ),
        title: Text(
          tr('firstProject'),
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: () async {
              await changeLang();
            },
            icon: Icon(Icons.language, size: 23, color: accentPink),
            label: Text(
              tr('changeLang'),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ImageHome(),
          const SizedBox(height: 20),
          TextItem(),
        ],
      ),
    );
  }
}
