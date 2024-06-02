import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/models/meal_category.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/screens/meals.dart';

class CategoryGridItem extends ConsumerWidget {
  final MealCategory mealCategory;

  const CategoryGridItem({super.key, required this.mealCategory});

  void _selectCategory(context, List<Meal> filteredMeals) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: mealCategory.title,
          meals: filteredMeals
              .where((meal) => meal.categories.contains(mealCategory.id))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> filteredMeals = ref.watch(filteredMealsProvider);
    return InkWell(
      onTap: () {
        _selectCategory(context, filteredMeals);
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              mealCategory.color.withOpacity(0.55),
              mealCategory.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          mealCategory.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ),
    );
  }
}
