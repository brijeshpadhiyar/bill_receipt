import 'package:bill_receipt/screens/app_setting_change_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const AppValueChangeScreen());
              },
              child: const Text('GST / Discount'),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Rate Us'),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Share App'),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {},
              child: const Text('About Us'),
            ),
          ],
        ),
      ),
    );
  }
}
