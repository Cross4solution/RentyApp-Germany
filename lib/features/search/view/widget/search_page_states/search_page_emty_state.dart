

import '../../../../../core/_core_exports.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SizedBox(
      height: ScreenSize().getHeightPercent(.65),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsPath().searchEmptySVG,
            height: 150,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Aradığınız ürünü giriniz.',
            style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}