import '../_core_exports.dart';

class Interests implements BaseModelRepo<Interests> {
  String title;
  bool isSelected;

  Interests({
    this.title = "",
    this.isSelected = false,
  });

  Interests.emptyModel({
    required this.title,
    this.isSelected = false,
  }) {
    title = title;
    isSelected = isSelected;
  }

  @override
  Interests fromMap(Map<String, dynamic> map) {
    return Interests(
      title: map['name'],
      isSelected: map['isSelected'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': title,
    };
  }

  void isSelect() {
    isSelected = !isSelected;
  }

  static List<Interests> filteringListBySearchText({required List<Interests> allItems, required String searchText}) {
    List<Interests> filteredItems = [];
    if (searchText.isEmpty) {
      filteredItems = List.from(allItems);
    } else {
      filteredItems = allItems.where(
        (item) {
          return item.title.toLowerCase().contains(searchText.toLowerCase());
        },
      ).toList();
    }
    return filteredItems;
  }
}
