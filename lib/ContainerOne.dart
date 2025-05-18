import 'package:flutter/material.dart';

class Containerone extends StatefulWidget {
  @override
  _ContaineroneState createState() => _ContaineroneState();
}

class _ContaineroneState extends State<Containerone> {
  Set<String> selectedValues = {};

  @override
  Widget build(BuildContext context) {
    return Container(
                            width: 380,
                            height: 260,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: const Color.fromARGB(138, 97, 110, 147),
                                width: 5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.asset(
                                          'assets/Drkeerthi.JPG',
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dr. Keerthi Raj",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text("MBBS, Dermatology",
                                              style: TextStyle(fontSize: 16)),
                                          Text("10 Years of Experience",
                                              style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                      const SizedBox(width: 30),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              'assets/bronze.png',
                                              width: 35,
                                              height: 35,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(height: 1),
                                          Text(
                                              "Bronze\n"
                                              "Holder",
                                              style: TextStyle(fontSize: 13)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(136, 65, 65, 65),
                                    thickness: 4,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.asset(
                                            'assets/hospital.png',
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Keeps text aligned to left
                                          children: [
                                            Text(
                                              "SP Medfort Multispeciality Hospital",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Enchakkal, Trivandrum",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Available Today",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "At 3:00 PM",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        "₹600",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //SizedBox(height: 20),
                                      SizedBox(width: 5),
                                      Text(
                                        "Consultation Fee",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(width: 20),
                                      SizedBox(
                                        width: 130,
                                        height: 40,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    255, 255, 0, 43), // Red
                                                Color.fromARGB(
                                                    255, 0, 55, 255), // Purple
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(70),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(70),
                                              ),
                                            ),
                                            child: const Text(
                                              "Book Now",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Containerone())));
}