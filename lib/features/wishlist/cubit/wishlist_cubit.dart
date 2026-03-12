import 'package:bloc/bloc.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:bookia_store/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter/material.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  Future<void> getWishlist() async {
    emit(GetWishlistLoading());
    try {
      final response = await WishlistRepo.getWishlist();
      if (response != null && response.data != null) {
        emit(GetWishlistSuccess(response.data!.products ?? []));
      } else {
        debugPrint('===> GetWishlist Error: Response is null or data is null');
        emit(GetWishlistError());
      }
    } catch (e) {
      debugPrint('===> GetWishlist Exception: $e');
      emit(GetWishlistError());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(RemoveFromWishlistLoading());
    try {
      final success = await WishlistRepo.removeFromWishlist(productId);
      if (success) {
        emit(RemoveFromWishlistSuccess());
        await getWishlist();
      } else {
        emit(RemoveFromWishlistError());
      }
    } catch (e) {
      debugPrint('===> RemoveFromWishlist Exception: $e');
      emit(RemoveFromWishlistError());
    }
  }

  Future<void> addToWishlist(int productId) async {
    emit(AddToWishlistLoading());
    try {
      final success = await WishlistRepo.addToWishlist(productId);
      if (success) {
        emit(AddToWishlistSuccess());
        await getWishlist();
      } else {
        emit(AddToWishlistError());
      }
    } catch (e) {
      debugPrint('===> AddToWishlist Exception: $e');
      emit(AddToWishlistError());
    }
  }
}
