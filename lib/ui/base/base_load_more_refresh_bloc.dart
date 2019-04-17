import 'package:moviedb_flutter/ui/base/base_bloc.dart';
import 'package:moviedb_flutter/utils/constants.dart';

abstract class BaseLoadMoreRefreshBloc<Item> extends BaseBloc<Item> {
  var isRefreshing = false;
  final onRefreshListener = {
    // TODO
    /*if (isLoading.value == true
    || isRefreshing.value == true
    ) return@OnRefreshListener
    isRefreshing.value = true
    refreshData()*/
  };

  var isLoadMore = false;
  var currentPage = Constants.DEFAULT_FIRST_PAGE - 1;
  var isLastPage = false;
  final onScrollListener = {
    // TODO
    /*if (isLoading.value == true
    || isRefreshing.value == true
    || isLoadMore.value == true
    || isLastPage.value == true
    ) return
    isLoadMore.value = true
    loadMore()*/
  };

  final listItem = List<Item>();
  var isEmptyList = false;

  void loadData(int page);

  bool _isFirst() {
    return currentPage == _getPreFirstPage() && listItem.isEmpty;
  }

  void firstLoad() {
    if (_isFirst()) {
      isLoading.sink.add(true);
      loadData(getFirstPage());
    }
  }

  void refreshData() {
    loadData(getFirstPage());
  }

  Future<bool> loadMore() async {
    loadData(currentPage + 1);
    return true;
  }

  // override if first page is not 1
  int getFirstPage() {
    return Constants.DEFAULT_FIRST_PAGE;
  }

  int _getPreFirstPage() {
    return getFirstPage() - 1;
  }

  // override if need change number visible threshold
  int getLoadMoreThreshold() {
    return Constants.DEFAULT_NUM_VISIBLE_THRESHOLD;
  }

  // override if need change number item per page
  int getNumberItemPerPage() {
    return Constants.DEFAULT_ITEM_PER_PAGE;
  }

  void resetLoadMore() {
    isLastPage = false;
  }

  void onLoadSuccess(int page, List<Item> items) {
    currentPage = page;
    if (currentPage == getFirstPage()) listItem.clear();
    if (isRefreshing) resetLoadMore();

    listItem.addAll(items);

    isLastPage = items.length < getNumberItemPerPage();
    isLoading.sink.add(false);
    isRefreshing = false;
    isLoadMore = false;

    _checkEmptyList();
  }

  @override
  void onLoadFail() {
    super.onLoadFail();
    isRefreshing = false;
    isLoadMore = false;

    _checkEmptyList();
  }

  void _checkEmptyList() {
    isEmptyList = listItem.isEmpty;
  }
}
