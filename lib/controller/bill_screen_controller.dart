import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillScreenController extends GetxController {
  final itemName = Rx(TextEditingController());
  final itemPrice = Rx(TextEditingController());
  final itemQuantity = Rx(TextEditingController());

  final gstPercentage = RxDouble(18);
  final discountPercentage = RxDouble(12);

  double calculateGST(double price, double quantity) {
    double totalPrice = price * quantity;
    double gstAmount = (totalPrice * gstPercentage.value) / 100;
    return gstAmount;
  }

  double calculateTotalPriceWithGST(double price, double quantity) {
    double totalPrice = price * quantity;
    double gstAmount = calculateGST(price, quantity);
    return totalPrice + gstAmount;
  }

  // Function to calculate discounted price
  double calculateDiscountedPrice(double price, double quantity) {
    double totalPriceWithGST = calculateTotalPriceWithGST(price, quantity);
    double discountAmount = (totalPriceWithGST * discountPercentage.value) / 100;
    return totalPriceWithGST - discountAmount;
  }
}
