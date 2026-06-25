import 'package:flutter/material.dart';
const Color dark = Color.fromARGB(255, 6, 12, 17);
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _Widget(),
        ),
      ),
    );
  }
}

class _Widget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
          Container(
            color: Colors.yellow,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.purple,
                  width: 50,
                  height: 100,
                ),
                  Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.cyan,
                  width: 50,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        color:Colors.purple,
                        width: 50,
                        height: 50,
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            width: 100,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}