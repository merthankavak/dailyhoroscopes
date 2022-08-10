enum NavigationEnums {
  splashView('/'),
  onBoardView('/onBoardView'),
  onBoardSubView('/onBoardSubView'),
  homeView('/homeView'),
  homeExploreView('/homeExploreView');

  final String routeName;
  const NavigationEnums(this.routeName);
}
