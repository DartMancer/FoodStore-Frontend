import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/main/stores_screen/stores_screen.dart';

import 'view.dart';

@RoutePage()
class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  final _storesBloc = StoresScreenBloc(StoresScreenApi());

  @override
  void initState() {
    _storesBloc.add(const LoadStoresScreenData());
    super.initState();
  }

  @override
  void dispose() {
    _storesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double height = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBar(
        backgroundColor: backgroundClr,
        title: const StoresScreenAppBar(),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: height,
            child: BlocBuilder<StoresScreenBloc, StoresScreenState>(
              bloc: _storesBloc,
              builder: (context, state) {
                if (state is StoresScreenLoaded) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: state.storesData.length + 1,
                    itemBuilder: (context, index) {
                      if (index != state.storesData.length) {
                        StoreModel storeData = state.storesData[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              StoresProductsBlock(storeData: storeData),
                              StoreBlock(storeData: storeData),
                            ],
                          ),
                        );
                      }
                      return AddingStoreButton(
                        id: state.storesData.length,
                        bloc: _storesBloc,
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
