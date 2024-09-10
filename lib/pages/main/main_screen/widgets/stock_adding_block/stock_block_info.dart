import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/pages/main/main_screen/main_screen.dart';

class StockBlockInfo extends StatefulWidget {
  const StockBlockInfo({super.key, required this.bloc});

  final MainScreenBloc bloc;

  @override
  State<StockBlockInfo> createState() => _StockBlockInfoState();
}

class _StockBlockInfoState extends State<StockBlockInfo> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state is MainScreenLoaded) {
          return SizedBox(
            height: width * 0.16,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                StockModel stock = state.stockData[index];
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: width * 0.33083,
                          height: width * 0.03489,
                          decoration: BoxDecoration(
                            color: textClr.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: width * 0.025),
                            SizedBox(
                              width: width * 0.1026,
                              height: width * 0.01558,
                              child: ASText(
                                text: stock.storeName,
                                color: whiteClr,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: width * 0.005),
                            SizedBox(
                              width: width * 0.09323,
                              height: width * 0.01558,
                              child: ASText(
                                text: stock.productName,
                                color: whiteClr,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: width * 0.005),
                            SizedBox(
                              width: width * 0.1,
                              height: width * 0.02058,
                              child: ASText(
                                text: '${stock.quantity} шт.',
                                color: errorColor,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: width * 0.00312),
                  ],
                );
              },
            ),
          );
        }
        return const ShimmerStock();
      },
    );
  }
}
