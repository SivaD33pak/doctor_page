import 'package:flutter/material.dart';

class Choicechip extends StatefulWidget {
  @override
  _ChoiceChipDemoState createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<Choicechip> {
  Set<String> selectedValues = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 16),
          _buildChoiceChip('Rating 4.5+'),
          const SizedBox(width: 10),
          _buildChoiceChip('Hospitals'),
          const SizedBox(width: 10),
          _buildChoiceChip('Home care'),
          const SizedBox(width: 10),
          _buildChoiceChip('Specialist'),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(String label) {
    return Container(
      height: 43,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF5F6D), Color(0xFF845EC2)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ChoiceChip(
          label: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          selected: selectedValues.contains(label),
          selectedColor: Color.fromARGB(177, 103, 151, 255),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(width: 1, color: Colors.transparent),
          ),
          onSelected: (bool selected) {
            setState(() {
              selected ? selectedValues.add(label) : selectedValues.remove(label);
            });
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Choicechip())));
}