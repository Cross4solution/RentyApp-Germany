import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';
import 'package:rent_app_germany/core/entities/order_creat.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/entites/main_endpoint.dart';
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
    FormData formData = FormData();

    for (int i = 0; i < imageFileList!.length; i++) {
      File file = File(imageFileList![i].path);
      String fileName = file.path.split('/').last;
      final MultipartFile multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      );
      formData.files.add(MapEntry("images[]", multipartFile));
    }

    ProductFeatures productFeatures = ProductFeatures(
      productName: 'deneme',
      productDescription: 'deneme',
      price: 500,
      rentalPrice: 50,
      categoryId: '1', // bottom sheet alanındaki kategoriyi alıcak
      productFeatures: 'productFeaturesController.text',
      // productImages: ProductImages(images: imageFileList!),
    );

    productFeatures.toMap().forEach((final key, final value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    // File file = File(imageFileList![0].path);

    //  String fileName = file.path.split('/').last;

    try {
      // await productRepository.addProduct(productModel: productFeatures);

      // FormData formData = FormData.fromMap({
      //   "name": "nisssdce",
      //   "description": "deneme",
      //   "price": 45,
      //   "rental_price": 45,
      //   "category_id": 1,
      //   "features": "fsdfsdfsdf",

      //     "images[]":
      //       await MultipartFile.fromFile(file.path, filename: fileName)

      // });

      Response response = await sl<Dio>().post(MainEndpoints.addProduct.path,
          data: formData,
          options: Options(
            headers: {"Authorization": "Bearer ${sl<UserModel>().accessToken}"},

            responseType: ResponseType.plain,

            //  contentType: "multipart/form-data",
          ));

      print(response);

      print(sl<UserModel>().accessToken);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  late int productId;
  String startDate = '';
  String endDate = '';
   String adressId = '';
   String cardId = '';

  Future<void> orderCreat() async {
    print("**************");
    print(productId);
    print(startDate);
    print(endDate);
    print(adressId);
    print(cardId);
    checkOrderItems();
    final orderCreat = OrderModel(
      productId: productId,
      startDate: startDate,
      endDate: endDate,
      adressId: adressId,
      cardId: cardId,
    );

    try {
      await productRepository.orderCreat(orderModel: orderCreat);
    } catch (e) {
      print(e.toString());
    }
  }


  void checkOrderItems(){
    if(productId == null){
       showCustomMessenger(CustomMessengerState.ERROR,
              'Ürün id değeri eksik girilmiştir.');
    }
    if(startDate == ''){
       showCustomMessenger(CustomMessengerState.ERROR,
              'Kiralama başlangıç tarihini giriniz.');
    }
    if(endDate == ''){
       showCustomMessenger(CustomMessengerState.ERROR,
              'Kiralama bitiş tarihini giriniz.');
    }
    if(adressId == ''){
       showCustomMessenger(CustomMessengerState.ERROR,
              'Lütfen adresinizi seçiniz.');
    }
    if(cardId == ''){
       showCustomMessenger(CustomMessengerState.ERROR,
              'Lütfen kredi kartı seçiniz.');
    }
    


  }
}
