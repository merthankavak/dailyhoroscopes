extension ImageExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
  String get toPNG => 'asset/image/$this.png';
  String get appIcon => 'app_icon'.toPNG;
}
