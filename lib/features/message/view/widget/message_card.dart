import '../../../../core/_core_exports.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: ScreenSize().getWidthPercent(1) - 32,
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1, color: Colors.grey.shade300)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                  color: Colors.red, shape: BoxShape.circle),
              child: const Text(
                'Y K',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yasin Karacan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: ScreenSize().getWidthPercent(.6),
                  child: const Text(
                    'Durumu çok iyidir, sorunsuz çalışıyor...',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'Telefon',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                Text(
                  'Günlük kiralama',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
            Text(
              '5 dk önce',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
            )
          ],
        ),
      ),
    );
  }
}