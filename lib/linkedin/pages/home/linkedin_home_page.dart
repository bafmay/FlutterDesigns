import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/linkedin/models/post.dart';
import 'package:flutter_design/linkedin/pages/home/widgets/header.dart';
import 'package:flutter_design/linkedin/pages/home/widgets/navbar.dart';
import 'package:flutter_design/linkedin/pages/home/widgets/new_post.dart';
import 'package:flutter_design/linkedin/providers/menu_options.dart';
import 'package:flutter_design/linkedin/utils/data_mock.dart';
import 'package:flutter_design/linkedin/utils/linkedin_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Stack(
            children: [
              _Body(),
              NavBar()
            ]
          )
        )
      )
    );
  }
}

class _Body extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuOptionsInfo>(context, listen: false);
    return Positioned.fill(
      child: CustomScrollView(
        controller: provider.controller,
        slivers: [
          Header(),
          NewPost(),
          PostList()
        ]
      )
    );
  }

}

class PostList extends StatelessWidget {
  const PostList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 12,right: 12,top: 15),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_,i) => ItemPost(post: posts[i]),
          childCount: posts.length
        )
      )
    );
  }
}

class ItemPost extends StatelessWidget {
  const ItemPost({Key key,@required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(color: LinkedInColors.white,borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            _HeaderPost(post: post),
            Image.asset(post.photo,fit: BoxFit.cover),
            FooterPost(post: post)
          ],
        )
      )
    );
  }
}

class _HeaderPost extends StatelessWidget {
  const _HeaderPost({Key key,@required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final description = post.description.split(' ');
    final styleDescription =
        Theme.of(context).textTheme.subtitle2.copyWith(color: Color(0xFF107CB6), fontWeight: FontWeight.bold);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(post.user.photo),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              post.user.name,
                              style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black.withOpacity(.6),fontWeight: FontWeight.w700)
                            ),
                            Text(
                              '${post.title} ${post.timeAgo}',
                              style: Theme.of(context).textTheme.button.copyWith(color: Colors.black54)
                            )
                          ]
                        )
                      )
                    ),
                    Icon(Icons.more_horiz_outlined)
                  ]
                ),
                SizedBox(height: 10),
                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: '${description[0]} ',
                    style: styleDescription,
                    children: [
                      TextSpan(
                          text: description.sublist(1, description.length).join(' '),
                          style: styleDescription.copyWith(
                            color: Colors.black.withOpacity(.7),
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                )
              ],
            )
          )
        ]
      )
    );
  }
}

class FooterPost extends StatelessWidget {
  const FooterPost({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemFooterPost(path: 'assets/linkedin/icons/like.svg',text: post.like.toString(),isLike: post.isLikeMe),
          ItemFooterPost(path: 'assets/linkedin/icons/comment.svg',text: post.comment.toString()),
          ItemFooterPost(path: 'assets/linkedin/icons/share.svg',text: 'Share'),
          ItemFooterPost(path: 'assets/linkedin/icons/send.svg',text: 'Send')
        ],
      ),
    );
  }
}

class ItemFooterPost extends StatelessWidget {
  const ItemFooterPost({Key key, this.text, this.path, this.isLike = false}) : super(key: key);

  final String text;
  final String path;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(path,color: isLike ? LinkedInColors.cyan : Colors.black38),
        SizedBox(width: 5),
        Text(text)
      ],
    );
  }
}






