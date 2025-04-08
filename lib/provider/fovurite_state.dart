import 'package:favourite_app/model/item.dart' show Item;

class FavouriteState {
  final List<Item> allItems;
  final List<Item> filteredItem;
  final String search;

  FavouriteState({
    required this.allItems,
    required this.filteredItem,
    required this.search,
  });

  FavouriteState copyWith({
    List<Item>? allItems,
    List<Item>? filteredItem,
    String? search, // <-- Corrected type here
  }) {
    return FavouriteState(
      allItems: allItems ?? this.allItems,
      filteredItem: filteredItem ?? this.filteredItem,
      search: search ?? this.search,
    );
  }
}
