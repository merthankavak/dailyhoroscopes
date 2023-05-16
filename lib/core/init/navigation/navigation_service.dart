import 'package:go_router/go_router.dart';

import '../../../features/auth/onboard/view/onboard_view.dart';
import '../../../features/auth/onboard/view/subview/onboard_subview.dart';
import '../../../features/auth/splash/view/splash_view.dart';
import '../../../features/home/view/home_view.dart';
import '../../../features/home/view/subview/home_explore_view.dart';
import '../../constants/enums/navigation_enums.dart';

class NavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._init();
    return _instance!;
  }

  NavigationService._init();

  final router = GoRouter(routes: [
    GoRoute(
        path: NavigationEnums.splashView.routeName,
        builder: (context, state) => const SplashView()),
    GoRoute(
        path: NavigationEnums.onBoardView.routeName,
        builder: (context, state) => const OnBoardView()),
    GoRoute(
        path: NavigationEnums.onBoardSubView.routeName,
        builder: (context, state) => const OnBoardSubView()),
    GoRoute(
        path: NavigationEnums.homeView.routeName, builder: (context, state) => const HomeView()),
    GoRoute(
        name: NavigationEnums.homeExploreView.routeName,
        path:
            '${NavigationEnums.homeExploreView.routeName}/:horoscopeSign/:horoscopeSignForNetwork',
        builder: (context, state) => HomeExploreView(
              horoscopeSign: state.pathParameters['horoscopeSign']!,
              horoscopeSignForNetwork: state.pathParameters['horoscopeSignForNetwork']!,
            ))
  ]);
}
