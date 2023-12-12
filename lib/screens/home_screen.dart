import 'package:bill_receipt/screens/bill_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/receipt.png',
                  width: 150.w,
                  height: 200.h,
                ),
                TextFormField(
                  controller: textController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Customer Name please,';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Customer Name',
                  ),
                ),
                SizedBox(height: 50.h),
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillScreen(customerName: textController.text),
                          ));
                    }
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
      ),
    );
  }
}
