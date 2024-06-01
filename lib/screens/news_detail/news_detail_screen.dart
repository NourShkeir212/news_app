import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/topHeadLineModel.dart';



class NewsDetailsScreen extends StatelessWidget {
  final Articles article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
      ),
      body: Column(
        children: [
          _postImage(),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title!,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(),
                const SizedBox(height: 3,),
                if(article.description != null)
                  Text(
                    'Description',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                        fontSize: 17
                    ),
                  ),
                const SizedBox(height: 5,),
                if(article.description != null)
                  Text(article.description!, maxLines: 30,),
                if(article.description != null)
                  const Divider(),
                if(article.description != null)
                  const SizedBox(height: 5,),
                Text('Sources', style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    fontSize: 17),
                ),
                const SizedBox(height: 5,),
                Text(
                  'Source : ${article.source!.name!}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 3,),
                if(article.author != null)
                  Text(
                    'Author : ${article.author!}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold
                    ),
                  ),
                const SizedBox(height: 5,),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(article.url!));
                  },
                  child: const Text(
                    'Click here to go the source',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _postImage() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: article.urlToImage ?? AppConstants.PLACE_HOLDER_IMAGE,
        errorWidget: (context, url, error) =>
            Image.asset(
              AppConstants.PLACE_HOLDER_IMAGE,
              fit: BoxFit.cover,
            ),
      ),
    );
  }
}


