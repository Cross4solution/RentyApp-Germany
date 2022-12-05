import '../../../../core/_core_exports.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 125,
                    width: 185,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://blog.kutupayisi.com/wp-content/uploads/2021/09/bisiklete-baslayanlar-icin-5-oneri.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: const Text(
                            'Y K',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const SizedBox(
                          width: 90,
                          child: Text(
                            'Yasin Karacan',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text('İstanbul / Kadıköy'),
                    Row(
                    
                      children: const [
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 4,
                        ),
                        Text('1 km'),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Kiralama ücretleri'),
                    const Text('\$5.00 /saatlik', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Dağ Bisikleti',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
                'Ürün açıklamalarının bulunduğu kısım.Ürün açıklamalarının bulunduğu kısım.Ürün açıklamalarının bulunduğu kısım.Ürün açıklamalarının bulunduğu kısım.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
