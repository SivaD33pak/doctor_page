import 'package:doctor_page/AdContainer.dart';
import 'package:doctor_page/ContainerOne.dart';
import 'package:doctor_page/ContainerThree.dart';
import 'package:doctor_page/ContainerTwo.dart';
import 'package:doctor_page/FilterButton.dart';
import 'package:doctor_page/Search.dart';
import 'package:doctor_page/Sort.dart';
import 'package:doctor_page/choicechip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US')],
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedSegment = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 213, 237, 255),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Container(
              //color: Colors.blue,
              height: 80.0,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(94, 208, 212, 255),
                    blurRadius: 5,
                    spreadRadius: 7,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 213, 237, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Search(),// Search bar
                    const SizedBox(width: 10),
                    Filterbutton(),// Filter button
                    const SizedBox(width: 10),
                    Sort(), // Sort button
                  ],
                ),
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: CupertinoSlidingSegmentedControl<int>(
                    children: {
                      0: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In-Clinic',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Appointment',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      1: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Online',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Appointment',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    },
                    onValueChanged: (int? value) {
                      setState(() {
                        _selectedSegment = value ?? _selectedSegment;
                      });
                    },
                    groupValue: _selectedSegment,
                    backgroundColor: const Color.fromARGB(177, 103, 151, 255),
                  ),
                ),
              ),

              Choicechip(), //ChoiceChips

              SizedBox(height: 5),

              // This is the main content of the page
              if (_selectedSegment == 0)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: const Color.fromARGB(107, 27, 125, 206),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),

                          Containerone(), // First Container

                          const SizedBox(height: 10),

                          AdContainer(), // Ad Container

                          const SizedBox(height: 10),

                          ContainerTwo(), // Second Container

                          const SizedBox(height: 15),

                          ContainerThree(), // Third Container

                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              if (_selectedSegment == 1)
                const Text('Coming Soon..',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
