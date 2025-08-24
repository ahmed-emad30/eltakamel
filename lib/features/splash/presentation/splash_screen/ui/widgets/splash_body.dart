import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../gen/assets.gen.dart' show Assets;

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  double opacity = 0.0;
  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () {
        if (mounted) {
          setState(() {
            opacity += 0.1;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logoImage = Assets.images.photos.logo.provider();

    return Center(
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 500),
        child: Image(image: logoImage, fit: BoxFit.cover, width: 0.35.sw),
      ),
    );
  }
}
