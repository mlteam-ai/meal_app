import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  Widget getNoMealWidget(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No meals found for this category',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ],
      ),
    );
  }

  Widget getContent(context) {
    return (meals.isEmpty)
        ? getNoMealWidget(context)
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return MealItem(
                  meal: meals[index],
                  onTap: (meal) {
                    _selectMeal(context, meal);
                  });
            },
          );
  }

  void _selectMeal(context, meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return getContent(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: getContent(context),
    );
  }
}
