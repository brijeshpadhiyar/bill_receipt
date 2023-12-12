import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeWidget extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final String itemName;
  final String itemPrice;
  final String itemQuantity;
  final String total;
  final String gst;
  final String discount;
  final String finalTotalPrice;
  const CustomeWidget(
      {super.key,
      required this.index,
      required this.onTap,
      required this.itemName,
      required this.itemPrice,
      required this.itemQuantity,
      required this.total,
      required this.gst,
      required this.discount,
      required this.finalTotalPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Item $index',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  IconButton(onPressed: onTap, icon: const Icon(Icons.delete))
                ],
              ),
              const Divider(),
              SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name : -',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(itemName),
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Prize : -',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(itemPrice),
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity : -',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(itemQuantity),
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total : -',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(total),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gst : -',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text('+  $gst'),
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount : -',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text('-  $discount'),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price : -',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(' $finalTotalPrice'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
