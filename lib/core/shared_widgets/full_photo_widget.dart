import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../_core_exports.dart';
import '../entities/get_product_model.dart';

class FullPhotoWidget extends StatelessWidget {
  final ProductFeatures productFeatures;

  const FullPhotoWidget({
    Key? key,
    required this.productFeatures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     backgroundColor: Colors.white,
        //     title: const Text(
        //       'Photo',
        //       style: TextStyle(color: ColorHelper.secondaryColor),
        //     ),
        //     centerTitle: true,
        //     leading: GestureDetector(
        //       onTap: () => Navigator.pop(context),
        //       child: const Icon(
        //         Icons.arrow_back_ios,
        //         color: ColorHelper.secondaryColor,
        //       ),
        //     )),
        body: SafeArea(
      child: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(
                  "https://api.testsoftware.site/${productFeatures.productImages!.images[index]}",
                ),
                initialScale: PhotoViewComputedScale.contained * 1,
                // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
              );
            },
            itemCount: productFeatures.productImages!.images.length,
            // loadingBuilder: (context, event) => Center(
            //   child: Container(
            //     width: 20.0,
            //     height: 20.0,
            //     child: CircularProgressIndicator(
            //       value: event == null
            //           ? 0
            //           : event.cumulativeBytesLoaded / event.expectedTotalBytes,
            //     ),
            //   ),
            // ),
            // backgroundDecoration: widget.backgroundDecoration,
            // pageController: widget.pageController,
            // onPageChanged: onPageChanged,
          ),
          Positioned(
            left: 12,
            top: 12,
            child: GestureDetector(
              onTap: () => Go.to.back(),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Center(
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )

        //  PhotoView(
        //   imageProvider: NetworkImage( "https://api.testsoftware.site/${productFeatures.productImages!.images[0]}"),
        // ),
        );
  }
}
