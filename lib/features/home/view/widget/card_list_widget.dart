import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';
import 'package:rent_app_germany/features/profile/controller/credit_card_controller.dart';

import '../../../../core/_core_exports.dart';
import '../../../profile/controller/profile_controller.dart';

class CardListWidget extends StatefulWidget {
  const CardListWidget({super.key});

  @override
  State<CardListWidget> createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sl<CreditCardController>().getCreditCardInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, CreditCardController creditCardController, child) {
        return creditCardController.creditCardList.isEmpty
            ? GestureDetector(
                onTap: () {
                  Go.to.page(PageRoutes.creditCardShowPage);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                      alignment: Alignment.center,
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(Icons.add)),
                ),
              )
            : SizedBox(
                height: 48,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: creditCardController.creditCardList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {
                              creditCardController.SelectCard(index);

                              sl<ProductController>().cardId =
                                  creditCardController.creditCardList[index].id!
                                      .toString();

                              print("Credit Card Id : "
                                  "${sl<ProductController>().cardId}");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 46,
                              width: 100,
                              decoration: BoxDecoration(
                                color: creditCardController.expandedCardIndex ==
                                        index
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 2),
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                creditCardController
                                    .creditCardList[index].cardName!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: index ==
                              creditCardController.creditCardList.length - 1,
                          child: GestureDetector(
                            onTap: () {
                              Go.to.page(PageRoutes.creditCardShowPage);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 46,
                                  width: 46,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Icon(Icons.add)),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}
