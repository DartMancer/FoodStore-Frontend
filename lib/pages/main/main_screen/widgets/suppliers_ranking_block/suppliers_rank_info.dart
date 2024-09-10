import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/pages/main/main_screen/main_screen.dart';

class SuppliersRankingInfo extends StatefulWidget {
  const SuppliersRankingInfo({super.key, required this.bloc});

  final MainScreenBloc bloc;

  @override
  State<SuppliersRankingInfo> createState() => _SuppliersRankingInfoState();
}

class _SuppliersRankingInfoState extends State<SuppliersRankingInfo> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state is MainScreenLoaded) {
          return SizedBox(
            height: width * 0.24707,
            child: ListView.builder(
              itemCount: state.supplierData.length,
              itemBuilder: (context, index) {
                SuppliersRankingModel supplier = state.supplierData[index];
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: width * 0.955,
                          height: width * 0.04489,
                          decoration: BoxDecoration(
                            color: textClr.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: width * 0.013),
                            SizedBox(
                              width: width * 0.15023,
                              height: width * 0.01958,
                              child: ASText(
                                text: supplier.supplierName,
                                color: whiteClr,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: width * 0.005),
                            SizedBox(
                              width: width * 0.17992,
                              height: width * 0.02458,
                              child: ASText(
                                text: supplier.totalDeliveries.toString(),
                                color: whiteClr,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: width * 0.005),
                            SizedBox(
                              width: width * 0.221,
                              height: width * 0.02458,
                              child: ASText(
                                text: '${supplier.totalUnitsDelivered} шт.',
                                color: whiteClr,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: width * 0.005),
                            SizedBox(
                              width: width * 0.163,
                              height: width * 0.02458,
                              child: ASText(
                                text: '${supplier.totalCostOfDeliveries} руб.',
                                color: whiteClr,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: width * 0.005),
                            SizedBox(
                              width: width * 0.20729,
                              height: width * 0.02458,
                              child: ASText(
                                text:
                                    '${supplier.percentageOfTotalPurchases.toString().substring(0, 4)}%',
                                color: whiteClr,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.normal,
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

        return SizedBox(
          height: width * 0.24707,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: width * 0.955,
                    height: width * 0.04489,
                    decoration: BoxDecoration(
                      color: textClr.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(height: width * 0.00312),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
