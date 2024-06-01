import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../model/topHeadLineModel.dart';
import '../../screens/news_detail/news_detail_screen.dart';
import '../components/components.dart';
import '../constants/constants.dart';

class PostCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String description;

  const PostCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:14),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1),
                color: Colors.grey.shade300,
              ),
            ],
            border: Border.all(width: 1, color: Colors.grey.shade300)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            _postImage(
                imageUrl: imageUrl),
            //Title
            _postInfo(
                title: title,
                date: date,
                description: description,
                context: context
            )
          ],
        ),
      ),
    );
  }

  SizedBox _postImage({required String imageUrl}) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) =>
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>  Image.asset(
          AppConstants.PLACE_HOLDER_IMAGE,
          fit: BoxFit.cover,
        ),
        imageUrl: imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Padding _postInfo({
    required String title,
    required String date,
    required String description,
    required BuildContext context
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge
          ),
          const SizedBox(height: 5,),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    width: 1,
                    color: Colors.grey.shade400,
                ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 2,
                  spreadRadius: 3
                )
              ]
            ),
            child: Text(
                formatDate(date),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall
            ),
          ),
          const SizedBox(height: 5,),
          Text(
              description,
              maxLines: 3,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
          )
        ],
      ),
    );
  }
}

class Posts extends StatelessWidget {
  final NewsModel model;

  const Posts({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
            //  print(model.articles![0].title!);
              navigateTo(context, NewsDetailsScreen(article: model.articles![index]));
            },
            child: PostCard(
                imageUrl: model.articles![index].urlToImage ?? "",
                title: model.articles![index].title ?? "",
                date: model.articles![index].publishedAt ?? "",
                description: model.articles![index].description ?? ""
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: model.articles!.length
    );
  }
}


class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height:200,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppConstants.NO_DATA_FOUND_IMAGE)
                )
            ),
          ),
          const SizedBox(height: 10,),
          const Text('There is no news to show',style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }
}