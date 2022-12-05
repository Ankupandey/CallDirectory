import 'dart:developer';

import 'package:first_project/CallDirectory.dart';
import 'package:first_project/Phonedirectory.dart';
import 'package:first_project/sigh_in_screen.dart';
import 'package:flutter/material.dart';
import 'InputTaker.dart';
import 'CallDirectory.dart';
//import 'sigh_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApplication',
      theme: ThemeData(
        // fontFamily: "cardo",
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PhoneDirectory(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class practice extends StatelessWidget {
  practice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Application"),
        ),
        body: Container(
          height: 500,
          width: 500,
          color: Colors.purple,
          alignment: Alignment.center,
          child: const Text(
            "Hello World",
          ),
        ),
      ),
    );
  }
}

class Dummy extends StatelessWidget {
  Dummy({super.key});

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("click buttom")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("=======tytyty");

          print(count);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("click buttom"), Text("$count")],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      appBar: AppBar(title: Text("click buttom")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("=======tytyty");
          setState(() {
            count++;
          });

          print(count);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("click buttom"), Text("$count")],
        ),
      ),
    );
  }
}

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment"),
      ), // AppBar

      body: Row(mainAxisAlignment: MainAxisAlignment.center),
    );
  }
}

class ClickButton extends StatelessWidget {
  const ClickButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text("ElevatedBotton"))
            ],
          ),
        ),
      ),
    );
  }
}

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 280,
            color: Colors.red,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 120,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 120,
                height: 200,
                color: Colors.pink,
              ),
              Container(
                width: 120,
                height: 200,
                color: Colors.orange,
              ),
            ],
          ),
          Container(
            height: 300,
            width: 280,
            color: Colors.orange,
          ),
        ],
      )),
    );
  }
}

class ButtonColors extends StatefulWidget {
  const ButtonColors({super.key});

  @override
  State<ButtonColors> createState() => _ButtonColorsState();
}

class _ButtonColorsState extends State<ButtonColors> {
  Color bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('ScreenColor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgColor = Colors.pink;
                  });
                },
                child: Text('Pink')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgColor = Colors.yellow;
                  });
                },
                child: Text('Yellow')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgColor = Colors.green;
                  });
                },
                child: Text('Green')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgColor = Colors.red;
                  });
                },
                child: Text('Red')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgColor = Colors.blue;
                  });
                },
                child: Text('Blue')),
          ],
        ),
      ),
    );
  }
}
