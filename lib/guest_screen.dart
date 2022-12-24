import 'package:flutter/material.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child:AppBar(
          title: Container(
            padding: EdgeInsets.only(top: 25,),
            child: Text("PERSONNEL INFORMATION SYSTEM",
              style: TextStyle(fontSize: 17) ,),
          ),
          backgroundColor: Colors.green,
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(left: 120,top: 130),
        child: Text(
          "Welcome\n   Guest!",
          style: TextStyle(color: Colors.grey, fontSize: 40),
        ),
      ),
    );
  }
}

