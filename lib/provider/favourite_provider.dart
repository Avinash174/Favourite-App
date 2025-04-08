import 'package:favourite_app/model/item.dart';
import 'package:favourite_app/provider/fovurite_state.dart' show FavouriteState;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItem: [], search: ''));

  void addItem() {
    List<Item> item = [
      Item(name: 'MacBook', id: 1, favourite: true),
      Item(name: 'iPhone', id: 2, favourite: false),
      Item(name: 'Vivo', id: 3, favourite: false),
      Item(name: 'Oppo', id: 4, favourite: false),
      Item(name: 'Mi', id: 5, favourite: true),
      Item(name: 'Google Pixel', id: 6, favourite: true),
    ];
    state = state.copyWith(
      allItems: item.toList(),
      filteredItem: item.toList(),
    );
  }
}
