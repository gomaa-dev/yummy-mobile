import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_food_delivery/src/map/map.dart';
import 'package:yummy_food_delivery/src/restaurants/restaurants.dart';
import 'package:yummy_food_delivery/src/restaurants/tags/tags.dart';

final PageStorageBucket _bucket = PageStorageBucket();

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _bucket,
      child: const RestaurantsView(),
    );
  }
}

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key});

  @override
  State<RestaurantsView> createState() => _MainPageBodyUIState();
}

class _MainPageBodyUIState extends State<RestaurantsView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.white,
      color: AppColors.black,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      displacement: 30,
      onRefresh: () async {
        context.read<LocationBloc>().add(const LocationFetchAddressRequested());
        context
            .read<RestaurantsBloc>()
            .add(const RestaurantsRefreshRequested());
      },
      child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
        builder: (context, state) {
          final isFiltered = state.status.isFiltered;
          final isLoading = state.status.isLoading;
          final isFailure = state.status.isFailure;
          final restaurants = state.restaurantsPage.restaurants;
          final currentPage = state.restaurantsPage.page;

          return CustomScrollView(
            controller: _scrollController,
            key: const PageStorageKey('restaurantsPage'),
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const RestaurantsAppBar(),
              if (isLoading) const RestaurantsLoadingView(),
              if (currentPage == 0 && isFailure)
                RestaurantsErrorView(
                  onTryAgain: () => context
                      .read<RestaurantsBloc>()
                      .add(const RestaurantsFetchRequested()),
                ),
              if (!isLoading) ...[
                if (!isFiltered) ...[
                  if (restaurants.isEmpty)
                    const RestaurantsEmptyView()
                  else ...[
                    const RestaurantsSectionHeader(text: 'All restaurants'),
                    const TagsSlider(),
                    const RestaurantsListView(),
                  ],
                ] else ...[
                  const TagsSlider(),
                  const SliverToBoxAdapter(
                    child: Divider(
                      height: 1,
                      indent: AppSpacing.md,
                      endIndent: AppSpacing.md,
                    ),
                  ),
                  const FilteredRestaurantsFoundCount(),
                  const FilteredRestaurantsView(),
                ],
              ],
            ],
          );
        },
      ),
    );
  }
}
