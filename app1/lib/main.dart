
// import 'package:app1/screen/image.dart';

import 'package:app1/screen/toast.dart';
import 'package:flutter/material.dart';


// void main() {
//   runApp(
//      const MaterialApp(
//       home: ImageSceeen2(),
//       // '/': (context) => const ImageScreen()
//     ),
//   );
// }

// class Dashboard extends StatelessWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[50],
//       body: SafeArea(
//         child: Container(
//           width: 500,
//           height: 400,
//           alignment: Alignment.bottomCenter,
//           child: const Text(" I am a container"),
//           decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: Colors.amberAccent,
//               border: Border.all(color: Colors.black, width: 2),),
//         ),
//       ),
//     );
//   }
// }



void main(List<String> args) {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,

    initialRoute: '/',

    routes: {

      '/': (context) => const ToastScreen(),

      // '/': (context) => const ExpandedFlex(),

      // '/': (context) => const GridViewScreen(),

     // '/': (context) => const ImageScreen(),

    },

  ));

}
