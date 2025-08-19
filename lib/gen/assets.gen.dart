/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// Directory path: assets/fonts/inter
  $AssetsFontsInterGen get inter => const $AssetsFontsInterGen();

  /// Directory path: assets/fonts/poppins
  $AssetsFontsPoppinsGen get poppins => const $AssetsFontsPoppinsGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/photos
  $AssetsImagesPhotosGen get photos => const $AssetsImagesPhotosGen();
}

class $AssetsFontsInterGen {
  const $AssetsFontsInterGen();

  /// File path: assets/fonts/inter/Inter-Medium.ttf
  String get interMedium => 'assets/fonts/inter/Inter-Medium.ttf';

  /// List of all assets
  List<String> get values => [interMedium];
}

class $AssetsFontsPoppinsGen {
  const $AssetsFontsPoppinsGen();

  /// File path: assets/fonts/poppins/Poppins-Bold.ttf
  String get poppinsBold => 'assets/fonts/poppins/Poppins-Bold.ttf';

  /// File path: assets/fonts/poppins/Poppins-ExtraBold.ttf
  String get poppinsExtraBold => 'assets/fonts/poppins/Poppins-ExtraBold.ttf';

  /// File path: assets/fonts/poppins/Poppins-ExtraLight.ttf
  String get poppinsExtraLight => 'assets/fonts/poppins/Poppins-ExtraLight.ttf';

  /// File path: assets/fonts/poppins/Poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/poppins/Poppins-Light.ttf';

  /// File path: assets/fonts/poppins/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/poppins/Poppins-Medium.ttf';

  /// File path: assets/fonts/poppins/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/poppins/Poppins-Regular.ttf';

  /// File path: assets/fonts/poppins/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/poppins/Poppins-SemiBold.ttf';

  /// File path: assets/fonts/poppins/Poppins-Thin.ttf
  String get poppinsThin => 'assets/fonts/poppins/Poppins-Thin.ttf';

  /// List of all assets
  List<String> get values => [
    poppinsBold,
    poppinsExtraBold,
    poppinsExtraLight,
    poppinsLight,
    poppinsMedium,
    poppinsRegular,
    poppinsSemiBold,
    poppinsThin,
  ];
}

class $AssetsImagesPhotosGen {
  const $AssetsImagesPhotosGen();

  /// File path: assets/images/photos/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/photos/background.png');

  /// File path: assets/images/photos/logo.png
  AssetGenImage get logo =>
      const AssetGenImage('assets/images/photos/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [background, logo];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
