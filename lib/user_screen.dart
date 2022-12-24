import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

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
        padding: EdgeInsets.only(left: 90,top: 130),
        child: Text(
          "   Welcome\nÖzgür Özşen!",
          style: TextStyle(color: Colors.grey, fontSize: 40),
        ),
      ),
    );
  }
}
