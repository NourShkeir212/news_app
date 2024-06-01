import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          centerTitle: true,
          title: const Text(
            'Project',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent
            ),
          ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/lectures_images/1.jpg'),
                ),
                const SizedBox(height: 10,),
                const Text('Bernardo Silva',style: TextStyle(
                    fontSize: 25,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 80
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2
                      )
                  ),
                  child: const Text('Bernardo'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2
                      )
                  ),
                  child: const Text('Haaland@gmail.com'),
                ),
              ],
            )
        ),
      ),
    );
  }
}