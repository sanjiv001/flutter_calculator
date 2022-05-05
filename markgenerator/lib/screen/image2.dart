import 'package:flutter/material.dart';

class ImageSceeen2 extends StatefulWidget {
  const ImageSceeen2({Key? key}) : super(key: key);

  @override
  State<ImageSceeen2> createState() => _ImageSceeen2State();
}

class _ImageSceeen2State extends State<ImageSceeen2> {
  get height => null;

  get width => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              width: 800,
              child: Image.asset('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: height,
              width: width,
              child: Image.network(
                'https://images.unsplash.com/photo-1651471980267-a5de7c666dae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
