import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw_2/main.dart';

import 'user_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();

}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final sms_controller= TextEditingController();
  int _start = 20;
  bool noTime = false;
  bool isActive = false;
  bool isCorrect = false;

  @override
  Widget build(BuildContext context) {
    String separetedPhoneNum = "(" + ref.read(phoneNumber).text.substring(0,4) + ") " +
        ref.read(phoneNumber).text.substring(4,7) + "-" +ref.read(phoneNumber).text.substring(7,ref.read(phoneNumber).text.length);
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
        padding: EdgeInsets.only(left: 40,top: 80,right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget>[
            Text(
              " Please enter the verification code sent\n"
                  "to your mobile phone number with ${separetedPhoneNum}",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),

            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                timer(),
              ],
            ),

            SizedBox(
              height: 40,
            ),


            TextField(
              onTap: (){
                setState((){
                  isActive = true;
                });
              },
              onChanged: (value) {
                if(value.length == 6){
                  isCorrect = true;
                }else isCorrect = false;
              },

              maxLength: 6,
              decoration:  InputDecoration(
                labelText: "SMS Code",
                labelStyle: isCorrect ? TextStyle(color: Colors.green) :(isActive ? TextStyle(color: Colors.red): TextStyle(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: isCorrect ? BorderSide(color: Colors.green, width: 2.0) : BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),

            SizedBox(
              height: 50,
            ),

            Container(
              height: 42,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30)),
              child: noTime ? TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black,),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                      builder: (context) => LoginScreen()));
                },
                child:  Text(
                  'Resend',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              )
                  : TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: isCorrect ? Colors.black : Colors.grey),
                onPressed: () {
                  if(isCorrect){
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                        builder: (context) => UserScreen()));
                  }else {}
                },
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              )  /*:*/

            ),

          ],
        ),
      ),
    );
  }

  Widget timer() {
    Timer( Duration(seconds: 1), () {
      if (_start > 0) {
        setState(() {
          _start--;
          print(_start);

        });
      }
      if (_start == 0) {
        noTime = true;
        _start=0;
      }
    });
    return Row(
      children: noTime ? [Icon(Icons.alarm,color: Colors.red), Text('${_start.toString()}',style: TextStyle(color: Colors.red),)]
          : [Icon(Icons.alarm), Text('${_start.toString()}')],
    );
  }


}
