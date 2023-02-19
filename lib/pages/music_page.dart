import 'package:audioplayers/audioplayers.dart';
import 'package:fitness_ui_kit/pages/music_screens/relax.dart';
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
          musiccard('Relaxing Music','assets/music/relaxing.png','https://adornflow.com/songs/Starboy.mp3'),
          musiccard('Gym Music','assets/music/gym.png','https://adornflow.com/songs/ConCalma.mp3'),
          musiccard('Jogging Music','assets/music/jogging.png','https://adornflow.com/songs/Bailando.mp3')
        ]),
      )),
    );
  }
  Widget musiccard(musictype,imagepath,String audiourl)=>Card(
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
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Music(audioUrl: audiourl)),);
            },
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
