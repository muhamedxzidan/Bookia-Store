part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

// Get wishlist states
final class GetWishlistLoading extends WishlistState {}

final class GetWishlistSuccess extends WishlistState {
  GetWishlistSuccess(this.products);
  final List<BookProduct> products;
}

final class GetWishlistError extends WishlistState {}

// Remove from wishlist states
final class RemoveFromWishlistLoading extends WishlistState {}

final class RemoveFromWishlistSuccess extends WishlistState {}

final class RemoveFromWishlistError extends WishlistState {}

// Add to wishlist states
final class AddToWishlistLoading extends WishlistState {}

final class AddToWishlistSuccess extends WishlistState {}

final class AddToWishlistError extends WishlistState {}
