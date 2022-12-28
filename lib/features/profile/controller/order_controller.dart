import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/order_creat.dart';
import '../../../core/entities/my_order_list_detail_model.dart';
import '../../../core/entities/my_order_list_model.dart';
import '../../../core/entities/seller_orders_model.dart';
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
    // myOrderDetails = MyOrderDetailsModel();
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

    late String sellerOrderId;

  List<OrderSellerDetails> sellerOrderList = [];

  Future<void> getSellerOrders() async {
    orderList.clear();
    try {
      final getOrders = await profileRepository.getSellerOrdes();

      getOrders.fold((l) => Left(l), (data) {
        sellerOrderList.addAll(data.orders.orders);

        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }


    late String updateSellerOrderId;

   late int isOrder;

    Future<void> updateSellerOrdes() async {
    try {
      await profileRepository.updateSellerOrdes(status: isOrder);

      if(isOrder == 1){
         showCustomMessenger(CustomMessengerState.SUCCESS, 'Sipariş kabul edildi');
      }

      if(isOrder == -1){
         showCustomMessenger(CustomMessengerState.ERROR, 'Sipariş reddedildi');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
