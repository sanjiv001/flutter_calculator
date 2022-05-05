import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastScreen extends StatefulWidget {
  const ToastScreen({Key? key}) : super(key: key);

  @override
  State<ToastScreen> createState() => _ToastScreenState();
}

class _ToastScreenState extends State<ToastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text("HY"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Hi I am snackbar message"),
                duration: Duration(seconds: 05),
                action: SnackBarAction(
                  label: 'ok',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
                backgroundColor: Colors.blue,
              ),
            );

            // Fluttertoast.showToast(msg: "Hello Done");
          },
        ),
      ),
    );
  }
}
