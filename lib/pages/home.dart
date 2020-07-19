import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage = data['isDayTime']
        ? 'https://c.tadst.com/gfx/1200x630/sunrise.png?1'
        : 'https://i.pinimg.com/originals/a5/fa/7c/a5fa7c37fe829b362fb82821742d036a.jpg';

    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(bgImage), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location')),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(fontSize: 60.0),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
