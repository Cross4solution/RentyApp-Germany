import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';

import '../../../../core/_core_exports.dart';

class AddProductPicture extends StatelessWidget {
  const AddProductPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer(
        builder: (context, ProductController productController, child) {
          return productController.imageFileList!.isEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.only(right: 12, top: 10, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      productController.getPhotoFromGallery(context);
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          alignment: Alignment.center,
                          height: 175,
                          width: 125,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey)),
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: productController.imageFileList!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: 12, top: 10, bottom: 10),
                      child: Stack(children: [
                        GestureDetector(
                          onTap: () {
                            productController.getPhotoFromGallery(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                                height: 175,
                                width: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.file(
                                    File(
                                      productController
                                          .imageFileList![index].path,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          bottom: -5,
                          right: -5,
                          child: InkWell(
                              onTap: () {
                                productController.removePhoto(index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                              )),
                        ),
                      ]),
                    );
                  },
                );
        },
      ),
    );
  }
}
