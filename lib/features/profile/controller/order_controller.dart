import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/order_creat.dart';
import '../../../core/entities/my_order_list_detail_model.dart';
import '../../../core/entities/my_order_list_model.dart';
import '../repo/profile_repo.dart';

class OrderController extends ChangeNotifier {
  ProfileRepository profileRepository;

  OrderController({required this.profileRepository}) {
    // getFavorites();
    // getAdress();
  }

  late String orderId;

  List<OrderDetails> orderList = [];

  Future<void> getOrders() async {
    orderList.clear();
    try {
      final getOrders = await profileRepository.getMyOrders();

      getOrders.fold((l) => Left(l), (data) {
        orderList.addAll(data.orders!.orderDetails!);

        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  MyOrderDetailsModel? myOrderDetails;

  Future<void> getOrdersDetails() async {
    try {
      final getOrderDetails = await profileRepository.getMyOrderDetails();

      getOrderDetails.fold((l) => Left(l), (data) {
        myOrderDetails = data;

        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }

late DateTime rentEndDate = myOrderDetails!.order!.orderDetalis.rentEndDate;
late DateTime rentStartDate = myOrderDetails!.order!.orderDetalis.rentStartDate;

 late int rangeTime = rentEndDate.difference( rentStartDate).inDays;


  // endDate.difference(startDate)
}
