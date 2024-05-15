import 'package:flutter/material.dart';


class StudentInfo extends StatefulWidget {
  final String name;
  final String info;

  const StudentInfo({super.key, required this.name, required this.info});

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        children: [
          Text(widget.name),
          Text(widget.info),
        ],
      ),
    );
  }
}