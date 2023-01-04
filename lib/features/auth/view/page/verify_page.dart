import 'package:rent_app_germany/core/shared_widgets/app_button.dart';
import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';
import 'package:rent_app_germany/features/auth/controller/auth_controller.dart';

import '../../../../core/_core_exports.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text("Email Doğrulama"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                    const Icon(Icons.email, size: 36),
                     const SizedBox(
                  width: 8,
                ),
                    Text(
                      sl<AuthController>().emailController.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                Text(
              "Email adresinize doğrulama bağlantısı gönderilmiştir. Bağlantıya tıklayarak gerekli işlemleri yapabilirsiniz. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700),
            ),
              ],
            ),

       
            
         

            AppButton.standart(onTap: () {
              sl<AuthController>().verifyEmail();

              Go.to.pageAndRemoveUntil(PageRoutes.loginPage);
              
            }, buttonText: "Devam Et")
          ],
        ),
      ),
    );
  }
}
