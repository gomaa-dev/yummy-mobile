/// {@template yummy_api_exception}
/// Exceptions from yummy Eats API client.
/// {@endtemplate}
abstract class yummyEatsApiException implements Exception {
  /// {@macro yummy_api_exception}
  const yummyEatsApiException(this.error);

  /// The error which was caught.
  final Object error;

  @override
  String toString() => 'yummy Eats API exception error: $error';
}

/// {@template get_user_notifications_failure}
/// Thrown during the get user notifications if a failure occurs.
/// {@endtemplate}
class GetUserNotificationsFailure extends yummyEatsApiException {
  /// {@macro get_user_notifications_failure}
  const GetUserNotificationsFailure(super.error);
}

/// {@template get_restaurant_by_id}
/// Thrown during the get of restaurant by id if a failure occurs.
/// {@endtemplate}
class GetRestaurantById extends yummyEatsApiException {
  /// {@macro get_restaurant_by_id}
  const GetRestaurantById(super.error);
}

/// {@template get_restaurant_by_location_failure}
/// Thrown during the get of restaurant by location if a failure occurs.
/// {@endtemplate}
class GetRestaurantByLocationFailure extends yummyEatsApiException {
  /// {@macro get_restaurant_by_location_failure}
  const GetRestaurantByLocationFailure(super.error);
}

/// {@template get_restaurant_by_location_failure}
/// Thrown during the add of restaurant if a failure occurs.
/// {@endtemplate}
class AddRestaurantFailure extends yummyEatsApiException {
  /// {@macro get_restaurant_by_location_failure}
  const AddRestaurantFailure(super.error);
}

/// {@template update_restaurant_failure}
/// Thrown during the update of restaurant if a failure occurs.
/// {@endtemplate}
class UpdateRestaurantFailure extends yummyEatsApiException {
  /// {@macro update_restaurant_failure}
  const UpdateRestaurantFailure(super.error);
}

/// {@template delete_restaurant_failure}
/// Thrown during the delete of restaurant if a failure occurs.
/// {@endtemplate}
class DeleteRestaurantFailure extends yummyEatsApiException {
  /// {@macro delete_restaurant_failure}
  const DeleteRestaurantFailure(super.error);
}

/// {@template get_popular_restaurants_by_location_failure}
/// Thrown during the get of popular restaurants by location if a
/// failure occurs.
/// {@endtemplate}
class GetPopularRestaurantByLocationFailure extends yummyEatsApiException {
  /// {@macro get_popular_restaurants_by_location_failure}
  const GetPopularRestaurantByLocationFailure(super.error);
}

/// {@template search_restaurants_failure}
/// Thrown during the search of restaurants if a failure occurs.
/// {@endtemplate}
class SearchRestaurantsFailure extends yummyEatsApiException {
  /// {@macro search_restaurants_failure}
  const SearchRestaurantsFailure(super.error);
}

/// {@template get_restaurants_tags_failure}
/// Thrown during the get of restaurants tags if a failure occurs.
/// {@endtemplate}
class GetRestaurantsTagsFailure extends yummyEatsApiException {
  /// {@macro get_restaurants_tags_failure}
  const GetRestaurantsTagsFailure(super.error);
}

/// {@template get_restaurants_by_tags_failure}
/// Thrown during the get of restaurants by tags if a failure occurs.
/// {@endtemplate}
class GetRestaurantsByTagsFailure extends yummyEatsApiException {
  /// {@macro get_restaurants_by_tags_failure}
  const GetRestaurantsByTagsFailure(super.error);
}

/// {@template get_menu_failure}
/// Thrown during the get of menu if a failure occurs.
/// {@endtemplate}
class GetMenuFailure extends yummyEatsApiException {
  /// {@macro get_menu_failure}
  const GetMenuFailure(super.error);
}

/// {@template get_user_profile_failure}
/// Thrown during the get of user if a failure occurs.
/// {@endtemplate}
class GetUserProfileFailure extends yummyEatsApiException {
  /// {@macro get_user_profile_failure}
  const GetUserProfileFailure(super.error);
}

/// {@template add_user_credit_card_failure}
/// Thrown during the add of user credit card if a failure occurs.
/// {@endtemplate}
class AddCreditCardFailure extends yummyEatsApiException {
  /// {@macro add_user_credit_card_failure}
  const AddCreditCardFailure(super.error);
}

/// {@template delete_credit_card_failure}
/// Thrown during the get of user if a failure occurs.
/// {@endtemplate}
class DeleteCreditCardFailure extends yummyEatsApiException {
  /// {@macro delete_credit_card_failure}
  const DeleteCreditCardFailure(super.error);
}

/// {@template get_credit_cards_failure}
/// Thrown during the get of credit cards if a failure occurs.
/// {@endtemplate}
class GetCreditCardsFailure extends yummyEatsApiException {
  /// {@macro get_credit_cards_failure}
  const GetCreditCardsFailure(super.error);
}

/// {@template get_credit_card_info_failure}
/// Thrown during the get of credit card info if a failure occurs.
/// {@endtemplate}
class GetCreditCardInfoFailure extends yummyEatsApiException {
  /// {@macro get_credit_card_info_failure}
  const GetCreditCardInfoFailure(super.error);
}

/// {@template update_credit_card_failure}
/// Thrown during the update of credit card if a failure occurs.
/// {@endtemplate}
class UpdateCreditCardFailure extends yummyEatsApiException {
  /// {@macro update_credit_card_failure}
  const UpdateCreditCardFailure(super.error);
}

/// {@template get_user_failure}
/// Thrown during the get of user if a failure occurs.
/// {@endtemplate}
class GetUserFailure extends yummyEatsApiException {
  /// {@macro get_user_failure}
  const GetUserFailure(super.error);
}
