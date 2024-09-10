import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';

import 'next_product_button.dart';
import 'stores_product_card.dart';

class StoresProductsBlock extends StatelessWidget {
  const StoresProductsBlock({
    super.key,
    required this.storeData,
  });
  final StoreModel storeData;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: width,
      height: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: width,
                height: width * 0.15,
                decoration: BoxDecoration(
                  color: textClr.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  width: width * 0.24,
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: storeData.productsCount > 5
                        ? 6
                        : storeData.productsCount + 1,
                    itemBuilder: (context, index) {
                      if (storeData.productsCount > 5
                          ? index != 5
                          : index != storeData.productsCount) {
                        return StoresProductCard(
                          index: index,
                          storeData: storeData,
                        );
                      }
                      return NextProductButton(id: storeData.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
