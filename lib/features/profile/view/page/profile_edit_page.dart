import 'package:rent_app_germany/core/shared_widgets/app_button.dart';
import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';
import '../../../../core/_core_exports.dart';
import '../widget/profile_edit_app_bar.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AppContainer(
      child: Scaffold(
        appBar: const ProfileEditAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              AppTextFormField.obscure(
                hintText: 'Eski şifrenizi giriniz...',
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextFormField.obscure(
                hintText: 'Yeni şifrenizi giriniz...',
              ),
              const Spacer(),
              AppButton.standart(onTap: () {}, buttonText: 'Kaydet')
            ],
          ),
        ),
      ),
    );
  }
}
