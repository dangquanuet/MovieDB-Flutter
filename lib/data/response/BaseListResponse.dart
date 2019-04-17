class BaseListResponse<Item> {
  var page;
  int totalResults;
  int totalPages;
  List<Item> results;

  BaseListResponse.fromJson(Map<String, dynamic> map)
      : page = map['page'],
        totalResults = map['total_results'],
        totalPages = map['total_pages'],
        results = map['results'];
}
