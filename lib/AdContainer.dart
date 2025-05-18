import 'package:flutter/material.dart';

class AdContainer extends StatefulWidget {
  @override
  _AdContainerState createState() => _AdContainerState();
}

class _AdContainerState extends State<AdContainer> {
  Set<String> selectedValues = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 380,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF845EC2),
                                        Color.fromARGB(255, 64, 46, 123),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Container 2",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 380,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFFF5F6D),
                                        Color(0xFF845EC2),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Container 2",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 30, 255)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: 380,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFFF5F6D),
                                        Color(0xFF845EC2),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Container 2",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 30, 255)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: AdContainer())));
}