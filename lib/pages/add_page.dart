import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled22/boxs/test_picker_date.dart';

import '../core/widgets/custom_text_field.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class DataType {
  DataType({required this.text, required this.isSelected});
  String text;
  bool isSelected;
}

class _AddPageState extends State<AddPage> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<DataType> list = [
    DataType(text: "Development", isSelected: true),
    DataType(text: "Research", isSelected: false),
    DataType(text: "Design", isSelected: false),
    DataType(text: "Backend", isSelected: false),
    DataType(text: "Development", isSelected: false),
    DataType(text: "Research", isSelected: false),
    DataType(text: "Design", isSelected: false),
    DataType(text: "Backend", isSelected: false),
  ];
  @override
  void initState() {
    taskNameController.text = "Team Meeting";
    dateController.text = "Monday, 1 June";
    startTimeController.text = "10:00 AM";
    endTimeController.text = "11:00 AM";
    descriptionController.text = "Discuss all questions about new projects";
  }

  double padding = 35;
  double rightPadding = 35;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              width: 35,
                              height: 35,
                              color: Colors.white.withOpacity(0.1),
                              child: const Icon(Icons.arrow_back_ios_rounded))),
                      const Icon(Icons.menu),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    left: padding,
                    right: padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Create New Task',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.description_outlined,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        size: 40,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: padding,
                    right: padding,
                  ),
                  child: CustomTextField(
                    controller: taskNameController,
                    labelText: 'Task Name',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                    left: padding,
                    right: padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: padding - 10),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: list.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                for (var item in list) {
                                  item.isSelected = false;
                                }
                                setState(() {
                                  list[index].isSelected = true;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: list[index].isSelected
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.8)
                                        : null,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.8),
                                        width: 1.5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    list[index].text,
                                    style: TextStyle(
                                      color: list[index].isSelected
                                          ? Colors.white
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: padding,
                    right: padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 250,
                        child: CustomTextField(
                          controller: dateController,
                          labelText: 'Date',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              barrierColor:
                                  const Color.fromRGBO(255, 255, 255, 0),
                              context: context,
                              builder: (BuildContext context) =>
                                  PickerDateDialog(
                                    mode: CupertinoDatePickerMode.date,
                                  )).then((valueFromDialog) {
                            if (valueFromDialog != null) {
                              DateTime fromDate = valueFromDialog[0];
                              dateController.text =
                                  DateFormat.yMMMd().format(fromDate);
                            }
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(200)),
                          child: const Icon(
                            Icons.date_range_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    left: padding,
                    right: padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              barrierColor:
                                  const Color.fromRGBO(255, 255, 255, 0),
                              context: context,
                              builder: (BuildContext context) =>
                                  PickerDateDialog(
                                    mode: CupertinoDatePickerMode.time,
                                  )).then((valueFromDialog) {
                            if (valueFromDialog != null) {
                              DateTime fromDate = valueFromDialog[0];
                              print(DateFormat('hh:mm a').format(fromDate));
                              startTimeController.text =
                                  DateFormat('hh:mm a').format(fromDate);
                            }
                          }); //
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              width: size.width * 0.4,
                              child: CustomTextField(
                                controller: startTimeController,
                                enableSuffixIcon: true,
                                labelText: 'Start time',
                              ),
                            ),
                            Container(
                              width: size.width * 0.4,
                              height: 70,
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              barrierColor:
                                  const Color.fromRGBO(255, 255, 255, 0),
                              context: context,
                              builder: (BuildContext context) =>
                                  const PickerDateDialog(
                                    mode: CupertinoDatePickerMode.time,
                                  )).then((valueFromDialog) {
                            if (valueFromDialog != null) {
                              DateTime fromDate = valueFromDialog[0];

                              print(DateFormat('hh:mm a').format(fromDate));
                              endTimeController.text =
                                  DateFormat('hh:mm a').format(fromDate);
                            }
                          }); //
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              width: size.width * 0.4,
                              child: CustomTextField(
                                enableSuffixIcon: true,
                                controller: endTimeController,
                                labelText: 'End time',
                              ),
                            ),
                            Container(
                              width: size.width * 0.4,
                              height: 70,
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: padding,
                    right: padding,
                  ),
                  child: CustomTextField(
                    controller: descriptionController,
                    labelText: 'Description',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "BTNTAG",
                        child: Container(
                          height: 50,
                          width: size.width * 0.7,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: Text(
                              "Create Task",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
