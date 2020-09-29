import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wiki_search/src/model/wiki_image.dart';
import 'package:wiki_search/src/model/wiki_page.dart';
import 'package:wiki_search/src/utils/launch_utils.dart';

class PageItemView extends StatelessWidget {
  final WikiPage page;

  PageItemView(this.page);

  @override
  Widget build(BuildContext context) {
    return _buildImages(context);
  }

  Widget _buildImages(BuildContext context) {
    var h = MediaQuery.of(context).size.height / 10.0;
    var horizontalPadding = MediaQuery.of(context).size.width / 20.0;
    return InkWell(
      onTap: () => LaunchUtils.openWeb(context, page.url),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2, top: 4),
                child: Text("${page.title} (${page.imagesSize} ${tr('pictures')})",
                    textAlign: TextAlign.start, style: Theme.of(context).textTheme.subtitle2),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text("${page.url}",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.black38)),
              ),
              Container(
                height: h,
                child: ListView(
                    addAutomaticKeepAlives: true,
                    scrollDirection: Axis.horizontal,
                    children: page.images.map((image) => _buildImage(context, image, h)).toList()),
              ),
              Divider()
            ],
          )),
    );
  }

  Widget _buildImage(BuildContext context, WikiImage image, double h) {
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          width: h * 1.3,
          child: CachedNetworkImage(imageUrl: image.url),
        ));
  }
}
