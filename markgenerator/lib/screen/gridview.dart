
import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("  Grid View "),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
      children: [
        Container(
          color: Colors.amber,
          child: const  Text("1",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Colors.green
          ),),
        ),
        Container(
          color: Colors.blue,
          child:  const Text("2",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        ),
         Container(
          color: Color.fromARGB(255, 200, 72, 12),
          child:  const Text("2",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 118, 6, 23),
          ),
        ),
        ),
         Container(
          color: Color.fromARGB(255, 212, 7, 62),
          child:  const Text("2",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        ),
         Container(
          color: Color.fromARGB(255, 44, 4, 101),
          child:  const Text("2",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 23, 8, 110),
          ),
        ),
        ),
         Container(
          color: Colors.blue,
          child:  const Text("6",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        ),
         Container(
          color: Colors.blue,
          child:  const Text("6",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 35, 7, 146),
          ),
        ),
        ),
         Container(
          color: Color.fromARGB(255, 241, 47, 47),
          child:  const Text("9",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        ),
         Container(
          color: Color.fromARGB(255, 153, 158, 161),
          child:  const Text("2",
          style: TextStyle(
            fontSize:  32,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        ),
      ],
      ),
    );
  }
}