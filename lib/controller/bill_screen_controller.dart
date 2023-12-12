import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillScreenController extends GetxController {
  final itemNameController = TextEditingController();
  final itemPriceController = TextEditingController();
  final itemQuantityController = TextEditingController();
  final gstController = TextEditingController(text: '18');
  final discountController = TextEditingController(text: '12');

  final itemPrice = RxString('');
  final itemQuantity = RxString('');
  final totalPrice = RxString('');
  // final gstPercentage = RxString('18');
  // final discountPercentage = RxString('12');
  final gst = RxString('');
  final discount = RxString('');
  final finalTotalPrice = RxString('');
  final subTotal = RxString('');

  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

  String calculateTotalPrice(double price, double quantity) {
    double totalPrice = price * quantity;
    return totalPrice.toString();
  }

  String calculateGST(double price, double quantity) {
    double totalPrice = price * quantity;
    double gstAmount = (totalPrice * double.parse(gstController.text)) / 100;
    return gstAmount.toStringAsFixed(2);
  }

  String calculateDiscount(double price, double quantity) {
    double totalPrice = price * quantity;
    double disAmount = (totalPrice * double.parse(discountController.text)) / 100;
    return disAmount.toStringAsFixed(2);
  }

  String calculateFinalPrice() {
    var total = double.parse(totalPrice.value) + double.parse(gst.value) - double.parse(discount.value);
    return total.toStringAsFixed(2);
  }

  String calculateSubTotal() {
    double subtotal = 0;
    for (var item in items) {
      subtotal += double.parse(item['finalTotal']);
    }
    return subtotal.toStringAsFixed(2);
  }

  void performingFunctions() {
    totalPrice.value = calculateTotalPrice(double.parse(itemPrice.value), double.parse(itemQuantity.value));
    gst.value = calculateGST(double.parse(itemPrice.value), double.parse(itemQuantity.value));
    discount.value = calculateDiscount(double.parse(itemPrice.value), double.parse(itemQuantity.value));
    finalTotalPrice.value = calculateFinalPrice();
    Map<String, dynamic> map = {
      "itemName": itemNameController.text,
      'itemPrice': itemPrice.value,
      'itemQuantity': itemQuantity.value,
      'total': totalPrice.value,
      'gst': gst.value,
      'discount': discount.value,
      'finalTotal': finalTotalPrice.value,
    };
    items.add(map);
    subTotal.value = calculateSubTotal();
  }

  void removeItem(int index) {
    items.removeAt(index);
    subTotal.value = calculateSubTotal();
  }
}
