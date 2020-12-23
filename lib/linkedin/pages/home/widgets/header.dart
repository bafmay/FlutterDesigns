import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/linkedin/pages/profile/profile_page.dart';
import 'package:flutter_design/linkedin/utils/data_mock.dart';
import 'package:flutter_design/linkedin/utils/linkedin_colors.dart';
import 'package:flutter_design/widgets/sliver_header_delegate.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: 80,
        maxHeight: 80,
        child: Container(
          color: LinkedInColors.background,
          child: Row(
            children: [
              PhotoUser(),
              Search(),
              NewMessage()
            ]
          ),
        )
      )
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: LinkedInColors.white,
            borderRadius: BorderRadius.circular(7.5)
          ),
          placeholder: 'Search',
          placeholderStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.black26
          ),
          prefix: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.search, color: Colors.black26)
          )
        ),
      )
    );
  }
}

class NewMessage extends StatelessWidget {
  const NewMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          color: LinkedInColors.white
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/linkedin/icons/message.svg'),
      ),
    );
  }
}

class PhotoUser extends StatelessWidget {
  const PhotoUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Image.asset(user.photo,height: 40)
      )
    );
  }

  _onTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
  }
}