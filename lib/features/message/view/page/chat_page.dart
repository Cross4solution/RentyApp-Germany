import 'package:rent_app_germany/features/message/view/widget/text_input_widget.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/app_text_form_field.dart';
import '../../controller/message_controller.dart';
import '../widget/chat_app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(milliseconds: 500),
      () {
        customSnackBar(
          text:
              'Chat kısmından RentyApp platformu dışına yönlendiricecek telefon numarası veya e-posta adresi paylaşmak yasaktır',
          context: context,
          color: Colors.red,
          seconds: 6,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      appBar: const ChatAppBar(),
      body: AppContainer(
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return SizedBox.shrink();
                    },
                  ),
                ),
                // Container(
                //   height: ScreenSize().getHeightPercent(1) - 141,
                //   width: double.infinity,
                //   // color: Colors.blue,
                // ),
                const TextInputWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
