import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/pages/main/store_screen/bloc/store_screen_bloc.dart';
import 'package:food_store/pages/main/store_screen/widget/appbar.dart';

@RoutePage()
class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key, required this.id});

  final int id;

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late StoreScreenBloc _storeBloc;

  @override
  void initState() {
    _storeBloc = StoreScreenBloc(widget.id, StoresScreenApi());
    _storeBloc.add(const LoadStoreScreenData());
    super.initState();
  }

  @override
  void dispose() {
    _storeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBar(
        backgroundColor: backgroundClr,
        title: const StoreScreenAppBar(),
      ),
      body: Stack(
        children: [
          BlocBuilder<StoreScreenBloc, StoreScreenState>(
            bloc: _storeBloc,
            builder: (context, state) {
              if (state is StoreScreenLoaded) {
                StoreModel storeData = state.storesData;
                return Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: width * 0.03),
                                SizedBox(
                                  height: width * 0.06,
                                  child: ASText(
                                    text: storeData.storeName,
                                    color: textClr,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(height: width * 0.03),
                                SizedBox(
                                  height: width * 0.025,
                                  child: ASText(
                                    text: 'Информация о магазине',
                                    color: textClr,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(height: width * 0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: width * 0.02,
                                      child: ASText(
                                        text: 'Время работы: ',
                                        color: textClr,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(
                                      height: width * 0.02,
                                      child: ASText(
                                        text:
                                            '${storeData.openingTime.substring(0, 5)} - ${storeData.closingTime.substring(0, 5)}',
                                        color: textClr,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: width * 0.02,
                                      child: ASText(
                                        text: 'Адрес: ',
                                        color: textClr,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(
                                      height: width * 0.02,
                                      child: ASText(
                                        text: storeData.storeLocation,
                                        color: textClr,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: width * 0.03),
                                SizedBox(
                                  height: width * 0.025,
                                  child: ASText(
                                    text: 'Продукты',
                                    color: textClr,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(height: width * 0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: width * 0.02,
                                      child: ASText(
                                        text: 'Количество: ',
                                        color: textClr,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(
                                      height: width * 0.02,
                                      child: ASText(
                                        text:
                                            storeData.productsCount.toString(),
                                        color: textClr,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Positioned(
                                  top: 40,
                                  left: 40,
                                  child: Container(
                                    width: 500,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: lightBlueGradient,
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  left: 370,
                                  child: Container(
                                    width: 400,
                                    height: 350,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: purpleGradient,
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 90,
                                  left: 170,
                                  child: Container(
                                    width: 450,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: orangeGradient,
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 40.0,
                                      sigmaY: 40.0,
                                    ),
                                    child: Container(
                                      width: 800,
                                      height: 320,
                                      decoration: BoxDecoration(
                                        color: textClr.withOpacity(0.2),
                                        border: Border.all(
                                          width: 2,
                                          color: textClr,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  right: 20,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: textClr.withOpacity(0.2),
                                          border: Border.all(
                                            width: 2,
                                            color: textClr,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: errorColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: MaterialButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Вы точно хотите удалить магазин?',
                                                    style: TextStyle(
                                                      color: textClr,
                                                      fontFamily: fontApp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      backgroundClr,
                                                  actions: [
                                                    Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 30,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: elementsClr,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Text(
                                                            'Да',
                                                            style: TextStyle(
                                                              color: textClr,
                                                              fontFamily:
                                                                  fontApp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 100,
                                                          height: 30,
                                                          child: MaterialButton(
                                                            onPressed:
                                                                () async {
                                                              await StoresScreenApi()
                                                                  .deleteStoresScreenApi(
                                                                      id: storeData
                                                                          .id);
                                                            },
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 30,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: elementsClr,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Text(
                                                            'Нет',
                                                            style: TextStyle(
                                                              color: textClr,
                                                              fontFamily:
                                                                  fontApp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 100,
                                                          height: 30,
                                                          child: MaterialButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: width * 0.01),
                        SizedBox(
                          height: height,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                            ),
                            itemCount: storeData.productsCount + 1,
                            itemBuilder: (context, index) {
                              if (index != storeData.productsCount) {
                                ProductModel productData =
                                    storeData.productsList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: 16.0,
                                    bottom: 16.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: elementsClr,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: width * 0.027,
                                          child: ASText(
                                            text: productData.productName,
                                            color: textClr,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: width * 0.017,
                                              child: ASText(
                                                text: 'Ед. измерения: ',
                                                color: textClr,
                                                textAlign: TextAlign.center,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              height: width * 0.015,
                                              child: ASText(
                                                text: productData.unit,
                                                color: textClr,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: width * 0.02,
                                          child: ASText(
                                            text: productData
                                                .manufacturer.manufacturerName,
                                            color: textClr,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.only(
                                  right: 16.0,
                                  bottom: 16.0,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      decoration: BoxDecoration(
                                        color: elementsClr,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: textClr,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          width: width * 0.3,
                                          height: width * 0.3,
                                          child: MaterialButton(
                                            onPressed: () {},
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }
}
