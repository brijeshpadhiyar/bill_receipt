import 'package:bill_receipt/controller/bill_screen_controller.dart';
import 'package:bill_receipt/screens/setting_screen.dart';
import 'package:bill_receipt/widget/custome_card.dart';
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
        return Obx(() => Scaffold(
              appBar: AppBar(
                title: Text(
                  widget.customerName.toUpperCase(),
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => const SettingScreen());
                      },
                      icon: const Icon(Icons.settings))
                ],
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
                          Text(controller.subTotal.value)
                        ],
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          return CustomeWidget(
                              index: index + 1,
                              onTap: () => controller.removeItem(index),
                              itemName: controller.items[index]['itemName'],
                              itemPrice: controller.items[index]['itemPrice'],
                              itemQuantity: controller.items[index]['itemQuantity'],
                              total: controller.items[index]['total'],
                              gst: controller.items[index]['gst'],
                              discount: controller.items[index]['discount'],
                              finalTotalPrice: controller.items[index]['finalTotal']);
                        },
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  controller.itemNameController.clear();
                  controller.itemPriceController.clear();
                  controller.itemQuantityController.clear();

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
                                            controller: controller.itemNameController,
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
                                            controller: controller.itemPriceController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              controller.itemPrice.value = value;
                                            },
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
                                            controller: controller.itemQuantityController,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              controller.itemQuantity.value = value;
                                            },
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
                                                controller.performingFunctions();
                                                Get.back();
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
            ));
      },
    );
  }
}
