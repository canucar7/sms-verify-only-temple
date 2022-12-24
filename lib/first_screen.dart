
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw_2/guest_screen.dart';
import 'package:hw_2/login_screen.dart';
import 'package:hw_2/main.dart';



class FirstScreen extends ConsumerStatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends  ConsumerState<FirstScreen> {
  bool isActive =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child:AppBar(
          title: Container(
            padding: EdgeInsets.only(top: 20,left: 15),
            child: Text("PERSONNEL INFORMATION SYSTEM"),
          ),
          backgroundColor: Colors.green,
        ),
      ),


      body: Container(
          padding: EdgeInsets.only(top:80,left: 40,right: 40,bottom: 40) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
               TextField(
                 onTap: (){
                   setState((){
                     isActive = true;
                   });
                 },
                 controller: ref.read(phoneNumber),
                 decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: isActive ? TextStyle(color: Colors.green) :TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),


              SizedBox(
                height: 40,
              ),

              Container(
                height: 42,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                        builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Login ->',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),

              SizedBox(
                height: 40,
              ),

              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Divider(
                        color: Colors.grey,
                      )),
                ),
                Text("OR"),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        color: Colors.grey,
                      )),
                ),
              ]),

              SizedBox(
                height: 40,
              ),

              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                        builder: (context) => GuestScreen()));


                  },
                  child: Text(
                    'Continue without login',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 17,),
                  ),
                ),
              ),

            ],
          )),
    );
  }

}
