import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        foregroundColor: Colors.black,
        title: Text(
          'Dashboard'
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/menu');
                },
                child: Text('Go to menu'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Go to profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
