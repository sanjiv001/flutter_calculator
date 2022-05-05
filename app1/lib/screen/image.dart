import 'package:flutter/material.dart';
class ImageScreen extends StatefulWidget {
  const ImageScreen({ Key? key }) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SafeArea(
            child: SizedBox(
          child: Image.asset('assets/images/profile.jpg'),
        )),
      ),
    );
  }
}
