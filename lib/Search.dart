import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Set<String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Search())));
}