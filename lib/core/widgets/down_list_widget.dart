
import 'package:flutter/material.dart';

import '../classes.dart';

class DownListWidget extends StatefulWidget {
  DownListWidget({Key? key,required this.listTypeTwo}) : super(key: key);

  List<DataTypeTwo> listTypeTwo;
  @override
  State<DownListWidget> createState() => _DownListWidgetState();
}

class _DownListWidgetState extends State<DownListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      width: double.infinity,
      height: size.height - 365,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(90, 153, 219, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Scrollbar(
          thickness: 5,
          isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.left,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: widget.listTypeTwo.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 10, bottom: 10),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  if (widget.listTypeTwo[index].icon == null)
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(3),
                                              child: SizedBox(
                                                height: 35,
                                                width: 35,
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(10),
                                                  child: Image.network(
                                                    "https://i.redd.it/70zvc38gfxv71.jpg",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(3),
                                              child: SizedBox(
                                                height: 35,
                                                width: 35,
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(10),
                                                  child: Image.network(
                                                    "https://i.redd.it/70zvc38gfxv71.jpg",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(3),
                                              child: SizedBox(
                                                height: 35,
                                                width: 35,
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(10),
                                                  child: Image.network(
                                                    "https://i.redd.it/70zvc38gfxv71.jpg",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(3),
                                              child: Container(
                                                alignment:
                                                Alignment.center,
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Theme.of(
                                                          context)
                                                          .primaryColor,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10)),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  if (widget.listTypeTwo[index].icon != null)
                                    widget.listTypeTwo[index].icon!,
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.listTypeTwo[index].title,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                          width: size.width * 0.35,
                                          child: Text(
                                            widget.listTypeTwo[index].text,
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    90, 153, 219, 0.6),
                                                fontWeight:
                                                FontWeight.w500),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: Text(
                            widget.listTypeTwo[index].time,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}