import 'package:http/http.dart';
import 'package:wiki_search/src/model/wiki_image.dart';
import 'package:wiki_search/src/model/wiki_page.dart';
import 'package:wiki_search/src/response/images_response.dart';
import 'dart:convert';

import 'package:wiki_search/src/response/pages_response.dart';

class SearchWikiProvider {
  final http = Client();

  Future<List> search(String input) async {
    var pagesResponse = await getPages(input);
    List<WikiPage> pages = List();
    for (var i = 0; i < pagesResponse.items.length; i++) {
      var item = pagesResponse.items[i];
      var imagesResponse = await getImages(pagesResponse.items[i].pageid);
      pages.add(WikiPage("https://en.wikipedia.org/wiki/${item.title.replaceAll(" ", "_")}", item.title,
          imagesResponse.items.map((e) => WikiImage(e.url)).toList()));
    }
    return pages;
  }

  Future<PagesResponse> getPages(String input) async {
    var response = await getHttp("https://en.wikipedia.org/w/api"
        ".php?action=query&format=json&generator=prefixsearch&gpssearch=$input&gpsnamespace=0&gpslimit=10");
    return PagesResponse.fromMap(jsonDecode(response.body));
  }

  Future<ImagesResponse> getImages(int id) async {
    var response = await getHttp("https://en.wikipedia.org/w/api"
        ".php?action=query&pageids=$id&generator=images&prop=imageinfo&iiprop=url&format=json&gimlimit=500");
    return ImagesResponse.fromMap(jsonDecode(response.body));
  }

  Future<Response> getHttp(String url) async {
    return http.get(url, headers: {"Content-Type": "application/json"});
  }
}
