import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../pages/add_page.dart';
import '../classes.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({Key? key, required this.list}) : super(key: key);

  final List<Data> list;

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 380,
                width: double.infinity,
                child: SvgPicture.asset(
                  "assets/012.svg",
                  color: Colors.white,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.black.withOpacity(0.7),
                          size: 32,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Stack(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Colors.black.withOpacity(0.7),
                              size: 32,
                            ),
                            Container(
                              width: 15,
                              height: 15,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(200)),
                              child: const Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "My Task",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddPage()),
                              );
                            },
                            child: Hero(
                              tag: "BTNTAG",
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Icon(Icons.add,
                                    color: Colors.white, size: 35),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "Monday, 1 June",
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  for (var item in widget.list) {
                                    item.ifSelected = false;
                                  }
                                  setState(() {
                                    widget.list[index].ifSelected = true;
                                  });
                                },
                                child: Container(
                                  width: 65,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: widget.list[index].ifSelected
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 1,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.list[index].number,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: widget.list[index].ifSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      Text(
                                        widget.list[index].day,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: widget.list[index].ifSelected
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, right: 45),
          child: SizedBox(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                "https://i.redd.it/70zvc38gfxv71.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
