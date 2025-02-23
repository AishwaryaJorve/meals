import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabScreen extends StatefulWidget{

  const TabScreen({super.key});

@override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }

}

class _TabScreenState extends State<TabScreen>{
  int _selectedPageIndex=0;
  final List<Meal> _favorites = [];

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget activePage=const CategoriesScreen();
    var activePageTitle='Categories';

    if(_selectedPageIndex==1){
      activePage= const MealsScreen(meals: []);
      activePageTitle='Your Favorites';
    }
    


    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}