import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Music Playlists",
                                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                
              ])
            ],
          ),
          musiccard('Relaxing Music','assets/music/relaxing.png'),
          musiccard('Gym Music','assets/music/gym.png'),
          musiccard('Jogging Music','assets/music/jogging.png')
        ]),
      )),
    );
  }
  Widget musiccard(musictype,imagepath)=>Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          
          image: AssetImage(imagepath),
          height: 240,
          fit: BoxFit.cover,
          child: InkWell(
            onTap: (){},
          ),
        ),
        Text(musictype,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),)
      ],
    ),
  );
}
