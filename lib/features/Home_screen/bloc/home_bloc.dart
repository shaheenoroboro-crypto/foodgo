import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/food_item.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Dummy Data
  final List<String> _categories = ['All', 'Combos', 'Sliders', 'Classic'];
  final List<FoodItem> _foodItems = const [
    FoodItem(
      title: 'Cheeseburger',
      subtitle: "Wendy's Burger",
      rating: '4.9',
      image: 'assets/burger1.png',
    ),
    FoodItem(
      title: 'Hamburger',
      subtitle: 'Veggie Burger',
      rating: '4.8',
      image: 'assets/burger2.png',
    ),
    FoodItem(
      title: 'Hamburger',
      subtitle: 'Chicken Burger',
      rating: '4.6',
      image: 'assets/burger3.png',
    ),
    FoodItem(
      title: 'Hamburger',
      subtitle: 'Fried Chicken Burger',
      rating: '4.5',
      image: 'assets/burger4.png',
    ),
  ];

  HomeBloc() : super(HomeLoading()) {
    on<HomeStarted>(_onHomeStarted);
    on<CategorySelected>(_onCategorySelected);
  }

  void _onHomeStarted(HomeStarted event, Emitter<HomeState> emit) {
    emit(HomeLoaded(
      foodItems: _foodItems,
      categories: _categories,
      selectedCategoryIndex: 0,
    ));
  }

  void _onCategorySelected(CategorySelected event, Emitter<HomeState> emit) {
    final currentState = state;
    if (currentState is HomeLoaded) {
      emit(HomeLoaded(
        foodItems: currentState.foodItems,
        categories: currentState.categories,
        selectedCategoryIndex: event.index,
      ));
    }
  }
}
