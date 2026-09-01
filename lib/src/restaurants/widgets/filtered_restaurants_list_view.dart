import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_food_delivery/src/restaurants/restaurants.dart';

class FilteredRestaurantsView extends StatelessWidget {
  const FilteredRestaurantsView({super.key});

  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = context
        .select((RestaurantsBloc bloc) => bloc.state.filteredRestaurants);

    return RestaurantsListView(restaurants: filteredRestaurants);
  }
}
