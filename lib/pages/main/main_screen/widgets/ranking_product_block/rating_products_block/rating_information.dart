import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/pages/main/main_screen/main_screen.dart';

class RatingInformation extends StatelessWidget {
  const RatingInformation({super.key, required this.state});

  final MainScreenLoaded state;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    List<List<Color>> gradientsList = [
      lightPinkGradient,
      lightBlueGradient,
      purpleGradient,
      orangeGradient,
    ];
    return SizedBox(
      width: width * 0.25,
      height: width * 0.25,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          RankingProductsModel rankData = state.rankingData[index];
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                    child: ASText(
                      text: rankData.storeName,
                      color: textClr,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: width * 0.005),
                  Container(
                    width: width * 0.22812,
                    height: width * 0.03542,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: textClr,
                      ),
                      borderRadius: BorderRadius.circular(
                        width * 0.01042,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: gradientsList[index],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(
                                  Rect.fromLTWH(
                                      0, 0, bounds.width, bounds.height),
                                ),
                                child: SizedBox(
                                  width: 20,
                                  height: 40,
                                  child: ASText(
                                    text: '${index + 1}',
                                    color: textClr,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              SizedBox(
                                height: 24,
                                child: ASText(
                                  text: rankData.productName,
                                  color: textClr,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                            child: ASText(
                              text: '${rankData.totalProfit}',
                              color: textClr,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: width * 0.01),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
