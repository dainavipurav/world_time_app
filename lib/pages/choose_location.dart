import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Asia/Almaty',
        location: 'Almaty',
        flag:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Flag_of_Almaty.svg/1280px-Flag_of_Almaty.svg.png'),
    WorldTime(
        url: 'Asia/Kolkata',
        location: 'Kolkata',
        flag:
            'https://media-cdn.tripadvisor.com/media/photo-s/04/73/26/4d/let-s-meet-up-day-tours.jpg'),
    WorldTime(
        url: 'Asia/Amman',
        location: 'Amman',
        flag:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Amman_Jordan_Flag.svg/1200px-Amman_Jordan_Flag.svg.png'),
    WorldTime(
        url: 'Asia/Anadyr',
        location: 'Anadyr',
        flag:
            'https://i.pinimg.com/originals/e2/04/f4/e204f4bb7cd391064ce112d5deae6097.png'),
    WorldTime(
        url: 'Asia/Bangkok',
        location: 'Bangkok',
        flag:
            'https://image.shutterstock.com/image-illustration/background-thailand-flag-260nw-164189930.jpg'),
    WorldTime(
        url: 'Asia/Beirut',
        location: 'Beirut',
        flag:
            'https://cdn.webshopapp.com/shops/94414/files/52401388/flag-of-lebanon.jpg'),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag:
            'https://image.shutterstock.com/image-vector/official-uk-flag-united-kingdom-260nw-153708980.jpg'),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'https://cdn.countryflags.com/thumbs/south-korea/flag-400.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                    print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
