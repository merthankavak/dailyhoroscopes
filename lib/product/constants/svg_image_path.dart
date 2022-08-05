import '../../core/extension/image_extension.dart';

class SvgImagePaths {
  static SvgImagePaths? _instance;
  static SvgImagePaths get instance {
    _instance ??= SvgImagePaths._init();
    return _instance!;
  }

  SvgImagePaths._init();

  final onboard1 = 'onboard_1'.toSVG;
  final onboard2 = 'onboard_2'.toSVG;
  final onboard3 = 'onboard_3'.toSVG;
}
