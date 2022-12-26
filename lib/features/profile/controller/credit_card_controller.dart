import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:rent_app_germany/core/_core_exports.dart';

import '../../../core/entities/credit_cards_model.dart';
import '../repo/profile_repo.dart';

class CreditCardController extends ChangeNotifier {


   ProfileRepository profileRepository;

  CreditCardController({required this.profileRepository}) {
    // getFavorites();
    // getAdress();
  }
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    cardNumber = creditCardModel!.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;

    notifyListeners();
  }

  Future<void> addCreditCard() async {
    final creditCardDetails = CreditCardDetails(
      cardNumber: cardNumber.split(" ").join(""),
      expMonth: expiryDate.substring(0, 2),
      expYear: "20${expiryDate.substring(3, 5)}",
      cvc: cvvCode,
      cardName: cardHolderName,
    );

    try {
      await profileRepository.addCreditCard(creditCardDetails: creditCardDetails);
    } catch (e) {
      print(e.toString());
    }
    // adressTitle.clear();
    // adressCity.clear();
    // adressDetail.clear();
    // adressPostalCode.clear();
  }
}
