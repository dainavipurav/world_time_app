import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    //simulate n/w req for the usrname
    String userName = await Future.delayed(Duration(seconds: 3), () {
      return 'Dainavi';
    });

    //simulate n/w req for the bio
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'Developer';
    });

    print('$userName - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('Hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Coose Location'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Text('data'));
  }
}
