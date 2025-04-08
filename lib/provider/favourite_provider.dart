import 'package:favourite_app/provider/fovurite_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_app/model/item.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItem: [], search: ''));

  /// Adds a predefined list of items to the state
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

  /// Filters items based on the search term
  void filterBySearch(String search) {
    state = state.copyWith(
      filteredItem: _filterItems(state.allItems, search),
      search: search,
    );
  }

  /// Filters items based on the favourite option
  void filterByFavourite(String option) {
    state = state.copyWith(
      filteredItem: _favouriteItems(state.allItems, option),
    );
  }

  /// Returns all items or only favourites based on option
  List<Item> _favouriteItems(List<Item> items, String option) {
    if (option == 'All') {
      return items;
    }
    return items.where((item) => item.favourite == true).toList();
  }

  /// Filters items by name matching the search query
  List<Item> _filterItems(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
