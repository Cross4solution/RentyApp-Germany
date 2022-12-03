import 'package:image_picker/image_picker.dart';
import 'package:rent_app_germany/core/_core_exports.dart';

class RegisterController extends ChangeNotifier{

    TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController headLineController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

    File? profilePhotoFile;

      bool isChecked = false;


    Future<void> getProfilePhotoImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;

    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePhotoFile = File(pickedFile.path);
      notifyListeners();
    }
  }

    void isTermsAndConditionAccept(bool value) {
    isChecked = value;

    notifyListeners();
  }
}