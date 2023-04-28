import 'package:flutter/material.dart';
import 'package:musicplayer/sources/PlayingScreen.dart';
import 'package:musicplayer/sources/Library.dart';
import 'package:musicplayer/sources/HomeScreen.dart';
import 'package:musicplayer/sources/LoadingScreen.dart';


void main() => runApp(MaterialApp(
title: 'My Music Player App',
initialRoute: '/',
routes: {
'/': (context) => LoadingScreen(),
'/home': (context) => HomeScreen(),
'/library': (context) => Library(),
'/playing': (context) => PlayingScreen(),
},
));