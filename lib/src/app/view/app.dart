import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:notifications_repository/notifications_repository.dart';
import 'package:orders_repository/orders_repository.dart';
import 'package:payments_repository/payments_repository.dart';
import 'package:restaurants_repository/restaurants_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:yummy_food_delivery/src/app/app.dart';
import 'package:yummy_food_delivery/src/auth/login/login.dart';
import 'package:yummy_food_delivery/src/auth/sign_up/sign_up.dart';
import 'package:yummy_food_delivery/src/cart/cart.dart';
import 'package:yummy_food_delivery/src/map/map.dart';
import 'package:yummy_food_delivery/src/notifications/notifications.dart';
import 'package:yummy_food_delivery/src/orders/orders.dart';
import 'package:yummy_food_delivery/src/payments/payments.dart';
import 'package:yummy_food_delivery/src/restaurants/restaurants.dart';

class App extends StatelessWidget {
  const App({
    required this.user,
    required this.userRepository,
    required this.ordersRepository,
    required this.restaurantsRepository,
    required this.locationRepository,
    required this.paymentsRepository,
    required this.notificationsRepository,
    super.key,
  });

  final User user;
  final UserRepository userRepository;
  final OrdersRepository ordersRepository;
  final RestaurantsRepository restaurantsRepository;
  final LocationRepository locationRepository;
  final PaymentsRepository paymentsRepository;
  final NotificationsRepository notificationsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: userRepository),
        RepositoryProvider.value(value: ordersRepository),
        RepositoryProvider.value(value: restaurantsRepository),
        RepositoryProvider.value(value: locationRepository),
        RepositoryProvider.value(value: paymentsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              user: user,
              userRepository: userRepository,
              notificationsRepository: notificationsRepository,
            ),
          ),
          BlocProvider(
            create: (_) => RestaurantsBloc(
              userRepository: userRepository,
              restaurantsRepository: restaurantsRepository,
            ),
          ),
          BlocProvider(
            create: (_) => SignUpCubit(userRepository: userRepository),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => NotificationsBloc(
              userRepository: userRepository,
              notificationRepository: notificationsRepository,
            ),
          ),
          BlocProvider(
            create: (_) => LoginCubit(userRepository: userRepository),
          ),
          BlocProvider(
            create: (_) => PaymentsBloc(paymentsRepository: paymentsRepository),
          ),
          BlocProvider(
            create: (_) =>
                SelectedCardCubit(paymentsRepository: paymentsRepository),
          ),
          BlocProvider(
            create: (_) => OrdersBloc(
              userRepository: userRepository,
              ordersRepository: ordersRepository,
            )..add(const OrdersFetchRequested()),
          ),
          BlocProvider(
            create: (_) => LocationBloc(userRepository: userRepository),
          ),
          BlocProvider(
            create: (_) => CartBloc(
              restaurantsRepository: restaurantsRepository,
              ordersRepository: ordersRepository,
              notificationsRepository: notificationsRepository,
              userRepository: userRepository,
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}
