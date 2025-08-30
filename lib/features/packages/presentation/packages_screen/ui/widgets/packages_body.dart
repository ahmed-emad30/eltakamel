import 'package:flutter/material.dart';

import '../../../../domain/entity/package_entity.dart';
import 'package_card.dart';

class PackagesBody extends StatelessWidget {
  final List<PackageEntity> packages;

  const PackagesBody({super.key, required this.packages});

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
              "Available Packages",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey.shade800,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: packages.length,
              itemBuilder: (context, index) {
                return PackageCard(package: packages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
