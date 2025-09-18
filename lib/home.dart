import 'package:flutter/material.dart';
import 'package:homeshop/body.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blueGrey,
              child: Center(child: Text("RazorPay",style: TextStyle(color: Colors.white,fontSize: 20),),),
            )
          ]
        )
      )),
      appBar: AppBar(title: Center(child: Text("RazorPay")),),
      body:body() ,

    );
  }
}