import 'package:image_picker/image_picker.dart';
import 'package:rent_app_germany/core/_core_exports.dart';

class MessageController extends ChangeNotifier{

    final TextEditingController chatController = TextEditingController();

Future<void> getImage() async {

 
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;

      File? imageFile;
        bool isLoading = false;

    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
      
          isLoading = true;


          notifyListeners();
    
        // uploadFile();
      }
    }
  }



  
}