import 'dart:async';

import 'package:custom_app_bar/simple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class m3 extends StatefulWidget {
  const m3({ Key? key }) : super(key: key);

  @override
  _m3State createState() => _m3State();
}

class _m3State extends State<m3> {
  initState(){
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      if (_time.minute!=DateTime.now().minute) {
        setState(() {
         _time = TimeOfDay.now();
        });
      }
    });
  }
   TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (_) => s()));
        }
      ),
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
          child: Container(
            height: 350,
            color: Colors.amberAccent,
            child: Padding(
              padding: const EdgeInsets.only(top: 15,left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                      }, icon: Icon(Icons.menu)),
                      IconButton(onPressed: (){
        
                      }, icon: Icon(Icons.settings))
                    ],
                  ),
                  SizedBox(height: 50,),
                  //--------------------------------------------------------
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                           height: 100,
                           width: 120,
                           color: Colors.white,
                           child: Center(child: Text('data')),
                          ),
                        ),
                        SizedBox(width: 10,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                           height: 100,
                           width: 120,
                           color: Colors.blue,
                           child: Center(child: Text('data')),
                          ),
                        ),
                        SizedBox(width: 10,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                           height: 100,
                           width: 120,
                           color: Colors.red,
                           child: Center(child: Text('data')),
                          ),
                        ),
                      ],),
                  ),
                  //-----------------------------------------------------------------------
                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${_time.hour}:${_time.minute}", style: TextStyle(fontSize: 70),)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(DateTime.now().day.toString()+'/'+DateTime.now().month.toString(), style: TextStyle(fontSize: 50),))
                ],
              ),
            ),
          ),
        ) 
        ),
    );
  }
}