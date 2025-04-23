import 'package:flutter/material.dart';
import 'package:flutter_food_taste/data/categories_data.dart';
import 'package:flutter_food_taste/data/restaurant_data.dart';
import 'package:flutter_food_taste/model/restaurant.dart';
import 'package:flutter_food_taste/ui/_core/widgets/app_bar.dart';
import 'package:flutter_food_taste/ui/_core/widgets/app_colors.dart';
import 'package:flutter_food_taste/ui/home/widgets/category_widget.dart';
import 'package:flutter_food_taste/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ao invés de instanciar pegamos o que foi instanciado para poder usar com provider, ou seja já instanciamos ele uma vez na main, agora só precisamos usar
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          // serve para rolagem de coluna ou linha, quando for linha precisa usar scrollDirection
          child: Column(
            spacing: 32.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text('Boas-vindas!'),
              TextField(),
              Text('Escolha por categoria'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(
                    //gera uma lista com o que precisamos para percorrer as categorias
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        // isso retorna o widget de rolagem horizontal com a lista que fizemos com categories data
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text('Bem avaliado'),
              Column(
                spacing: 8.0,
                children: List.generate(restaurantData.listRestaurant.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.listRestaurant[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
