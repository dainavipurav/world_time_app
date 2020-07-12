import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    print('Init function ran');
  }

  @override
  Widget build(BuildContext context) {
    print('Build Function Ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Coose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RaisedButton(
          child: Text('Counter is $counter'),
          onPressed: () {
            setState(() {
              counter = counter + 1;
            });
          }),
    );
  }
}
