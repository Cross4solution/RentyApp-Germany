import '../../../../core/_core_exports.dart';

class DropdownCategory extends StatefulWidget {
  DropdownCategory({Key? key}) : super(key: key);

  @override
  State<DropdownCategory> createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  // Initial Selected Value
  String dropdownvalue = 'Oyun Konsolu';

  // List of items in our dropdown menu
  var items = [
    'Oyun Konsolu',
    'Kitap',
    'Kıyafet',
    'Ayakkabı',
    'Oyuncak',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
