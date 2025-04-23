import 'package:flutter/material.dart';
import 'package:flutter_food_taste/ui/_core/widgets/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final String
  category; // como estou recebendo um string, então eu passo uma string pra ele identificar o que precisa mudar
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8.0,
        children: [
          Image.asset(
            "assets/categories/${category.toLowerCase()}.png",
            height: 48,
          ),
          Text(
            category,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
