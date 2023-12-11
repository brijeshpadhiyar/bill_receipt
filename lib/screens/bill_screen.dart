import 'package:bill_receipt/controller/bill_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BillScreen extends StatefulWidget {
  final String customerName;
  const BillScreen({super.key, required this.customerName});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillScreenController>(
      init: BillScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.customerName.toUpperCase(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60.w,
                        child: Text(
                          widget.customerName.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "With Discount Rs : ",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 1,
                    children: [
                      for (var item = 0; item < 10; item++)
                        Card(
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Name : -',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                      ),
                                      Text(controller.itemName.value.text),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Prize : -',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                      ),
                                      Text(controller.itemPrice.value.text),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quantity : -',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                      ),
                                      Text(controller.itemQuantity.value.text),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       'Total : -',
                                  //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                  //     ),
                                  //     Text('${controller.total.value}'),
                                  //   ],
                                  // ),
                                  const Divider(),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       'Gst : -',
                                  //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                  //     ),
                                  //     Text('+  ${(controller.gst.value).toPrecision(2)}'),
                                  //   ],
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       'Discount : -',
                                  //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                  //     ),
                                  //     Text('-  ${(controller.discount.value).toPrecision(2)}'),
                                  //   ],
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       'Total Price : -',
                                  //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                  //     ),
                                  //     Text('${(controller.totalPriceAfterDiscount.value).toPrecision(2)}'),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Form(
                    key: formKey,
                    child: Dialog(
                      child: SizedBox(
                        width: 300.w,
                        height: 300.h,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Text(
                                  'Fill Item Detail',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: controller.itemName.value,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter Item Name';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter Item Name",
                                        ),
                                      ),
                                      TextFormField(
                                        controller: controller.itemPrice.value,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter Item Price';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter Item Price",
                                        ),
                                      ),
                                      TextFormField(
                                        controller: controller.itemQuantity.value,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter Item Quentity';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter Item Quantity",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Cancel')),
                                    TextButton(
                                        onPressed: () {
                                          if (formKey.currentState!.validate()) {
                                            // controller.billing();
                                          }
                                        },
                                        child: const Text('ADD')),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            tooltip: 'Add Items',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
