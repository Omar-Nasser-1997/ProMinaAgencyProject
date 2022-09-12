import 'package:flutter/material.dart';
import '../core/classes.dart';
import '../core/widgets/down_list_widget.dart';
import '../core/widgets/top_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> list = [];

  List<DataTypeTwo> listTypeTwo = [];

  @override
  void initState() {
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TopWidget(
            list: list,
          ),
          DownListWidget(
            listTypeTwo: listTypeTwo,
          ),
        ],
      ),
    );
  }

  initData() {
    list = [
      Data(day: 'M', number: "01", ifSelected: true),
      Data(day: 'T', number: "02", ifSelected: false),
      Data(day: 'W', number: "03", ifSelected: false),
      Data(day: 'W', number: "04", ifSelected: false),
      Data(day: 'W', number: "05", ifSelected: false),
      Data(day: 'W', number: "06", ifSelected: false),
      Data(day: 'W', number: "07", ifSelected: false),
    ];

    listTypeTwo = [
      DataTypeTwo(
          title: 'Team Meeting',
          time: '10:00 AM',
          icon: null,
          text: 'Discuss all questionsabout new projects'),
      DataTypeTwo(
          title: 'Call the stylist',
          time: '11:00 AM',
          icon: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(90, 153, 219, 0.5),
                  borderRadius: BorderRadius.circular(200)),
              child: const Icon(
                Icons.phone,
                color: Colors.white,
              )),
          text: 'Agree on an evening look'),
      DataTypeTwo(
          title: 'Check mail',
          time: '12:00 AM',
          icon: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(90, 153, 219, 0.5),
                  borderRadius: BorderRadius.circular(200)),
              child: const Icon(
                Icons.mail,
                color: Colors.white,
              )),
          text: 'Write to the manager'),
    ];
  }
}
