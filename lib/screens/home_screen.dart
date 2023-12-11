import 'package:bill_receipt/screens/bill_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Welcome,',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/receipt.png',
                width: 150.w,
                height: 200.h,
              ),
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Enter Customer Name',
                ),
              ),
              SizedBox(height: 50.h),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BillScreen(customerName: textController.text),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(200.w, 50.h),
                  minimumSize: Size(200.w, 50.h),
                ),
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
