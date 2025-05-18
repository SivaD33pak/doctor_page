import 'package:flutter/material.dart';

class Filterbutton extends StatefulWidget {
  @override
  _FilterbuttonState createState() => _FilterbuttonState();
}

class _FilterbuttonState extends State<Filterbutton> {
  Set<String> selectedValues = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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

                                  final Map<String, List<String>>
                                      filterOptions = {
                                    "Specializatons": [
                                      "Favourites",
                                      "Cardiology",
                                      "Dermatology",
                                      "Gastroenterology",
                                      "Neurology",
                                      "Orthopedics",
                                      "Pediatrics",
                                      "Psychiatry",
                                      "Radiology",
                                      "Urology",
                                      "Dentistry"
                                    ],
                                    "Experience": [
                                      "Less than 1 year",
                                      "1 - 3 years",
                                      "3 - 5 years",
                                      "5 - 10 years",
                                      "10+ years"
                                    ],
                                    "Consultation Fees": [
                                      "Less than ₹500",
                                      "₹500 - ₹1000",
                                      "₹1000 - ₹2000",
                                      "₹2000 - ₹5000",
                                      "₹5000+"
                                    ],
                                    "Distance": [
                                      "Less than 5 km",
                                      "5 - 10 km",
                                      "10 - 20 km",
                                      "20 - 50 km",
                                      "50+ km"
                                    ],
                                    "Availability": [
                                      "Anytime",
                                      "Next 2 Hours",
                                      "Today",
                                      "Tomorrow",
                                      "Thursday, 15 May",
                                      "Friday, 16 May",
                                      "Saturday, 17 May"
                                    ],
                                  };

                                  return StatefulBuilder(
                                    builder: (context, setState) {
                                      return SizedBox(
                                        height: 600,
                                        child: Column(
                                          children: [
                                            // Heading "Filter" with underline
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      // Added "children" list
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.sort),
                                                        onPressed:
                                                            () {}, // Added onPressed to resolve error
                                                      ),
                                                      const Text(
                                                        "FILTER",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          color: Color.fromARGB(
                                                              153, 0, 0, 0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(
                                                      thickness: 1,
                                                      color: Colors.grey),
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
                                                      children: filterOptions
                                                          .keys
                                                          .map((category) {
                                                        return ListTile(
                                                          title: Text(
                                                            category,
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: selectedFilter ==
                                                                      category
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                              color: selectedFilter ==
                                                                      category
                                                                  ? const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      73,
                                                                      100,
                                                                      255)
                                                                  : Colors
                                                                      .black,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            setState(() {
                                                              selectedFilter =
                                                                  category;
                                                            });
                                                          },
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),

                                                  // Vertical Divider between panels
                                                  Container(
                                                      width: 1.5,
                                                      color: Colors.grey),

                                                  // Right Panel - Display Selected Filter Options with CupertinoSlider
                                                  Expanded(
                                                    flex: 4,
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: ListView(
                                                            children: filterOptions[
                                                                        selectedFilter]
                                                                    ?.map(
                                                                        (option) {
                                                                  return ListTile(
                                                                    title: Text(
                                                                      option,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight: selectedSort.contains(option)
                                                                            ? FontWeight.bold
                                                                            : FontWeight.normal,
                                                                        color: selectedSort.contains(option)
                                                                            ? const Color.fromARGB(
                                                                                255,
                                                                                73,
                                                                                100,
                                                                                255)
                                                                            : Colors.black,
                                                                      ),
                                                                    ),
                                                                    trailing:
                                                                        Icon(
                                                                      selectedSort.contains(
                                                                              option)
                                                                          ? Icons
                                                                              .radio_button_checked
                                                                          : Icons
                                                                              .radio_button_unchecked,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          144,
                                                                          157,
                                                                          232),
                                                                    ),
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        selectedSort.contains(option)
                                                                            ? selectedSort.remove(option) // Deselect
                                                                            : selectedSort.add(option); // Select
                                                                      });
                                                                    },
                                                                  );
                                                                }).toList() ??
                                                                [
                                                                  const Center(
                                                                      child: Text(
                                                                          "Select a filter"))
                                                                ],
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // Clear All Button - Plain Text
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedSort
                                                            .clear(); // Clears all selected filters
                                                        // sliderValue = 1.0;  // Resets slider to default
                                                        selectedFilter =
                                                            "Specializatons"; // Resets to default category
                                                      });
                                                    },
                                                    child: const Text(
                                                      "Clear All",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              16), // Simple text style
                                                    ),
                                                  ),

                                                  // Apply Button - Blue Background with White Text
                                                  SizedBox(
                                                    width: 120,
                                                    height: 45,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context); // Close modal after applying filters
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor: const Color
                                                            .fromARGB(
                                                            255,
                                                            73,
                                                            100,
                                                            255), // Blue background
                                                        foregroundColor: Colors
                                                            .white, // White text
                                                      ),
                                                      child: const Text("Apply",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
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
                    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Filterbutton())));
}