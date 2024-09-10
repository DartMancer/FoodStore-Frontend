import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/pages/main/main_screen/main_screen.dart';

class SuppliersBlock extends StatelessWidget {
  const SuppliersBlock({super.key, required this.bloc});

  final MainScreenBloc bloc;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: width * 0.970,
          height: width * 0.45,
          decoration: BoxDecoration(
            color: elementsClr,
            borderRadius: BorderRadius.circular(width * 0.01),
          ),
        ),
        SizedBox(
          width: width * 0.970,
          height: width * 0.45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: width * 0.001),
              const MainScreenBlocksTitle(title: 'Поставщики'),
              const TableTitles(),
              SuppliersRankingInfo(bloc: bloc),
              DetailedButton(onPressed: () {}),
              SizedBox(height: width * 0.01),
            ],
          ),
        ),
      ],
    );
  }
}
