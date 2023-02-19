

import 'package:flutter/material.dart';

class Workoutspage extends StatefulWidget {
  const Workoutspage({Key? key}) : super(key: key);
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}
class _WorkoutPageState extends State<Workoutspage> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Workouts'),),
    body: GridView(
      
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
          musiccard('Chest','assets/workouts/chest1.png'),
          musiccard('Shoulders','assets/workouts/Shoulder.png'),
          musiccard('Arms','assets/workouts/arms.png'),
          musiccard('Back','assets/workouts/back.png'),
          musiccard('Legs','assets/workouts/legs.png'),
          musiccard('Core','assets/workouts/core.png'),
          musiccard('Upper Body','assets/workouts/upperbody.png'),
          musiccard('Upper Body','assets/workouts/fullbody.jpeg'),
      ],
    ),
  );








}
  Widget musiccard(musictype,imagepath)=>Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomLeft,
      
      children: [
        Ink.image(
          image: AssetImage(imagepath),
          height: 240,
          fit: BoxFit.cover,
          child: InkWell(
            onTap: (){},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(musictype,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight:FontWeight.bold,
          ),),
        )
      ],
    ),
  );
}