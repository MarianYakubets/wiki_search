import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_search/src/bloc/search/search_bloc.dart';
import 'package:wiki_search/src/repository/search_repository.dart';
import 'package:wiki_search/src/utils/view_utils.dart';
import 'package:wiki_search/src/view/page_item_view.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(RepositoryProvider.of<SearchRepository>(context)), child: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(listener: (context, state) {
      if (state is ErrorSearchState) ViewUtils.showErrorSnackBar(state.msg, context);
    }, child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: _buildAppTitle(context, state),
            elevation: 3.0,
          ),
          body: SafeArea(child: _buildState(state, context)));
    }));
  }

  Widget _buildAppTitle(BuildContext context, SearchState state) {
    _searchQuery.text = state.input;
    return Container(
      constraints: BoxConstraints(maxWidth: 600.0),
      child: TextField(
        controller: _searchQuery,
        cursorColor: Theme.of(context).splashColor,
        onSubmitted: (String text) {
          BlocProvider.of<SearchBloc>(context).add(PerformSearch(input: text));
        },
        style: TextStyle(
          color: Theme.of(context).splashColor,
        ),
        decoration: InputDecoration(
            suffixIcon: (_searchQuery.text.isEmpty
                ? Text("")
                : IconButton(
                    onPressed: () {
                      _searchQuery.clear();
                      BlocProvider.of<SearchBloc>(context).add(ClearSearch());
                    },
                    icon: Icon(Icons.clear, color: Theme.of(context).splashColor),
                  )),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Theme.of(context).splashColor),
            hintText: tr('search'),
            hintStyle: new TextStyle(color: Theme.of(context).disabledColor)),
      ),
    );
  }

  Widget _buildState(SearchState state, BuildContext context) {
    if (state is ResultSearchState) return ListView(children: state.pages.map<Widget>((p) => PageItemView(p)).toList());
    if (state is LoadingSearchState) return Center(child: CircularProgressIndicator());
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(tr('empty_msg')),
    ));
  }
}
