import 'package:flutter/material.dart';

class LecturerStartup extends StatefulWidget {
  const LecturerStartup({Key? key}) : super(key: key);

  @override
  State<LecturerStartup> createState() => _LecturerStartupState();
}

class _LecturerStartupState extends State<LecturerStartup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 320,
        width: 310,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/")
          )
        ),
      ),
    );
  }
}
