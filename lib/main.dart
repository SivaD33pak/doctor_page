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
  Set<String> selectedValues = {};
  Set<String> selectedOptions = {};
  Set<String> selectedSort = {};

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
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90.0),
                          border: Border.all(
                            color: const Color.fromARGB(88, 104, 104, 104),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search for a specialist',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 40,
                      height: 45,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 213, 213, 252),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: IconButton(
  icon: const Icon(Icons.sort),
  onPressed: () {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        String selectedFilter = "Specializatons";
        List<String> selectedSort = [];
        //double sliderValue = 0.5; // Initial slider value

        final Map<String, List<String>> filterOptions = {
          "Specializatons": ["Favourites","Cardiology","Dermatology","Gastroenterology","Neurology",
                             "Orthopedics","Pediatrics","Psychiatry","Radiology","Urology","Dentistry"],
          "Experience": ["Less than 1 year","1 - 3 years","3 - 5 years","5 - 10 years","10+ years"],
          "Consultation Fees": ["Less than ₹500","₹500 - ₹1000","₹1000 - ₹2000","₹2000 - ₹5000","₹5000+"],
          "Distance": ["Less than 5 km","5 - 10 km","10 - 20 km","20 - 50 km", "50+ km"],
          "Availability": ["Anytime","Next 2 Hours","Today","Tomorrow","Thursday, 15 May",
                           "Friday, 16 May","Saturday, 17 May"],
        };

        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 600,
              child: Column(
                children: [
                  // Heading "Filter" with underline
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
  children: [
    Row(
      children: [ // Added "children" list
        IconButton(
          icon: const Icon(Icons.sort),
          onPressed: () {}, // Added onPressed to resolve error
        ),
        const Text(
          "FILTER",
          style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(153, 0, 0, 0),
          ),
        ),
      ],
    ),
    const Divider(thickness: 1, color: Colors.grey),
  ],
),
                  ),

                  // Main Filter UI
                  Expanded(
                    child: Row(
                      children: [
                        // Left Panel - Filter Categories
                        Expanded(
                          flex: 3,
                          child: ListView(
                            children: filterOptions.keys.map((category) {
                              return ListTile(
                                title: Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: selectedFilter == category ? FontWeight.bold : FontWeight.normal,
                                    color: selectedFilter == category
                                        ? const Color.fromARGB(255, 73, 100, 255)
                                        : Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedFilter = category;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),

                        // Vertical Divider between panels
                        Container(width: 1.5, color: Colors.grey),

                        // Right Panel - Display Selected Filter Options with CupertinoSlider
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  children: filterOptions[selectedFilter]?.map((option) {
                                    return ListTile(
                                      title: Text(
                                        option,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: selectedSort.contains(option) ? FontWeight.bold : FontWeight.normal,
                                          color: selectedSort.contains(option)
                                              ? const Color.fromARGB(255, 73, 100, 255)
                                              : Colors.black,
                                        ),
                                      ),
                                      trailing: Icon(
                                        selectedSort.contains(option) ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                        color: const Color.fromARGB(255, 144, 157, 232),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedSort.contains(option)
                                              ? selectedSort.remove(option) // Deselect
                                              : selectedSort.add(option); // Select
                                        });
                                      },
                                    );
                                  }).toList() ?? [const Center(child: Text("Select a filter"))],
                                ),
                              ),

                              // CupertinoSlider for Experience, Consultation Fees, Distance
                             // if (["Experience", "Consultation Fees", "Distance"].contains(selectedFilter))
                                //Padding(
                                 // padding: const EdgeInsets.all(12.0),
                                 // child: Column(
                                  //  mainAxisAlignment: MainAxisAlignment.center, // Center slider vertically
                                   // children: [
                                    //  Text(
                                     //   "Adjust $selectedFilter Preference: ${sliderValue.toInt()}",
                                     //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                     // ),
                                      //CupertinoSlider(
                                       // value: sliderValue,
                                       // min: 1.0,
                                       // max: 100.0,
                                       // divisions: 99,
                                       // onChanged: (value) {
                                        //  setState(() {
                                         //   sliderValue = value;
                                        //  });
                                       // },
                                     // ),
                                    //],
                                  //),
                                //),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
// Apply & Clear Buttons Styled Like the Image
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Clear All Button - Plain Text
      TextButton(
        onPressed: () {
          setState(() {
            selectedSort.clear();  // Clears all selected filters
           // sliderValue = 1.0;  // Resets slider to default
            selectedFilter = "Specializatons";  // Resets to default category
          });
        },
        child: const Text(
          "Clear All",
          style: TextStyle(color: Colors.black, fontSize: 16), // Simple text style
        ),
      ),

      // Apply Button - Blue Background with White Text
      SizedBox(
        width: 120,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Close modal after applying filters
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 73, 100, 255), // Blue background
            foregroundColor: Colors.white, // White text
          ),
          child: const Text("Apply", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    ],
  ),
),
                ],
              ),
            );
          },
        );
      },
    );
  },
  iconSize: 24,
  padding: EdgeInsets.zero,
),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 40,
                      height: 45,
                      child: Material(
                        // Wrap with Material
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 213, 213, 252),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.import_export),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 500,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 20),
                                            Text(
                                              "SORT BY",
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: const Color.fromARGB(
                                                    153, 0, 0, 0),
                                              ),
                                            ),
                                            Divider(
                                              color: const Color.fromARGB(
                                                  67, 91, 91, 91),
                                              thickness: 1,
                                            ),
                                            const SizedBox(height: 5),
                                            // ✅ Multi-select radio-style options
                                            ...[
                                              "What's new",
                                              "Price - high to low",
                                              "Popularity",
                                              "Discount",
                                              "Price - low to high",
                                              "Customer Rating"
                                            ].map((option) {
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return Container(
                                                    //child: SizedBox(height: 50),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: selectedOptions
                                                              .contains(option)
                                                          ? const Color
                                                              .fromARGB(
                                                              0, 204, 208, 255)
                                                          : const Color
                                                              .fromARGB(
                                                              0, 255, 255, 255),
                                                    ),
                                                    child: ListTile(
                                                      title: Text(
                                                        option,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              selectedOptions
                                                                      .contains(
                                                                          option)
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                          color: selectedOptions
                                                                  .contains(
                                                                      option)
                                                              ? const Color
                                                                  .fromARGB(255,
                                                                  73, 100, 255)
                                                              : const Color
                                                                  .fromARGB(
                                                                  255, 0, 0, 0),
                                                        ),
                                                      ),
                                                      trailing: Icon(
                                                        selectedOptions
                                                                .contains(
                                                                    option)
                                                            ? Icons
                                                                .radio_button_checked
                                                            : Icons
                                                                .radio_button_unchecked,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 144, 157, 232),
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          if (selectedOptions
                                                              .contains(
                                                                  option)) {
                                                            selectedOptions.remove(
                                                                option); // Deselect
                                                          } else {
                                                            selectedOptions.add(
                                                                option); // Select
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              iconSize: 24,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                    ),
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

              const SizedBox(height: 1),
              //ChoiceChips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    //Container for the first ChoiceChip
                    Container(
                      height: 43,
                      //width: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF5F6D),
                            Color(0xFF845EC2),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ChoiceChip(
                          label: const Text('Rating 4.5+',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          selected: selectedValues.contains('Rating 4.5+'),
                          selectedColor:
                              const Color.fromARGB(129, 103, 151, 255),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: Colors.transparent,
                            ),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              selected
                                  ? selectedValues.add('Rating 4.5+')
                                  : selectedValues.remove('Rating 4.5+');
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),
                    //Container for the second ChoiceChip
                    Container(
                      height: 43,
                      //width: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF5F6D),
                            Color(0xFF845EC2),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ChoiceChip(
                          label: const Text('Hospitals',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          selected: selectedValues.contains('Hospitals'),
                          selectedColor:
                              const Color.fromARGB(177, 103, 151, 255),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: Colors.transparent,
                            ),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              selected
                                  ? selectedValues.add('Hospitals')
                                  : selectedValues.remove('Hospitals');
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),
                    //Container for the third ChoiceChip
                    Container(
                      height: 43,
                      //width: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF5F6D),
                            Color(0xFF845EC2),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ChoiceChip(
                          label: const Text('Home care',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          selected: selectedValues.contains('Home care'),
                          selectedColor:
                              const Color.fromARGB(177, 103, 151, 255),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: Colors.transparent,
                            ),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              selected
                                  ? selectedValues.add('Home care')
                                  : selectedValues.remove('Home care');
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),
                    //Container for the fourth ChoiceChip
                    Container(
                      height: 43,
                      //width: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF5F6D),
                            Color(0xFF845EC2),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ChoiceChip(
                          label: const Text('Specialist',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          selected: selectedValues.contains('Specialist'),
                          selectedColor:
                              const Color.fromARGB(177, 103, 151, 255),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: Colors.transparent,
                            ),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              selected
                                  ? selectedValues.add('Specialist')
                                  : selectedValues.remove('Specialist');
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),

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

                          // First Container
                          Container(
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
                          ),

                          const SizedBox(height: 10),
                          // Second Container

                          SingleChildScrollView(
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
                          ),

                          const SizedBox(height: 10),

                          // Third Container
                          Container(
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
                                          'assets/doctor.jpg',
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
                                            "Dr. Anand R J",
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
                          ),

                          const SizedBox(height: 15),
                          // Fourth Container
                          Container(
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
                                          'assets/doctor.jpg',
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
                                            "Dr. Anand R J",
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
                          ),

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
