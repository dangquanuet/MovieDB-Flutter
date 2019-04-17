class BaseListResponse<Item> {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Item> results;

  BaseListResponse.fromJson(Map<String, dynamic> map)
      : page = map['page'],
        totalResults = map['total_results'],
        totalPages = map['total_pages'],
        results = map['results'];
}
