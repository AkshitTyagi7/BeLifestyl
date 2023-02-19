import 'package:fitness_ui_kit/pages/root_app.dart';
import 'package:fitness_ui_kit/pages/today_target_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_ui_kit/pages/workouts.dart';
import 'package:fitness_ui_kit/pages/music_screens/relax.dart';
Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = new Map<String, dynamic>();

  switch (setting.name) {
    case '/root_app':
      return MaterialPageRoute(builder: (context) => RootApp());
    case '/today_target_detail':
      return MaterialPageRoute(builder: (context) => TodayTargetDetailPage());
    case '/workouts':
      return MaterialPageRoute(builder: (context) => Workoutspage());
    case '/relax':
      return MaterialPageRoute(builder: (context) => Music(audioUrl: 'https://adornflow.com/songs/Starboy.mp3'));
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(),
              ));
  }
}