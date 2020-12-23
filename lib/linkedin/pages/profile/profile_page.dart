import 'package:flutter/material.dart';
import 'package:flutter_design/linkedin/utils/data_mock.dart';
import 'package:flutter_design/linkedin/utils/linkedin_colors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            
            ProfileInfo(),
          ]
        )
      )
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1.copyWith(color: LinkedInColors.white);
    return Container(
    
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(user.photo,height: 90),
        SizedBox(height: 16),
        Text(user.name,style: Theme.of(context).textTheme.headline6.copyWith(color: LinkedInColors.white,fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(user.ocupation,style: style),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on,color: Colors.white),
            Text(user.location, style: style)
          ],
        )
      ],
    )
          );
  }
}
