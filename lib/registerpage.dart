import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shadow/loginpage.dart';


import 'package:firebase_core/firebase_core.dart';

class PROJECT extends StatefulWidget {
  @override
  State<PROJECT> createState() => _PROJECTState();
}

class _PROJECTState extends State<PROJECT> {
  CollectionReference fire = FirebaseFirestore.instance.collection('logindetails');

  void add() async {
    await fire.add({
      "name": anamecnt.text,
      "mobilenumber": banamecnt.text,
      "password": dnamecnt.text,
      "email": cnamecnt.text,
    }).then((value) {
      print("Data added");
    });
  }

  Future<void> authenticate() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: cnamecnt.text,
        password: dnamecnt.text,
      );
      // User registered successfully
      print('User registered: ${userCredential.user!.uid}');
      // You can add additional logic here, such as navigating to a new screen.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var anamecnt = TextEditingController();
  var banamecnt = TextEditingController();
  var cnamecnt = TextEditingController();
  var dnamecnt = TextEditingController();
  var enamecnt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(

      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {},
                      controller: anamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person_add_alt_1_outlined),
                        border: OutlineInputBorder(),
                        labelText: "Name",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {},
                      controller: dnamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      controller: banamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.mobile_friendly_outlined),
                        border: OutlineInputBorder(),
                        labelText: "Mobile Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      controller: cnamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: authenticate,
                      child: Text("Save"),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), primary: Colors.transparent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => PROJEC(),
                          ),
                        );
                      },
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), primary: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}