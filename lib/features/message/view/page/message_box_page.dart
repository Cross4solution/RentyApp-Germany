import 'package:flutter/material.dart';
import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';
import 'package:rent_app_germany/core/utils/screen_size.dart';
import 'package:rent_app_germany/features/home/view/widget/text_button_widget.dart';
import 'package:rent_app_germany/features/message/view/widget/message_box_bar.dart';

import '../../../../core/shared_widgets/remove_focus_and_bottom_top_padding_container.dart';
import '../widget/message_card.dart';

class MessageBoxPage extends StatelessWidget {
  const MessageBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AppContainer(
      child: Scaffold(
        appBar: const MessageBoxAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: [
                AppTextFormField.standart(
                  hintText: 'Mesajlarda ara',
                  prefixIcon: const Icon(Icons.search, size: 28),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextButtonWidget(
                        text: 'Tümü',
                        textColor: Colors.white,
                        color: Colors.red),
                    TextButtonWidget(
                        text: 'Kiralarım',
                        textColor: Colors.black,
                        color: Colors.grey.shade300),
                    TextButtonWidget(
                        text: 'Kiralanan',
                        textColor: Colors.black,
                        color: Colors.grey.shade300),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return const MessageCard();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
