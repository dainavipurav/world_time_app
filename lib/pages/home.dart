import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage = data['isDayTime']
        ? 'https://donecomsite.files.wordpress.com/2019/01/sunny-day-800x450.jpg'
        : 'https://images.unsplash.com/photo-1507400492013-162706c8c05e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80';

    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.grey[900];
    Color txtColor = data['isDayTime'] ? Colors.grey[900] : Colors.white;
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(bgImage), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');

                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: txtColor,
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(color: txtColor),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: txtColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(fontSize: 60.0, color: txtColor),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
