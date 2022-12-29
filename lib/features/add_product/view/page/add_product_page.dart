import 'package:flutter/material.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/shared_widgets/app_button.dart';
import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';
import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';
import 'package:rent_app_germany/features/auth/controller/auth_controller.dart';
import 'package:rent_app_germany/features/auth/view/widget/seller_check_box.dart';
import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';

import '../widget/add_app_bar.dart';
import '../widget/add_product_picture.dart';
import '../widget/damage_information_checkbox.dart';
import '../widget/dropdown_category.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AppContainer(
      child: Scaffold(
        appBar: const AddProductAppBar(),
        body: sl<UserModel>().user?.isSeller == true
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.warning_rounded,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Eklemek istediğiniz ürünün özelliklerini giriniz.',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(),
                      const Text(
                        'Ürün Görselleri',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const AddProductPicture(),
                      const Divider(),
                      const Text(
                        'Ürün Başlığı',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: AppTextFormField.standart(
                            hintText: '',
                            controller:
                                sl<ProductController>().productNameController),
                      ),
                      const Divider(),
                      const Text(
                        'Açıklama',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: AppTextFormField.chat(
                            hintText: '',
                            controller: sl<ProductController>()
                                .productFeaturesController),
                      ),
                      const Divider(),
                      const Text(
                        'Kategori',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      DropdownCategory(),
                      const Divider(),
                      const Text(
                        'Hasar bilgisi',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const DamageInformationCheckbox(),
                      const Divider(),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Fiyat',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            '  *günlük',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: AppTextFormField.standart(
                            hintText: '',
                            controller:
                                sl<ProductController>().productRentalPriceController),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      AppButton.standart(
                          onTap: () {
                            sl<ProductController>().addProduct();
                          },
                          buttonText: 'Kaydet'),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ))
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    SvgPicture.asset(AssetsPath().addProductSVG),
                    const Text(
                      'Ürün eklemek için satış sözleşmesini kabul etmeniz gerekmektedir.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SellerCheckBox(),
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),
                    AppButton.standart(
                        onTap: () {
                          sl<ProfileController>().updateSellerInfo();
                        },
                        buttonText: 'Kaydet')
                  ],
                ),
              ),
      ),
    );
  }
}
