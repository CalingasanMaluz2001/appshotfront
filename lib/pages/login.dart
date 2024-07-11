import 'dart:convert';

import 'package:appshotfront/services/User.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey <FormState>();
  String username = '';
  String password ='';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  Widget buttonContent = Text('Login');
  Widget LoadingDisplay = CircularProgressIndicator();

  Future <bool>login(User user) async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8 '
      },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail' : user.username,
        'password' : user.password
      }),
    );
    if (response.statusCode ==200){
      return true;
    }
    return false;
    // print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white54,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:  const EdgeInsets.only(bottom: 1.0),
                  child: Image.asset(
                    'assets/logo2.png',
                    width: 600.0,
                    height: 300.0,
                  ),
                ),
                SizedBox(height: 1.0,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        maxLength: 40,
                        decoration: InputDecoration(
                            label: Text(
                              'Username',
                              style:TextStyle(color: Colors.black),
                            ),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            )
                        ),
                        validator: (value){
                          if(value == null|| value.isEmpty){
                            return 'Provide username';
                          }
                          if(value.length <2){
                            return 'Username should be atleast 3 letters long';
                          }
                          return null;
                        },
                        onSaved: (value){
                          username = value!;
                        },
                      ),

                      SizedBox(height: 10.0,),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          label: Text(
                            'Password',
                            style:TextStyle(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.lock_rounded),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureIcon),
                            onPressed:(){
                              setState(() {
                                _obscure = !_obscure;
                                if(_obscure){
                                  _obscureIcon = Icons.visibility_off;
                                }else{
                                  _obscureIcon = Icons.visibility;
                                }
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                        ),
                        validator: (value){
                          if(value==null|| value.isEmpty){
                            return'Provide a password';
                          }
                          if (value.length <8){
                            return'password should be atleast 8 characters long';
                          }
                          if (value.length>20){
                            return'Password must be 20 characters long';
                          }
                          return null;
                        },
                        onSaved: (value){
                          password = value!;
                        },
                      ),
                      SizedBox(height: 20.0,),
                      ElevatedButton(
                        onPressed: (){
                          if ( formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            User user = User(
                              username: username,
                              email: '',
                              password: password,
                            );
                            /* if (login(user)) {
                              Navigator.pushReplacementNamed(context, '/');
                            }*/
                            setState(() {
                              buttonContent = FutureBuilder(
                                  future: login(user),
                                  builder: (context, snapshots){
                                    if(snapshots.connectionState == ConnectionState.waiting){
                                      return LoadingDisplay;
                                    }
                                    if (snapshots.hasData){

                                    }
                                    return Text('Login');
                                  }
                              );
                            });
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        },
                        child: buttonContent,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[400],
                            foregroundColor: Colors.black
                        ),
                      ),
                      SizedBox(height: 25.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'or Login with',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      ElevatedButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.g_mobiledata),
                            SizedBox(width: 10.0,),
                            Text('Google'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.black
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      ElevatedButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook,),
                            SizedBox(width: 10.0,),
                            Text('Facebook'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            foregroundColor: Colors.black
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Dont have an account?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          InkWell(
                            child: Text(
                              'Signup Here',
                              style: TextStyle(
                                color: Colors.grey[850],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: ()=> Navigator.pushReplacementNamed(context,'/signup'),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}