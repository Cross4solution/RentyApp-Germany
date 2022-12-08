import 'package:flutter/material.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/shared_widgets/app_button.dart';
import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';
import 'package:rent_app_germany/features/auth/controller/register_controller.dart';
import 'package:rent_app_germany/features/auth/view/widget/seller_check_box.dart';

import '../widget/add_app_bar.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AppContainer(
      child: Scaffold(
        appBar: const AddProductAppBar(),
        body: sl<RegisterController>().isSeller
            ? SingleChildScrollView(
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
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
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
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    const Text(
                      'Ürün Başlığı',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AppTextFormField.standart(hintText: ''),
                    ),
                    const Divider(),
                    const Text(
                      'Açıklama',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AppTextFormField.standart(hintText: ''),
                    ),
                    const Divider(),
                    const Text(
                      'Kategori',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AppTextFormField.standart(hintText: ''),
                    ),
                    const Divider(),
                    const Text(
                      'Hasar bilgisi',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Consumer(
                      builder: (context, RegisterController registerController,
                          child) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: registerController.isSeller,
                                  checkColor: Colors.white,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.red),
                                  activeColor: Colors.red,
                                  onChanged: (value) {
                                    registerController
                                        .isTermsAndConditionAccept(value!);
                                  },
                                ),
                                const Text(
                                  'Hasarsız',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: registerController.isSeller,
                                  checkColor: Colors.white,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.red),
                                  activeColor: Colors.red,
                                  onChanged: (value) {
                                    registerController
                                        .isTermsAndConditionAccept(value!);
                                  },
                                ),
                                const Text(
                                  'Az hasarlı',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: registerController.isSeller,
                                  checkColor: Colors.white,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.red),
                                  activeColor: Colors.red,
                                  onChanged: (value) {
                                    registerController
                                        .isTermsAndConditionAccept(value!);
                                  },
                                ),
                                const Text(
                                  'Hasarlı',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    const Divider(),
                    const Text(
                      'Renk',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AppTextFormField.standart(hintText: ''),
                    ),
                    const Divider(),
                    const Text(
                      'Model yılı',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AppTextFormField.standart(hintText: ''),
                    ),
                    const Divider(),
                    const Text(
                      'Fiyat',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AppTextFormField.standart(hintText: ''),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    AppButton.standart(onTap: () {}, buttonText: 'Kaydet'),
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
                    AppButton.standart(onTap: () {}, buttonText: 'Kaydet')
                  ],
                ),
              ),
      ),
    );
  }
}
