import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shadow/registerpage.dart';

import 'bottom.dart';
import 'package:shadow/bottom.dart';


class PROJEC extends StatefulWidget {
  @override
  State<PROJEC> createState() => _PROJECState();
}

class _PROJECState extends State<PROJEC> {
  String email = '';
  String password = '';

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> login() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Botton()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not found'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect password'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 40,
                    child: Text(
                   " SHADOW       ",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 40,
                      ),
                    ),
                  ),

                   Text(
                    "       online shopping        ",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 48.0, // You can adjust the size as needed
                    color: Colors.black, // You can choose a different color
                  ),
                  Text(
                    "IF YOU CAN'T STOP ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "  THINKING ABOUT IT....",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Buy it",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 35,
                    ),
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 48.0, // You can adjust the size as needed
                    color: Colors.black, // You can choose a different color
                  ),

                  SizedBox(
                    width: 190,
                    height: 180,
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {},
                        controller: emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29)
                          ),
                          labelText: "Email",
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
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29)
                          ),
                          labelText: "Password",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: login,
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(), primary: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 200,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => PROJECT()),
                          );
                        },
                        child: Text("Register"),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(), primary: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  SizedBox(height: 5.0),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => PROJECT()),
                        );
                      },
                      child: Text(
                        " sign up managing",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}