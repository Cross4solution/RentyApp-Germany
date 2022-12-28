import 'package:rent_app_germany/features/profile/view/widget/favorite_products.dart';

import '../../../../core/_core_exports.dart';
import '../../controller/profile_controller.dart';

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({super.key});

  @override
  State<MyFavoritesPage> createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorilerim'),
        centerTitle: true,
      ),

      body: FavoriteProducts()
      
    );
  }
}
