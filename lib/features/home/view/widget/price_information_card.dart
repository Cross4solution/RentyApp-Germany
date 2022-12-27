import '../../../../core/_core_exports.dart';
import '../../../../core/entities/get_product_model.dart';

class PriceInformationCard extends StatelessWidget {
  final ProductFeatures productFeatures;
  const PriceInformationCard({
    Key? key,
    required this.productFeatures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Colors.grey.shade100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 45,
            width: ScreenSize().getWidthPercent(1) / 3.5,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Colors.grey.shade400))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '\$' '${productFeatures.rentalPrice}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'daily',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.center,
            height: 45,
            width: ScreenSize().getWidthPercent(1) / 3.5,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Colors.grey.shade400))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '\$' '${productFeatures.rentalPrice! * 7}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'weekly',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.center,
            height: 45,
            width: ScreenSize().getWidthPercent(1) / 3.5,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '\$' '${productFeatures.rentalPrice! * 30}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'monthly',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
