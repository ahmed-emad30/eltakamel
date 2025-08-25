import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart';
import '../../../domain/entity/package_entity.dart';

class PurchaseScreen extends StatefulWidget {
  final PackageEntity package;

  const PurchaseScreen({super.key, required this.package});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  bool useBalance = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).appBarTheme
                .copyWith(backgroundColor: Colors.lightBlueAccent)
                .backgroundColor,
        title: Text(
          'User Portal',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        actionsPadding: REdgeInsetsDirectional.only(end: 8),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _rowLabelValue(
                      'Active Service',
                      widget.package.title,
                      valueStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _rowLabelValue(
                      'Service Description',
                      widget.package.description.isEmpty
                          ? 'N/A'
                          : widget.package.description,
                    ),
                    const SizedBox(height: 16),
                    _rowLabelValue('Subscription', 'Expired'),
                    const SizedBox(height: 16),
                    _rowLabelValue('Expiration', '2025-08-19\n10:40:34'),
                    const SizedBox(height: 16),
                    _rowLabelValue(
                      'Service Price',
                      widget.package.price,
                      valueStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _rowLabelValue('Balance', 'LD0.00'),
                    const SizedBox(height: 16),
                                         Container(
                       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                       decoration: BoxDecoration(
                         color: Colors.grey.shade100,
                         borderRadius: BorderRadius.circular(6),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const Text(
                             'Use Available\nBalance',
                             style: TextStyle(
                               color: Colors.black54,
                               fontSize: 16,
                             ),
                           ),
                           Switch(
                             // activeThumbColor: Colors.white,
                             activeTrackColor: Colors.blue,
                             inactiveTrackColor: Colors.grey,
                             inactiveThumbColor: Colors.white,
                             value: useBalance,
                             onChanged: (val) {
                               setState(() {
                                 useBalance = val;
                               });
                             },
                           ),
                         ],
                       ),
                     ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose Payment Methods',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 1, color: Colors.grey),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'No payment methods available',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowLabelValue(String label, String value, {TextStyle? valueStyle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: const TextStyle(color: Colors.black54, fontSize: 16),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: valueStyle ?? const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
