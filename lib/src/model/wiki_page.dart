import 'package:wiki_search/src/model/wiki_image.dart';

class WikiPage {
  final String url;
  final String title;
  final List<WikiImage> images;

  WikiPage(this.url, this.title, this.images);

  int get imagesSize => images.length;
}
