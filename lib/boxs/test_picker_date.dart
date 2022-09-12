
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickerDateDialog extends StatefulWidget {
  const PickerDateDialog({required this.mode});
  @override
  MyAppState createState() => MyAppState();

  final CupertinoDatePickerMode mode;
}

class MyAppState extends State<PickerDateDialog> {
  DateTime fromDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding:
          const EdgeInsets.only(left: 30, right: 30, top: 150, bottom: 150),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            elevation: 0,
            child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          DateFormat('yyyy-MM-dd').format(fromDate),
                          // style: cairoSemiBoldStyle(
                          //     15, Theme.of(context).canvasColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                          // color: Colors.red,
                          width: double.infinity,
                          height: size.height*0.4,
                          child: CupertinoDatePicker(
                            mode:    widget.mode,

                            onDateTimeChanged: (value) {
                              if (value != fromDate) {
                                setState(() {
                                  fromDate = value;
                                });
                              }
                            },
                            initialDateTime: fromDate,
                            // minimumYear: 2019,
                            maximumYear: DateTime.now().year,

                            use24hFormat: false,
                            // backgroundColor: CupertinoColors.systemBlue,
                          ),
                        ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context, [fromDate]);
                          },
                          child: const Text(
                            "submit",
                            style: TextStyle(fontSize: 18,color:Color.fromRGBO(90, 153, 219, 0.8),fontWeight: FontWeight.bold ),
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text("cancel",
                            style: TextStyle(fontSize: 18,color:Colors.red,fontWeight: FontWeight.bold ),
                              // style: cairoSemiBoldStyle(15, Colors.red)
                          )),
                    ],
                  )
              ],
            ),
                )),
          ),
        ),
      ),
    );
  }
}
