import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/pages/main/stores_screen/stores_screen.dart';
import 'package:time_range/time_range.dart';

class AddingStoreButton extends StatefulWidget {
  const AddingStoreButton({
    super.key,
    required this.id,
    required this.bloc,
  });

  final int id;
  final StoresScreenBloc bloc;

  @override
  State<AddingStoreButton> createState() => _AddingStoreButtonState();
}

class _AddingStoreButtonState extends State<AddingStoreButton> {
  final _titleController = TextEditingController(),
      _addressController = TextEditingController();

  bool isTitleFilled = false;
  bool isAddressFilled = false;

  @override
  void initState() {
    _titleController.addListener(() => titleListener());
    _addressController.addListener(() => addressListener());
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TimeRangeResult? workTime;

    // final mediaQuery = MediaQuery.of(context);
    // double width = mediaQuery.size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              width: 8,
              color: textClr.withOpacity(0.7),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.add, color: textClr, size: 80),
        ),
        SizedBox(
          width: 150,
          height: 150,
          child: MaterialButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Добавить магазин',
                      style: TextStyle(
                        fontSize: 30,
                        color: textClr,
                        fontFamily: fontApp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: elementsClr,
                    content: SizedBox(
                      width: 200,
                      height: 400,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            TextField(
                              controller: _titleController,
                              style: TextStyle(
                                color: textClr,
                                fontFamily: fontApp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Название магазина',
                                labelStyle: TextStyle(
                                  color: textClr,
                                  fontFamily: fontApp,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: textClr),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textClr),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textClr),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textClr),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextField(
                              controller: _addressController,
                              style: TextStyle(
                                color: textClr,
                                fontFamily: fontApp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Адрес магазина',
                                labelStyle: TextStyle(
                                  color: textClr,
                                  fontFamily: fontApp,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: textClr),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textClr),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textClr),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: textClr),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Время работы магазина',
                              style: TextStyle(
                                fontSize: 20,
                                color: textClr,
                                fontFamily: fontApp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TimeRange(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: textClr,
                              ),
                              activeTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: backgroundClr,
                              ),
                              borderColor: textClr,
                              alwaysUse24HourFormat: true,
                              backgroundColor: Colors.transparent,
                              activeBackgroundColor: textClr,
                              firstTime: const TimeOfDay(hour: 06, minute: 00),
                              lastTime: const TimeOfDay(hour: 22, minute: 00),
                              timeStep: 30,
                              timeBlock: 120,
                              onRangeCompleted: (range) => setState(
                                () => workTime = range,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                          'Отмена',
                          style: TextStyle(color: textClr),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          if (isTitleFilled &
                              isAddressFilled &
                              (workTime != null)) {
                            String openingTime =
                                '${timeFormat(string: workTime!.start.hour)}:${timeFormat(string: workTime!.start.minute)}:00';
                            String closingTime =
                                '${timeFormat(string: workTime!.end.hour)}:${timeFormat(string: workTime!.end.minute)}:00';

                            String requestBody = json.encode(
                              {
                                "id": widget.id.toString(),
                                "storeName": _titleController.text,
                                "location": _addressController.text,
                                "openingTime": openingTime,
                                "closingTime": closingTime
                              },
                            );
                            if (await StoresScreenApi().postStoresScreenApi(
                                requestBody: requestBody)) {
                              Navigator.of(context).pop();
                              widget.bloc.add(const LoadStoresScreenData());
                            }
                          }
                        },
                        child: Text(
                          'Добавить',
                          style: TextStyle(color: textClr),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
      ],
    );
  }

  void titleListener() {
    final isTitleFilled = _titleController.text.isEmpty;
    setState(() => this.isTitleFilled = !isTitleFilled);
  }

  void addressListener() {
    final isAddressFilled = _addressController.text.isEmpty;
    setState(() => this.isAddressFilled = !isAddressFilled);
  }

  String timeFormat({required dynamic string}) {
    return string.toString().padLeft(2, '0');
  }
}
