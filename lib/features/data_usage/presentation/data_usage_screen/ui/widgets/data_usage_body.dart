import 'dart:async';
import 'package:eltakamel/features/billing/presentation/billing_screen/ui/widgets/table_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'custom_tooltip_widget.dart';
import 'diamond_dot_painter.dart';

class DataUsageBody extends StatefulWidget {
  const DataUsageBody({super.key});

  @override
  State<DataUsageBody> createState() => _DataUsageBodyState();
}

class _DataUsageBodyState extends State<DataUsageBody>
    with SingleTickerProviderStateMixin {
  String selectedPeriod = "Daily";
  String selectedMonth = "Aug";
  String selectedYear = "2025";

  List<FlSpot> dataPoints = [];
  bool isAnimating = false;
  Timer? timer;

  //* -  the tooltip variables
  bool showCustomTooltip = false;
  Offset tooltipPosition = Offset.zero;
  FlSpot? selectedSpot;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _startAnimation();
  }

  void _initializeData() {
    int pointsCount = selectedPeriod == "Monthly" ? 12 : 31;
    dataPoints = List.generate(
      pointsCount,
      (i) => FlSpot((i + 1).toDouble(), 2.5),
    );
  }

  void _startAnimation() {
    if (isAnimating) return;

    setState(() {
      isAnimating = true;
    });

    int maxPoints = selectedPeriod == "Monthly" ? 12 : 31;
    timer = Timer.periodic(const Duration(milliseconds: 200), (t) {
      if (t.tick >= maxPoints) {
        timer?.cancel();
        setState(() {
          isAnimating = false;
        });
        return;
      }
      setState(() {});
    });
  }

  void _onRefresh() {
    timer?.cancel();
    setState(() {
      isAnimating = false;
    });
    _startAnimation();
  }

  void _onPeriodChanged(String newPeriod) {
    timer?.cancel();
    setState(() {
      selectedPeriod = newPeriod;
      isAnimating = false;
      showCustomTooltip = false;
      selectedSpot = null;
    });
    _initializeData();
    _startAnimation();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F8FB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Data Usage",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey.shade800,
              ),
            ),
          ),

          // Chart card
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  //**   Dropdown row  ** /
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        _buildDropdown(selectedPeriod, [
                          "Daily",
                          "Monthly",
                        ], (val) => _onPeriodChanged(val)),
                        const SizedBox(width: 8),
                        // show monthly dropdwn only when dily is on selected
                        if (selectedPeriod == "Daily") ...[
                          _buildDropdown(
                            selectedMonth,
                            [
                              "Jan",
                              "Feb",
                              "Mar",
                              "Apr",
                              "May",
                              "Jun",
                              "Jul",
                              "Aug",
                              "Sep",
                              "Oct",
                              "Nov",
                              "Dec",
                            ],
                            (val) => setState(() => selectedMonth = val),
                          ),
                          const SizedBox(width: 8),
                        ],
                        _buildDropdown(selectedYear, [
                          "2023",
                          "2024",
                          "2025",
                        ], (val) => setState(() => selectedYear = val)),
                        const Spacer(),
                        IconButton(
                          onPressed: _onRefresh,
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    "Traffic Report",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                  // -- Chart dard
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Stack(
                        children: [
                          LineChart(
                            LineChartData(
                              minY: 0,
                              maxY: 5,
                              minX: 1,
                              maxX: selectedPeriod == "Monthly" ? 12 : 30,
                              gridData: const FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  axisNameWidget: const Text("Bytes"),
                                  axisNameSize: 30,
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                    getTitlesWidget: (value, meta) {
                                      if (value == 0) {
                                        return const Text(
                                          "0",
                                          style: TextStyle(fontSize: 12),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    interval: 2,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        value.toInt().toString(),
                                        style: const TextStyle(fontSize: 10),
                                      );
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              lineTouchData: LineTouchData(
                                enabled: true,
                                handleBuiltInTouches: false,
                                touchCallback: (
                                  FlTouchEvent event,
                                  LineTouchResponse? touchResponse,
                                ) {
                                  if (touchResponse != null &&
                                      touchResponse.lineBarSpots != null &&
                                      touchResponse.lineBarSpots!.isNotEmpty) {
                                    final spot =
                                        touchResponse.lineBarSpots!.first;
                                    setState(() {
                                      showCustomTooltip = true;
                                      selectedSpot = FlSpot(spot.x, spot.y);
                                      // Calculate tooltip position (approximate)
                                      double maxX =
                                          selectedPeriod == "Monthly" ? 12 : 30;
                                      tooltipPosition = Offset(
                                        (spot.x / maxX) * 300 +
                                            50, // Approximate chart width
                                        60, // Position higher above the diamond
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      showCustomTooltip = false;
                                      selectedSpot = null;
                                    });
                                  }
                                },
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: dataPoints,
                                  isCurved: false,
                                  color: Colors.transparent,
                                  dotData: FlDotData(
                                    show: true,
                                    getDotPainter: (
                                      spot,
                                      percent,
                                      barData,
                                      index,
                                    ) {
                                      // Show animated diamonds or static diamonds
                                      if (isAnimating) {
                                        int currentAnimatedIndex =
                                            (timer?.tick ?? 0) + 1;
                                        if (spot.x.toInt() <=
                                            currentAnimatedIndex) {
                                          return DiamondDotPainter(
                                            size: 12,
                                            color: Colors.black,
                                            strokeWidth: 1,
                                            strokeColor: Colors.grey.shade700,
                                          );
                                        } else {
                                          return DiamondDotPainter(
                                            size: 12,
                                            color: Colors.transparent,
                                            strokeWidth: 1,
                                            strokeColor: Colors.transparent,
                                          );
                                        }
                                      } else {
                                        // Show all diamonds when not animating
                                        return DiamondDotPainter(
                                          size: 12,
                                          color: Colors.black,
                                          strokeWidth: 1,
                                          strokeColor: Colors.grey.shade700,
                                        );
                                      }
                                    },
                                  ),
                                  belowBarData: BarAreaData(show: false),
                                ),
                              ],
                            ),
                          ),
                          // -- Custom Tooltip with Arrow
                          if (showCustomTooltip && selectedSpot != null)
                            Positioned(
                              left: tooltipPosition.dx - 40,
                              top: tooltipPosition.dy - 40,
                              child: CustomTooltipWidget(
                                day: selectedSpot!.x.toInt(),
                                total: selectedSpot!.y.toStringAsFixed(0),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Legend
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dotItem(Colors.blue, "Real Traffic"),
                        const SizedBox(width: 12),
                        _dotItem(Colors.black, "Total"),
                        const SizedBox(width: 12),
                        _dotItem(Colors.grey, "Download"),
                        const SizedBox(width: 12),
                        _dotItem(Colors.grey, "Upload"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          TableWidget(
            headers: const [
              'Day/Month',
              'Download',
              'Upload',
              'Total',
              'Real Traffic',
            ],
            data: _generateTableData(),
          ),
        ],
      ),
    );
  }

  List<List<String>> _generateTableData() {
    return List.generate(3, (index) {
      final day = index + 1;
      return [
        'Aug $day',
        '${(index * 0.3).toStringAsFixed(1)} MB',
        '${(index * 0.2).toStringAsFixed(1)} MB',
        '${(2.5).toStringAsFixed(1)} MB',
        '${(index * 0.5).toStringAsFixed(1)} MB',
      ];
    });
  }

  Widget _buildDropdown(
    String value,
    List<String> items,
    ValueChanged<String> onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: value,
        underline: const SizedBox(),
        items:
            items
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e, style: const TextStyle(fontSize: 14)),
                  ),
                )
                .toList(),
        onChanged: (val) => onChanged(val!),
      ),
    );
  }

  Widget _dotItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
