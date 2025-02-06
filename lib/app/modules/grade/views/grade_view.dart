import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';
import 'package:future_focus/app/modules/grade/controllers/grade_controller.dart';

class GradeView extends GetView<GradeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade View"),
        actions: [
          IconButton(
            icon:
                Icon(controller.isSearching.value ? Icons.close : Icons.search),
            onPressed: controller.toggleSearch,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar toggle with animation
          Obx(() {
            return AnimatedSize(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: controller.isSearching.value
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Search...'),
                      ),
                    )
                  : SizedBox.shrink(),
            );
          }),

          // Total Spending and Month Comparison
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Total spending calculation
                Text("Total Spending: \$${_getTotalSpending()}"),
                SizedBox(height: 20),
                Text("Month Comparison"),
              ],
            ),
          ),

          // Spending Chart (Syncfusion)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelRotation: 45, // Rotating the x-axis labels for better visibility
                title: AxisTitle(text: 'Months'), // X-axis title
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Amount (\$)'), // Y-axis title
                labelFormat: '{value}\$', // Format labels with a dollar sign
              ),
              title: ChartTitle(
                text: 'Monthly Spending Comparison',
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              tooltipBehavior: controller.tooltipBehavior, // Tooltip behavior
              series: <CartesianSeries>[
                BarSeries<Map<String, dynamic>, String>(
                  dataSource: controller.spendingData,
                  xValueMapper: (data, _) => data['month'] as String,
                  yValueMapper: (data, _) =>
                      (data['amount'] as num).toDouble(),
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(8), // Rounded corners for bars
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.top, // Display labels above bars
                    textStyle: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  onPointTap: (ChartPointDetails details) {
                    // Handle point tap (show more details if needed)
                    print('Tapped on: ${details.pointIndex}');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to calculate total spending
  int _getTotalSpending() {
    return controller.spendingData
        .fold(0, (sum, item) => sum + (item['amount'] as num).toInt());
  }
}
