import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Animation Test';
  static const IconData airplanemode_active = IconData(0xe06e, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),backgroundColor: Colors.grey[900],),
        body: const MyStatefulWidget(),backgroundColor: Colors.grey[600],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool select = false;

  void _updatePadding(double value) {
    setState(() {
      select = !select;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Container(
          height: 500,
          color: Colors.grey[600],
          child: AnimatedAlign(
            alignment: select ? Alignment.topCenter : Alignment.bottomCenter,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: Icon(
              Icons.airplanemode_active,
              color: Colors.black,
              size: 70,
            ),
            onEnd: () {
              setState(() {
                select = false;
              });
            },


          ),),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800]
          ),
              icon: Icon(
                Icons.airplanemode_active,
                color: Colors.white,
                size: 30,
              ),
              label: Text("出發",style:TextStyle(fontSize: 30),),
              onPressed: () {
                setState(() {
                  select = !select;
                });
                ;
              }
          ),


      ],



    )
    );
  }
}


