import 'package:bloc/bloc.dart';
import 'package:bookia_store/features/home/data/models/best_seller_model.dart';
import 'package:bookia_store/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  Future<void> getWishlist() async {
    emit(GetWishlistLoading());
    final response = await WishlistRepo.getWishlist();
    if (response != null && response.data != null) {
      emit(GetWishlistSuccess(response.data!.products ?? []));
    } else {
      emit(GetWishlistError());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(RemoveFromWishlistLoading());
    final success = await WishlistRepo.removeFromWishlist(productId);
    if (success) {
      emit(RemoveFromWishlistSuccess());
      await getWishlist();
    } else {
      emit(RemoveFromWishlistError());
    }
  }
}
