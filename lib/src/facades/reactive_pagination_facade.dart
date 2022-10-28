import 'package:convenient_architecture/src/facades/pagination_info.dart';
import 'package:convenient_architecture/src/facades/reactive_facade_with_default.dart';

/// Facade for the paginated data.
///
/// Take a look at the [PaginationInfo] class.
class ReactivePaginationFacade<T>
    extends ReactiveFacadeWithDefault<PaginationInfo<T>> {
  ReactivePaginationFacade()
      : super(PaginationInfo<T>(items: const [], canLoadMore: false));
}
