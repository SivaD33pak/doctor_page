import 'package:flutter/material.dart';

class Sort extends StatefulWidget {
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  Set<String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Sort())));
}