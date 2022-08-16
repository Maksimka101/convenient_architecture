import 'package:convenient_architecture/src/facades/reactive_facade_with_default.dart';
import 'package:equatable/equatable.dart';

class ReactivePaginationFacade<T>
    extends ReactiveFacadeWithDefault<PaginationData<T>> {
  ReactivePaginationFacade()
      : super(const PaginationData(data: [], canLoadMore: false));
}

class PaginationData<T> extends Equatable {
  const PaginationData({
    required this.data,
    required this.canLoadMore,
  });

  final List<T> data;
  final bool canLoadMore;

  @override
  List<Object?> get props => [data, canLoadMore];
}
