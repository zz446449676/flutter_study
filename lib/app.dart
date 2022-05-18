import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset(
          'images/benhuai.jpg',
          color: Colors.brown,
          colorBlendMode: BlendMode.softLight,
          fit: BoxFit.cover,
        ),
        // transform: Matrix4.rotationZ(0.5),
        // transformAlignment: Alignment.topRight,
        width: 350,
        height: 350,
        padding: EdgeInsets.all(100),
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow,
              Colors.pinkAccent,
              Colors.blue,
              Colors.cyan,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.yellow,
              offset: Offset(5,20),
              blurRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}