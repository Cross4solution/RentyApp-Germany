import 'package:rent_app_germany/features/message/controller/message_controller.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/app_text_form_field.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Edit text
            AppTextFormField.chat(
              hintText: 'Type your message...',
              controller: sl<MessageController>().chatController,
              width: ScreenSize().getWidthPercent(1) - 52,
              suffixIcon: IconButton(
                // Button send image
                icon: const Icon(
                  Icons.image,
                  color: ColorHelper.secondaryColor,
                ),
                onPressed: sl<MessageController>().getImage,
                color: ColorHelper.primaryColor,
              ),
            ),

            // Button send message
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: GestureDetector(
                onTap: () {
                  // onSendMessage(textEditingController.text, TypeMessage.text);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
