import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context,Category category) {
    final filteredMeal=dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeal
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing:
                20, //To have some space between the column (horizontally)
            mainAxisSpacing:
                20 // To have some space betwwn the rows (vertically)
            ),
        children: [
          // ignore: avoid_types_as_parameter_names
          // availableCategories.map((Category) => CategoryGridItem(category: Category)).toList();
          // ignore: non_constant_identifier_names
          for (final Category in availableCategories)
            CategoryGridItem(
              category: Category,
              onSelectCategory: (){
                _selectCategory(context,Category);
              },
            )
        ],
      );
  }
}
