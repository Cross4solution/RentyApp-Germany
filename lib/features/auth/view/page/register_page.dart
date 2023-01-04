import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/app_text_form_field.dart';
import '../../controller/auth_controller.dart';
import '../widget/seller_check_box.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Go.to.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, AuthController registerController, child) {
          return SingleChildScrollView(
            child: AppContainer(
              child: Container(
                height: ScreenSize().getBodyHeight() - 60,
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: registerController.formGlobalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppTextFormField.standart(
                        controller: registerController.nameController,
                        hintText: 'Enter your name',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen gerekli alanları doldurunuz';
                          }

                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppTextFormField.standart(
                        controller: registerController.usernameController,
                        hintText: 'Enter your username',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen gerekli alanları doldurunuz';
                          }

                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppTextFormField.standart(
                        controller: registerController.phoneNumberController,
                        hintText: 'Enter your phone number',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen gerekli alanları doldurunuz';
                          }

                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.phone,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppTextFormField.standart(
                        controller: registerController.emailController,
                        hintText: 'Enter your email adress',
                        validator: (String? value) {
                          if (value != null) {
                            if (emailValidator(value)) {
                              return 'Doğru formatta bir mail giriniz';
                            }
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.mail,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppTextFormField.obscure(
                        controller: registerController.passwordController,
                        hintText: 'Enter your password',
                        validator: (String? value) {
                          if (value != null) {
                            if (value.length < 6) {
                              return "Şifreniz en az 6 karakter olmalıdır";
                            }

                            if (value.length >= 50) {
                              return "Şifreniz en fazla 50 karakter olmalıdır";
                            }
                          }

                          return null;
                        },
                      ),
                      const SellerCheckBox(),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          removeFocus(context);
                          registerController.register();
                        
                          
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorHelper.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
