import 'package:moviedb_flutter/ui/base/base_bloc.dart';

abstract class BaseLoadMoreRefreshBloc<Item> extends BaseBloc {
  BaseLoadMoreRefreshBloc() {
    _currentPage = _getPreFirstPage();
  }

  final _firstPage = 1;
  final _visibleThreshold = 5;
  final _itemPerPage = 10;
  final itemList = List<Item>();
  var isEmptyList = false;

  var _isRefreshing = false;

  // refresh listener for swipe refresh layout
  Future onRefreshListener() async {
    if (isLoading == true || _isRefreshing == true) return;
    _isRefreshing = true;
    refreshData();
  }

  var isLoadMore = false;
  var _currentPage;
  var _isLastPage = false;

  // scroll listener for recycler view
  void onScrollListener(int index) {
    if (index + getLoadMoreThreshold() >= itemList.length) {
      if (isLoading == true ||
          _isRefreshing == true ||
          isLoadMore == true ||
          _isLastPage == true) return;
      isLoadMore = true;
//      notifyListeners();
      loadMore();
    }
  }

  /// load data
  void loadData(int page);

  /// check first time load data
  bool _isFirst() => _currentPage == _getPreFirstPage() && itemList.isEmpty;

  /// first load
  void firstLoad() {
    if (_isFirst()) {
      showLoading();
      loadData(getFirstPage());
    }
  }

  /// load first page
  void refreshData() {
    loadData(getFirstPage());
  }

  /// load next page
  void loadMore() {
    loadData(_currentPage + 1);
  }

  /// override if first page is not 1
  int getFirstPage() => _firstPage;

  int _getPreFirstPage() => getFirstPage() - 1;

  /// override if need change number visible threshold
  int getLoadMoreThreshold() => _visibleThreshold;

  /// override if need change number item per page
  int getNumberItemPerPage() => _itemPerPage;

  /// reset load more
  void resetLoadMore() {
    _isLastPage = false;
  }

  /// handle load success
  void onLoadSuccess(int page, List<Item> items) {
    _currentPage = page;
    if (_currentPage == getFirstPage()) itemList.clear();
    if (_isRefreshing) resetLoadMore();

    itemList.addAll(items);

    _isLastPage = items.length < getNumberItemPerPage();
    isLoading = false;
    _isRefreshing = false;
    isLoadMore = false;

    _checkEmptyList();

    notifyListeners();
  }

  /// handle load fail
  @override
  void onLoadFail(Exception exception) {
    super.onLoadFail(exception);
    _isRefreshing = false;
    isLoadMore = false;

    _checkEmptyList();

    notifyListeners();
  }

  /// check list is empty
  void _checkEmptyList() {
    isEmptyList = itemList.isEmpty;
  }
}
