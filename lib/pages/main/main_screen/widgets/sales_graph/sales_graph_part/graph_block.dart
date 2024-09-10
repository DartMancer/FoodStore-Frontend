import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/pages/main/main_screen/main_screen.dart';

class GraphBlock extends StatefulWidget {
  const GraphBlock({super.key, required this.bloc});

  final MainScreenBloc bloc;

  @override
  State<GraphBlock> createState() => _GraphBlockState();
}

class _GraphBlockState extends State<GraphBlock> {
  bool isActive = true, isDaily = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: width * 0.7,
          height: width * 0.4,
          decoration: BoxDecoration(
            color: elementsClr,
            borderRadius: BorderRadius.circular(width * 0.01),
          ),
        ),
        SizedBox(
          width: width * 0.7,
          height: width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: width * 0.001),
              GraphTitleBlock(
                isActive: isActive,
                todayBtn: todayGraphBtn,
                weekBtn: weekGraphBtn,
              ),
              BlocBuilder<MainScreenBloc, MainScreenState>(
                bloc: widget.bloc,
                builder: (context, state) {
                  if (state is MainScreenLoaded) {
                    DailyModel dailyModel = MainScreenMethods().dailyBloc(
                      summeryData: state.dailyData,
                    );

                    WeeklyModel weeklyModel = MainScreenMethods().weeklyBloc(
                      summeryData: state.weeklyData,
                    );
                    return isDaily
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DayInfoGraphBlock(
                                todayUnits: dailyModel.todayUnits,
                                yesterdayUnits: dailyModel.yesterdayUnits,
                                lastWeekUnits: dailyModel.lastWeekUnits,
                                todaySales: dailyModel.todaySales,
                                yesterdaySales: dailyModel.yesterdaySales,
                                lastWeekSales: dailyModel.lastWeekSales,
                              ),
                              DailyGraph(
                                summerySales: state.dailyData,
                                todaySpots: dailyModel.todaySpots,
                                yesterdaySpots: dailyModel.yesterdaySpots,
                                lastWeekSpots: dailyModel.lastWeekSpots,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WeekInfoGraphBlock(
                                thisWeekUnits: weeklyModel.thisWeekUnits,
                                lastWeekUnits: weeklyModel.lastWeekUnits,
                                thisWeekSales: weeklyModel.thisWeekSales,
                                lastWeekSales: weeklyModel.lastWeekSales,
                              ),
                              WeeklyGraph(
                                daysList: state.weeklyData.salesList,
                                lastWeekSpots: weeklyModel.lastWeekSpots,
                                thisWeekSpots: weeklyModel.thisWeekSpots,
                              ),
                            ],
                          );
                  }

                  return const GraphShimmer();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  todayGraphBtn() {
    setState(() => isDaily = true);
    toggleBtn();
  }

  weekGraphBtn() {
    setState(() => isDaily = false);
    toggleBtn();
  }

  toggleBtn() => setState(() => isActive = !isActive);
}
