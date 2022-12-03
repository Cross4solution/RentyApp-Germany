import '../../../../core/_core_exports.dart';
import '../../../home/view/page/home_page.dart';

class RentedHistoryCard extends StatelessWidget {
  const RentedHistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 175,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: image.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              height: 150,
              width: 235,
              decoration: BoxDecoration(
                color: ColorHelper.whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 125,
                    width: 235,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: CachedNetworkImage(imageUrl: image[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      children: const [
                        Text(
                          'data',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.location_on),
                        Text('${1.0} km')
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '\$5.0 /saatlik',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '\$35.0 /günlük',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '\$100.0 /haftalık',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}