import 'package:flutter/material.dart';
import 'package:flutter_food_taste/model/restaurant.dart';
import 'package:flutter_food_taste/ui/restaurant/restaurant_screen.dart';

class RestaurantWidget extends StatelessWidget {
  //Precisamos receber o restaurante, então passamos uma variavel que sera do tipo restaurant para
  //isso passará tudo para esse widget
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // serve pra transformas esse widget em algo que vai para o restaurant
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RestaurantScreen(restaurant: restaurant);
            },
          ),
        );
      },
      child: Row(
        spacing: 12.0,
        children: [
          Image.asset('assets/${restaurant.imagePath}', width: 72),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              Row(
                children: List.generate(restaurant.stars.toInt(), (index) {
                  return Image.asset('assets/others/star.png', width: 16);
                }),
              ),
              Text('${restaurant.distance}km'),
            ],
          ),
        ],
      ),
    );
  }
}
