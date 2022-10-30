import 'package:equatable/equatable.dart';

/// Holder for the list of paginated data. It holds [items] and [canLoadMore] flag
/// which is usually used by the UI to show the loading indicator at the end of
/// the list, and to as to load more data.
///
/// [idExtractor] must be provided to detect and remove recurring items.
/// [idExtractor] is a method which takes an item an returns it's uniq identifier.
/// This method will compare items ids and remove all existing items from the
/// old items list ([items]).
class PaginationInfo<T> extends Equatable {
  const PaginationInfo({
    required this.items,
    required this.canLoadMore,
    required this.idExtractor,
  });

  final List<T> items;
  final bool canLoadMore;
  final IdExtractor<T> idExtractor;

  PaginationInfo<T> copyWith({
    List<T>? items,
    bool? canLoadMore,
    IdExtractor<T>? idExtractor,
  }) {
    return PaginationInfo(
      items: items ?? this.items,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      idExtractor: idExtractor ?? this.idExtractor,
    );
  }

  /// Adds given [newItems] to the end of the [items] list.
  PaginationInfo<T> addItems(
    List<T> newItems, {
    required bool canLoadMore,
  }) {
    final newItemsIds = newItems.map(idExtractor).toSet();
    final allItems = items.toList()
      ..removeWhere(
        (oldItem) => newItemsIds.contains(idExtractor(oldItem)),
      )
      ..addAll(newItems);

    return copyWith(
      items: allItems,
      canLoadMore: canLoadMore,
    );
  }

  /// Adds given [item] to the end of the [items] list
  /// or updates an old item when [idExtractor] is provided.
  PaginationInfo<T> addItem(
    T item, {
    bool? canLoadMore,
  }) {
    final newItemId = idExtractor(item);
    final existingItemIndex = items.indexWhere(
      (existingItem) => idExtractor(existingItem) == newItemId,
    );

    final allItems = items.toList();
    if (existingItemIndex != -1) {
      allItems[existingItemIndex] = item;
    } else {
      allItems.add(item);
    }

    return copyWith(
      items: allItems,
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }

  /// Removes the item by its [itemId].
  ///
  /// [idExtractor] is used to extract and compare an id of the [items] with the [itemId].
  PaginationInfo<T> removeItem(
    Object itemId, {
    bool? canLoadMore,
  }) {
    return copyWith(
      items: items.toList()
        ..removeWhere(
          (item) => idExtractor(item) == itemId,
        ),
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }

  @override
  List<Object?> get props => [items, canLoadMore];
}

/// Typedef for a method which takes an item an returns it's uniq identifier.
typedef IdExtractor<Item> = Object Function(Item item);
