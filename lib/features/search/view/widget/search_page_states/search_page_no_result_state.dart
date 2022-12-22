import '../../../../../core/_core_exports.dart';

class SearchEmptyNoResult extends StatelessWidget {
  const SearchEmptyNoResult({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SizedBox(
      height: ScreenSize().getHeightPercent(.65),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsPath().searchNotFoundSVG,
            height: 150,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Aradığınız ürün bulunamadı.',
            style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
