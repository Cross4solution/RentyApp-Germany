import '../../../../core/_core_exports.dart';

class SelectPriceCard extends StatefulWidget {
  SelectPriceCard({
    super.key,
  });

  @override
  State<SelectPriceCard> createState() => _SelectPriceCardState();
}

class _SelectPriceCardState extends State<SelectPriceCard> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: !isActive ? Colors.grey : Colors.white),
            color: !isActive ? Colors.white : Colors.green),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children:  [
              Text(
                '\$5.00',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: isActive ? Colors.white : Colors.black  ),
              ),
              Text(
                'günlük',
                style: TextStyle(
                  fontSize: 16,color: isActive ? Colors.white : Colors.black  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
