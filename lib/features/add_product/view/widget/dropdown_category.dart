import '../../../../core/_core_exports.dart';
import '../../../home/controller/home_controller.dart';
import '../../controller/product_controller.dart';

class DropdownCategory extends StatefulWidget {
  DropdownCategory({Key? key}) : super(key: key);

  @override
  State<DropdownCategory> createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  // Initial Selected Value

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton(
            value: sl<ProductController>().dropDownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: sl<ProductController>().dropdownItems.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                sl<ProductController>().dropDownValue = newValue!;
               
              });
            },
          ),
        ],
      ),
    );
  }
}
