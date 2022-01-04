import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:lock_orientation/lock_orientation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _orientation='init';
  bool islock=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(onPressed: (){
                getOrientation().then((ori) {
                  setState(() {
                    _orientation=ori.toString();
                  });
                });
              },child: Text(_orientation),),
              Switch(value: islock, onChanged: (v){
                if(islock) {
                  unlockOrientation();
                }else{
                  lockOrientation();
                }
                setState(() {
                  islock=v;
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
