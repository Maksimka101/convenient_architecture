import 'package:convenient_architecture/src/facades/reactive_facade_with_default.dart';
import 'package:equatable/equatable.dart';

/// Facade for the paginated data.
///
/// Take a look at the [PaginationData] class.
class ReactivePaginationFacade<T>
    extends ReactiveFacadeWithDefault<PaginationData<T>> {
  ReactivePaginationFacade()
      : super(
          const PaginationData(data: [], canLoadMore: false),
        );
}

/// Holder for the list of paginated data. It holds [data] and [canLoadMore] flag
/// which is usually used by the UI to show the loading indicator at the end of
/// the list, and to as to load more data.
class PaginationData<T> extends Equatable {
  const PaginationData({
    required this.data,
    required this.canLoadMore,
  });

  final List<T> data;
  final bool canLoadMore;

  PaginationData<T> copyWith({
    List<T>? data,
    bool? canLoadMore,
  }) {
    return PaginationData(
      data: data ?? this.data,
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }

  @override
  List<Object?> get props => [data, canLoadMore];
}
