import 'package:custom_app_bar/main2.dart';
import 'package:custom_app_bar/simple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class m1 extends StatefulWidget {
  const m1({Key? key}) : super(key: key);

  @override
  _m1State createState() => _m1State();
}

class _m1State extends State<m1> {
  Color _color = Colors.white;
  double _h = 0;
  double _wd = 0;
  double _hd = 0;

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => m2()));
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_wd == 0) {
                                    _wd = MediaQuery.of(context).size.width;
                                    _hd = MediaQuery.of(context).size.height *
                                        0.75;
                                  } else {
                                    _wd = 0;
                                    _hd = 0;
                                  }
                                });
                                // drawer here
                              },
                              icon: Icon(Icons.menu))),
                      Text(
                        'Main1',
                        style: TextStyle(fontSize: 25),
                      ),
                      InkWell(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_h == 0) {
                                _h = 70;
                              } else {
                                _h = 0;
                              }
                            });
                          },
                          icon: Icon(Icons.search),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //-------------------------------------
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    AnimatedContainer(
                      height: _hd,
                      width: _wd,
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: Duration(
                        milliseconds: 350,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                  maxRadius: 70,
                                  minRadius: 50,
                                ),
                                Divider(),
                              InkWell(
                                onTap: (){},
                                child: Card(
                                  child: ListTile(
                                    title: Text('home'),
                                    trailing: Icon(Icons.home),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){},
                                child: Card(
                                  child: ListTile(
                                    title: Text('searrch'),
                                    trailing: Icon(Icons.search),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
             
                    Expanded(
                      child: ListView(
                        children: [
                          //--------------------------------
                          AnimatedContainer(
                            height: _h,
                            width: MediaQuery.of(context).size.width * 0.99,
                            decoration: BoxDecoration(
                              color: _color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            duration: Duration(
                              milliseconds: 350,
                            ),
                            child: Center(
                              child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.search),
                                        color: Colors.black,
                                        onPressed: () {},
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          _controller.clear();
                                        },
                                      ))),
                            ),
                          ),

                          Divider(),
                          Image.asset('asset/bg.jpg'),
                          Divider(),
                          SelectableText(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
                        ],
                      ),
                    ),
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
