import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GradeController extends GetxController {
  var isSearching = false.obs;
  var spendingData = [
    {'month': 'Jan', 'amount': 250},
    {'month': 'Feb', 'amount': 300},
    {'month': 'Mar', 'amount': 280},
    // Add more data as needed
  ].obs;

  // TooltipBehavior for the chart
  late TooltipBehavior _tooltipBehavior;

  // Observable count for increment action
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize TooltipBehavior
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Function to toggle search mode
  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }

  // Increment the count
  void increment() => count.value++;

  // Getter to access TooltipBehavior outside this class
  TooltipBehavior get tooltipBehavior => _tooltipBehavior;
}
