class AssetsPath {
  static final AssetsPath _instance = AssetsPath._init();
  AssetsPath._init();

  factory AssetsPath() {
    return _instance;
  }

  // !BOTTOM NAV BAR
  final String homeSVG = 'assets/svg/bottom_nav_bar/home.svg';
  final String searchSVG = 'assets/svg/bottom_nav_bar/search.svg';
  final String cameraSVG = 'assets/svg/bottom_nav_bar/camera.svg';
  final String messageSVG = 'assets/svg/bottom_nav_bar/message.svg';
  final String profileSVG = 'assets/svg/bottom_nav_bar/profile.svg';
      final String addSVG = 'assets/svg/bottom_nav_bar/add.svg';

  // !SVG
  final String logoSVG = 'assets/svg/logo.svg';
  final String logoSplashSVG = 'assets/svg/logo_splash.svg';
  final String approvedSVG = 'assets/svg/approved.svg';
  final String forgotPasswordSVG = 'assets/svg/forgot_password.svg';
  final String addProductSVG = 'assets/svg/add_Product.svg';
  final String emptyFavoriteSVG = 'assets/svg/empty_favorite.svg';
  final String searchEmptySVG = 'assets/svg/search_emty.svg';
  final String searchNotFoundSVG = 'assets/svg/search_not_found.svg';
}
