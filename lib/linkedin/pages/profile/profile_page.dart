import 'package:flutter/material.dart';
import 'package:flutter_design/linkedin/utils/data_mock.dart';
import 'package:flutter_design/linkedin/utils/linkedin_colors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _centerHeight = 80.0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: _ProfileHeader(centerHeight: _centerHeight)
            ),
            Expanded(
              flex: 7, 
              child: SizedBox()
            )
          ]
        ),
      )
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    Key key,@required double centerHeight}) : _centerHeight = centerHeight, super(key: key);

  final double _centerHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: _centerHeight / 2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(user.background),
                fit: BoxFit.cover
              )
            ),
            child: ProfileInfo(paddingCard: _centerHeight)
          )
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: _centerHeight,
          child: SpecsCard()
        )
      ]
    );
  }
}

class SpecsCard extends StatelessWidget {
  const SpecsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _CardItem(label: user.conections,description: 'Connections',),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: VerticalDivider(color: Colors.grey),
            ),
            _CardItem(label: user.profile, description:'Profile Views')
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({Key key,this.label,this.description}) : super(key: key);
  final int label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$label',style: Theme.of(context).textTheme.headline6.copyWith(
          color: Color(0xFF107CB6),fontWeight: FontWeight.bold
        )),
        Text(description)
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key key,this.paddingCard}) : super(key: key);
  final double paddingCard;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1.copyWith(color: LinkedInColors.white);
    return Padding(
      padding: EdgeInsets.only(bottom: paddingCard/2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Image.asset(user.photo, height: 90),
          SizedBox(height: 16),
          Text(
            user.name,
            style: Theme.of(context).textTheme.headline6.copyWith(
                color: LinkedInColors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(user.ocupation, style: style),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Icon(Icons.location_on, color: Colors.white),
              Text(user.location, style: style)
            ]
          )
        ]
      ),
    );
  }
}
