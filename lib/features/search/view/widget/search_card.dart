import '../../../../core/_core_exports.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Column(
                  children: const [
                    Text('Kiralama ücretleri'),
                    Text('5.00\$ /saatlik'),
                  ],
                ),
                const SizedBox.shrink(),
              ],
            ),
            const Text(
              'Dağ Bisikleti',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Icon(Icons.location_on),
                SizedBox(
                  width: 4,
                ),
                Text('1 km')
              ],
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