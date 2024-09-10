import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/pages/main/main_screen/main_screen.dart';

class StockBlock extends StatelessWidget {
  const StockBlock({super.key, required this.bloc});

  final MainScreenBloc bloc;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: width * 0.36718,
          height: width * 0.3125,
          decoration: BoxDecoration(
            color: elementsClr,
            borderRadius: BorderRadius.circular(width * 0.01),
          ),
        ),
        SizedBox(
          width: width * 0.36718,
          height: width * 0.3125,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: width * 0.005),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const MainScreenBlocksTitle(title: 'Склад'),
                  SizedBox(width: width * 0.005),
                  SizedBox(
                    height: width * 0.0257,
                    child: ASText(
                      text: 'Стоит пополнить',
                      color: textClr,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
              SizedBox(height: width * 0.011),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: width * 0.025),
                  TableTitle(
                    title: 'Магазин',
                    wT: width * 0.1026,
                  ),
                  SizedBox(width: width * 0.005),
                  TableTitle(title: 'Товар', wT: width * 0.09323),
                  SizedBox(width: width * 0.005),
                  TableTitle(
                    title: 'Количество',
                    wT: width * 0.1,
                  ),
                ],
              ),
              StockBlockInfo(bloc: bloc),
              DetailedButton(onPressed: () {}),
              SizedBox(height: width * 0.011),
            ],
          ),
        ),
      ],
    );
  }
}
