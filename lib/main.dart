import 'package:flutter/material.dart';
import 'package:flutter_food_taste/data/restaurant_data.dart';
import 'package:flutter_food_taste/ui/_core/widgets/app_theme.dart';
import 'package:flutter_food_taste/ui/_core/widgets/bag_provider.dart';
import 'package:flutter_food_taste/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData =
      RestaurantData(); // estamos instanciando a lista de restaurante lá da classe RestaurantData
  await restaurantData
      .getRestaurants(); //aqui serve pra alimentar a lista do restaurante_data.dart ta pegando todos os elementos
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantData; // isso quer dizer que a aplicação inteira vai conseguir ver a lista de restaurantes já carregada com a função getRestaurants da classe RestaurantData;
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
// alura
//guia de mergulho
//widgets