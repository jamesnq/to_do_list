import 'package:flutter/material.dart';

class UnCompletedScreen extends StatefulWidget {
  const UnCompletedScreen({Key? key}) : super(key: key);

  @override
  _UnCompletedScreenState createState() => _UnCompletedScreenState();
}

class _UnCompletedScreenState extends State<UnCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uncompleted'),
      ),
    );
  }
}
