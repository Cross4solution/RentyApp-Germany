import 'package:rent_app_germany/core/shared_widgets/app_button.dart';
import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';
import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';

import '../../../../core/_core_exports.dart';

class AdressAddPage extends StatelessWidget {
  const AdressAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AppContainer(
      child: Scaffold(
        appBar: AppBar(

          leading: GestureDetector(onTap: () {
            Go.to.page(PageRoutes.adressPage);
          },
            child: Icon(Icons.arrow_back_ios)),
          title: Text('Adres Ekle'),centerTitle: true,


        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Adres bilgilerinizi giriniz.',
                  style: TextStyle(fontSize: 22, color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 16,
                ),
                AppTextFormField.standart(
                  hintText: 'Adres başlığı',
                  prefixIcon: Icon(Icons.title),
                  controller: sl<ProfileController>().adressTitle,
                ),
                SizedBox(
                  height: 16,
                ),
                AppTextFormField.standart(
                  hintText: 'Şehir',
                  prefixIcon: Icon(Icons.home_filled),
                    controller: sl<ProfileController>().adressCity,
                ),
                SizedBox(
                  height: 16,
                ),
                AppTextFormField.chat(
                  width: double.infinity,
                  hintText: 'Açık adres',
                  prefixIcon: Icon(Icons.location_on_sharp),
                    controller: sl<ProfileController>().adressDetail,
                ),
                SizedBox(
                  height: 16,
                ),
                AppTextFormField.standart(
                  hintText: 'Posta kodu',
                  prefixIcon: Icon(Icons.numbers_rounded),
                    controller: sl<ProfileController>().adressPostalCode,
                ),
                SizedBox(
                  height: 16,
                ),
                AppButton.standart(
                    onTap: () {
                      sl<ProfileController>().addAdress();
                    },
                    buttonText: 'Ekle')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
