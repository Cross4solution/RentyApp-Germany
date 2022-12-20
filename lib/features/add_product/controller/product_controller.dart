
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';
import 'package:rent_app_germany/features/add_product/repo/product_repo.dart';
import 'package:rent_app_germany/features/home/domain/data/product_model.dart';

import '../../../core/constants/product_list.dart';

class ProductController extends ChangeNotifier {
  final ProductRepository productRepository;

  ProductController({required this.productRepository});

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

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productFeaturesController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productRentalPriceController = TextEditingController();

  Future<void> addProduct() async {





    List<String> filename = [];

    

   

    for (int i = 0; i < imageFileList!.length -1; i++) {

      filename.add(imageFileList![i].path.split('/').last);
    }

     print(filename);
  

   FormData data = FormData.fromMap({
      "product_images":  await MultipartFile.fromFile(
        imageFileList![0].path,
        filename: filename[0],
      ),
    });

    print(data.files);

    // ProductFeatures productFeatures = ProductFeatures(
    //   productName: productNameController.text,
    //   productDescription: productDescriptionController.text,
    //   price: 2,
    //   rentalPrice: 3,
    //   categoryId: '2', // bottom sheet alanındaki kategoriyi alıcak
    //   productFeatures: productFeaturesController.text,
    //   productImages: ProductImages(images: imageFileList!),
    // );

    // try {
    //   await productRepository.addProduct(productModel: productFeatures);

    //   print('eklendi');
    // } catch (e) {
    //   if (kDebugMode) {
    //     print(e.toString());
    //   }
    // }
  }
}
