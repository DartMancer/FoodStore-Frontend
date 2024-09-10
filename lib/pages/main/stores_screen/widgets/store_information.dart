import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';

class StoreInformation extends StatelessWidget {
  const StoreInformation({
    super.key,
    required this.storeData,
  });

  final StoreModel storeData;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: width * 0.015,
          child: ASText(
            text:
                'Время работы: ${storeData.openingTime.substring(0, 5)} - ${storeData.closingTime.substring(0, 5)}',
            color: textClr,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: width * 0.015,
          child: ASText(
            text: 'Адрес: ${storeData.storeLocation}',
            color: textClr,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: width * 0.015,
          child: ASText(
            text: 'Количество товаров: ${storeData.productsCount}',
            color: textClr,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
