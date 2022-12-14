
import '../../../../core/_core_exports.dart';
import '../../../../core/entities/get_product_model.dart';

class ProductSellerPerson extends StatelessWidget {

 final ProductFeatures productFeatures;

  const ProductSellerPerson({
    Key? key,required this.productFeatures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 48,
          width: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl:
                  'https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              productFeatures.userUsername.toString(),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: const [
                Text('Kadıköy , İstanbul'),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Haritada Göster',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: const [
                Icon(Icons.location_on),
                Text('${1.0} km')
              ],
            )
          ],
        )
      ],
    );
  }
}