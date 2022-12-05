import '../../../../core/_core_exports.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 84,
            width: 84,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 175,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Yasin Karacan',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                Row(
                  children: const [
                    Icon(Icons.location_on_sharp),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Kadıköy'),
                    Text(' / '),
                    Text('İstanbul'),
                  ],
                ),
                GestureDetector(
                  onTap: () {Go.to.page(PageRoutes.profileEditPage);},
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 175,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      'Profili Düzenle',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
