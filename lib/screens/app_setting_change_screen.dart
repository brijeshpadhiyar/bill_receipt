import 'package:bill_receipt/controller/bill_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppValueChangeScreen extends StatelessWidget {
  const AppValueChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillScreenController>(
        init: BillScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Discount / Gst Change'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GST",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: controller.gstController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.black26,
                      hintText: 'GST Change',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "DISCOUNT",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    controller: controller.discountController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.black26,
                      hintText: 'Discount change',
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.gst.value = controller.gstController.text;
                            controller.discount.value = controller.discountController.text;
                            Get.back();
                          },
                          child: const Text('Change Values'))),
                ],
              ),
            ),
          );
        });
  }
}
