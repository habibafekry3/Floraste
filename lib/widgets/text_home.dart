import "package:easy_localization/easy_localization.dart";
import "package:first_flutter_project/widgets/colors.dart";
import "package:flutter/material.dart";

class TextItem extends StatelessWidget {
  const TextItem({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Text(
      tr('displayImage'),
      style: TextStyle(
        fontFamily: 'Suwannaphum',
        fontSize: screenWidth * 0.045,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }
}
