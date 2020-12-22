import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/linkedin/utils/data_mock.dart';
import 'package:flutter_design/linkedin/utils/linkedin_colors.dart';
import 'package:flutter_svg/svg.dart';

class NewPost extends StatelessWidget {
  const NewPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: LinkedInColors.white
          ),
          child: Column(
            children: [
              NewPostInput(),
              Divider(height: 0, thickness: 1, color: Colors.black12),
              NewPostOptions()
            ]
          )
        )
      )
    );
  }
}

class NewPostOptions extends StatelessWidget {
  const NewPostOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: newPostItems.map((e) => Row(
          children: [
            SvgPicture.asset(e.path),
            SizedBox(width: 5),
            Text(e.name,
              style: Theme.of(context).textTheme.caption.copyWith(
                fontWeight: FontWeight.w600, color: Colors.black45
              ))
          ]
        )).toList() 
      )
    );
  }
}

class NewPostInput extends StatelessWidget {
  const NewPostInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: CupertinoTextField(
        placeholder: 'What on your mind?',
        padding: EdgeInsets.only(left: 10),
        prefix: SvgPicture.asset('assets/linkedin/icons/new_post.svg'),
        maxLines: 3,
        minLines: 1,
        decoration: BoxDecoration(),
      ),
    );
  }
}