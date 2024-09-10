import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/pages/main/main_screen/main_screen.dart';

@RoutePage()
class MainFoodStoreScreen extends StatefulWidget {
  const MainFoodStoreScreen({super.key});

  @override
  State<MainFoodStoreScreen> createState() => _MainFoodStoreScreenState();
}

class _MainFoodStoreScreenState extends State<MainFoodStoreScreen> {
  final _mainBloc = MainScreenBloc(
    SellingsGraphApi(),
    RankingProductsApi(),
    StocksApi(),
    SuppliersRankApi(),
  );

  @override
  void initState() {
    _mainBloc.add(LoadMainScreenData());
    super.initState();
  }

  @override
  void dispose() {
    _mainBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBar(
        backgroundColor: backgroundClr,
        title: const MainScreenAppBar(),
      ),
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: width * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GraphBlock(bloc: _mainBloc),
                  RaitingBlock(bloc: _mainBloc),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: width * 0.015),
                child: SuppliersBlock(bloc: _mainBloc),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: width * 0.015),
                  StockBlock(bloc: _mainBloc),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
