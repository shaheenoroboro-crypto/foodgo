import 'package:equatable/equatable.dart';
import '../models/food_item.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<FoodItem> foodItems;
  final List<String> categories;
  final int selectedCategoryIndex;

  const HomeLoaded({
    required this.foodItems,
    required this.categories,
    required this.selectedCategoryIndex,
  });

  @override
  List<Object> get props => [foodItems, categories, selectedCategoryIndex];
}
