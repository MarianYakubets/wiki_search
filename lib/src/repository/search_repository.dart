
import 'package:wiki_search/src/provider/search_wiki_provider.dart';

class SearchRepository {
  var searchProvider = SearchWikiProvider();

  Future<List> search(String input) async {
    return searchProvider.search(input);
  }
}
