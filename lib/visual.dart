import 'package:flutter/material.dart';

class Visual extends StatefulWidget {
  const Visual({Key? key}) : super(key: key);

  @override
  State<Visual> createState() => _VisualState();
}

class _VisualState extends State<Visual> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(
          title: Text('Visualization'),
        ),
      ),
    );
  }
}
