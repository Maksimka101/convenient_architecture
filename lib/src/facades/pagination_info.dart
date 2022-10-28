import 'package:convenient_architecture/src/helpers/typedefs.dart';
import 'package:equatable/equatable.dart';

/// Holder for the list of paginated data. It holds [items] and [canLoadMore] flag
/// which is usually used by the UI to show the loading indicator at the end of
/// the list, and to as to load more data.
class PaginationInfo<T> extends Equatable {
  const PaginationInfo({
    required this.items,
    required this.canLoadMore,
  });

  final List<T> items;
  final bool canLoadMore;

  PaginationInfo<T> copyWith({
    List<T>? items,
    bool? canLoadMore,
  }) {
    return PaginationInfo(
      items: items ?? this.items,
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }

  /// Adds given [newItems] to the end of the [items] list.
  ///
  /// {@template id_extractor}
  /// [idExtractor] may be provided to remove recurring items.
  /// [idExtractor] is a method which takes an item an returns it's id.
  /// This method will compare items ids and remove all existing items from the
  /// old items list ([items]).
  /// {@endtemplate}
  PaginationInfo<T> addItems<Id>(
    List<T> newItems, {
    required bool canLoadMore,
    Mapper<Id, T>? idExtractor,
  }) {
    if (idExtractor != null) {
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
    } else {
      return copyWith(
        items: items.toList()..addAll(newItems),
        canLoadMore: canLoadMore,
      );
    }
  }

  /// Adds given [item] to the end of the [items] list
  /// or updates an old item when [idExtractor] is provided.
  ///
  /// {@macro id_extractor}
  PaginationInfo<T> addItem<Id>(
    T item, {
    bool? canLoadMore,
    Mapper<Id, T>? idExtractor,
  }) {
    if (idExtractor != null) {
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
    } else {
      return copyWith(
        items: items.toList()..add(item),
        canLoadMore: canLoadMore ?? this.canLoadMore,
      );
    }
  }

  /// Removes the item by its [itemId].
  ///
  /// [idExtractor] is used to extract and compare an id of the [items] with the [itemId].
  PaginationInfo<T> removeItem<Id>(
    Id itemId, {
    required Mapper<Id, T> idExtractor,
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
