import 'package:image_picker/image_picker.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/features/home/domain/data/product_model.dart';

import '../../../core/constants/product_list.dart';

class ProductController extends ChangeNotifier {
  List<XFile>? imageFileList = [];

  List<ProductModel> favoriteList = [];

  Future<void> getPhotoFromGallery(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();

    final List<XFile> selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      if (selectedImages.length <= 5 && selectedImages.length >= 2) {
        imageFileList!.addAll(selectedImages);

        notifyListeners();
      } else {
        customSnackBar(
            text: 'Lütfen minimum 2 maksimum 5 görsel yükleyiniz',
            context: context,
            color: Colors.red);
      }
    }
  }

  void removePhoto(int index) {
    imageFileList!.removeAt(index);

    notifyListeners();
  }

  void addFavorite(int index) {
    favoriteList.add(ProductList().productList[index]);

    notifyListeners();
  }

  void removeFavorite(int index) {
    favoriteList.removeAt(index);

    notifyListeners();
  }
}
