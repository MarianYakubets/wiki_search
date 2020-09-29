class ImagesResponse {
  List<ImageItem> items;

  ImagesResponse.fromMap(dynamic d) {
    var list = ((d as Map)["query"]["pages"] as Map).values.toList();
    items = list.map((value) {
      var item = value as Map;
      return ImageItem((item["imageinfo"][0] as Map)["url"]);
    }).toList()
      ..removeWhere((element) => element.url.endsWith(".svg"));
  }
}

class ImageItem {
  final String url;

  ImageItem(this.url);
}
