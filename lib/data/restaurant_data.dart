import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_taste/model/restaurant.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];
  Future<void> getRestaurants() async {
    // rootbundle serve para ler coisas escritas na past assets
    //aqui ele le o que recebe e transforma em um bloco de texto.
    String jsonString = await rootBundle.loadString('assets/data.json');
    // isso transforma em map para você conseguir usar isso como uma "variavel"
    //decode transforma um json em um map, ou seja aqui voce consegue usar isso como variavel;
    Map<String, dynamic> data = json.decode(jsonString);
    // essa lista de dynamic tá pegando todos os elementos do json na chave restaurants;
    /*   "restaurants": [
        {
            "id": "b2d171d3-a225-4ee9-8f23-058ed691ef7c",
            "imagePath": "restaurants/monstro-burguer.png",
            "name": "Monstro Burguer",
            "description": "Hambúrgueres para quem curte a madrugada.",
            "stars": 4.3,
            "distance": 2,
            "categories": [
                "Principais",
                "Petiscos"
            ],*/
    List<dynamic> restaurantsData = data['restaurants'];
    // depois da lista transformada, vamos percorrer com o for para pegar cada elemento
    for (var restaurantData in restaurantsData) {
      // pegou o map recebido e percorreu todos os elementos, a var restaunrantData representa um restaurante que veio do json;
      Restaurant restaurant = Restaurant.fromMap(
        restaurantData,
      ); // isso aqui pega cada restaurante e instancia ele na classe restaurante tudo que recebeu do json
      listRestaurant.add(
        restaurant,
      ); // adiciona cada elemento instanciado na classe restaurante na variavel criada na linha 7
    }
  }
}
