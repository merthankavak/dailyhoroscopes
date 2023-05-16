extension ImageExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
  String get toPNG => 'assets/image/$this.png';
  String get appIcon => 'app_icon'.toPNG;
}
