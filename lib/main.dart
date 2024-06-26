import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('App Shots'),
        ),

        backgroundColor : Colors.pink[900],
      ),
      body: Center(
          child: Image.network('https://upload.wikimedia.org/wikipedia/en/b/bd/Batangas_State_Logo.png')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink[900],
        child: Icon(
          Icons.add,
          color: Colors.grey[850],
        ),
      ),
    ),
  ));

}
