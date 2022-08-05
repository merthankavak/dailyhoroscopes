import '../constants/enums/navigation_enums.dart';

extension NavigationExtension on NavigationEnums {
  String get rawValue {
    switch (this) {
      case NavigationEnums.splashView:
        return '/';
      case NavigationEnums.onBoardView:
        return '/onBoardView';
      case NavigationEnums.onBoardSubView:
        return '/onBoardSubView';
      case NavigationEnums.homeView:
        return '/homeView';
      case NavigationEnums.homeExploreView:
        return '/homeExploreView';
      default:
        return '/';
    }
  }
}
