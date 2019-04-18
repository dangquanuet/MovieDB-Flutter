import 'package:moviedb_flutter/data/repositories/repository.dart';
import 'package:moviedb_flutter/ui/base/base_bloc.dart';
import 'package:moviedb_flutter/utils/constants.dart';

abstract class BaseLoadMoreRefreshBloc<Item> extends BaseBloc<List<Item>> {
  BaseLoadMoreRefreshBloc() {
    currentPage = _getPreFirstPage();
  }

  var isRefreshing = false;

  Future onRefreshListener() async {
    if (isLoading == true || isRefreshing == true) return;
    isRefreshing = true;
    refreshData();
  }

  var isLoadMore = false;
  var currentPage = 0;
  var isLastPage = false;

  void onScrollListener(int index) {
    if (index + getLoadMoreThreshold() >= listItem.length) {
      if (isLoading == true ||
          isRefreshing == true ||
          isLoadMore == true ||
          isLastPage == true) return;
      isLoadMore = true;
      loadMore();
    }
  }

  final listItem = List<Item>();
  var isEmptyList = false;

  final repository = Repository();

  void loadData(int page);

  bool _isFirst() => currentPage == _getPreFirstPage() && listItem.isEmpty;

  void firstLoad() {
    if (_isFirst()) {
      isLoading = true;
      loadData(getFirstPage());
    }
  }

  void refreshData() {
    loadData(getFirstPage());
  }

  void loadMore() {
    loadData(currentPage + 1);
  }

  // override if first page is not 1
  int getFirstPage() => Constants.DEFAULT_FIRST_PAGE;

  int _getPreFirstPage() => getFirstPage() - 1;

  // override if need change number visible threshold
  int getLoadMoreThreshold() => Constants.DEFAULT_NUM_VISIBLE_THRESHOLD;

  // override if need change number item per page
  int getNumberItemPerPage() => Constants.DEFAULT_ITEM_PER_PAGE;

  void resetLoadMore() {
    isLastPage = false;
  }

  void onLoadSuccess(int page, List<Item> items) {
    currentPage = page;
    if (currentPage == getFirstPage()) listItem.clear();
    if (isRefreshing) resetLoadMore();

    listItem.addAll(items);
    dataFetcher.sink.add(listItem);

    isLastPage = items.length < getNumberItemPerPage();
    isLoading = false;
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
