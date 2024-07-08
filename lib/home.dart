import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text('App Shots'),
        backgroundColor : Colors.pink[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: <Widget> [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/user profile.jpg'),
                    radius: 50.0,
                  ),
                ),
                Divider(
                  height: 50.0,
                  thickness: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_2,
                      color:  Colors.white70,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Maria Luz J. Calingasan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.school,
                      color:  Colors.white70,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'Year',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$year Year',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color:  Colors.white70,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'calingasanmarialuz27@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      year+= 1;
                    });
                  },
                  child: Text('ADD YEAR'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}