class PagesResponse {
  List<PageItem> items;

  PagesResponse.fromMap(dynamic d) {
    var list = ((d as Map)["query"]["pages"] as Map).values.toList();
    items = list.map((value) {
      var item = value as Map;
      return PageItem(item["pageid"] as int, item["title"] as String);
    }).toList();
  }
}

class PageItem {
  final int pageid;
  final String title;

  PageItem(this.pageid, this.title);
}
