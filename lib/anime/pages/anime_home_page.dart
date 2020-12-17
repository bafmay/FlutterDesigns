import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/anime/models/anime.dart';
import 'package:flutter_design/anime/models/nav_bar.dart';
import 'package:flutter_design/anime/utils/anime_ui_colors.dart';
import 'package:flutter_design/anime/widgets/sliver_header_delegate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Body(),
            NavBar()
          ],
        ),
      )
    );
  }
}

class NavBar extends StatelessWidget {
  NavBar({Key key}) : super(key: key);

  final _index = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.4,
        decoration: BoxDecoration(
          color: AnimeUiColors.background,
          boxShadow: [
            BoxShadow(
              color: AnimeUiColors.cyan.withOpacity(.45),
              spreadRadius: 7.5,
              blurRadius: 15
            )
          ]
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: List.generate(
            itemsBar.length, 
            (index) => Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (_, value,__) {
                  return GestureDetector(
                    onTap: () => _index.value = index,
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            itemsBar[index].path, 
                            color: (index == value) ? AnimeUiColors.cyan : Colors.grey
                          ),
                          SizedBox(height: 5),
                          Text(
                            itemsBar[index].name,
                            style: Theme.of(context).textTheme.button.copyWith(
                              color: (index == value) ? AnimeUiColors.cyan : Colors.white
                            )
                          )
                        ]
                      ),
                    ),
                  );
                }
              )
            )
          )
        )
      )
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Header(),
        Trends(),
        Recents(),
        Aviable(),
        SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight * 1.4))
      ],
    );
  }
}

class Aviable extends StatelessWidget {
  const Aviable({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(
                'Cowboy Bebop',
                style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 16/9,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/anime/img/cowboy.png',
                      fit: BoxFit.cover
                    )
                  ),
                  Align(
                    child: SvgPicture.asset(
                      'assets/anime/cicons/play.svg',
                      width: 80
                    )
                  )
                ]
              )
            )
          ]
        )
      ),
    );
  }
}

class Recents extends StatelessWidget {
  const Recents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: AspectRatio(
          aspectRatio: 16/6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recently added', 
                  style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )),
              ),
              ListRecents()
            ]
          )
        )
      )
    );
  }
}

class ListRecents extends StatelessWidget {
  const ListRecents({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context,constraints){
          return ListView.builder(
            itemCount: recentData.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20,top: 10),
            itemBuilder: (_,index){
              final anime = recentData[index];
              return Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(anime.poster, fit: BoxFit.cover),
                  ),
                ),
              );  
            }
          );
        }
      )
    );
  }
}

class Trends extends StatelessWidget {
  const Trends({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: AspectRatio(
          aspectRatio: 16/12,
          child: Column(
            children: [
              HeaderTrends(),
              ListTrends()
            ]
          )
        )
      )
    );
  }
}

class ListTrends extends StatelessWidget {
  const ListTrends({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 10,left: 20),
            itemCount: trendsData.length,
            itemBuilder: (_, index) {
              final anime = trendsData[index];
              final style = Theme.of(context).textTheme.button.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600
              );
              return Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .375,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(anime.poster, fit: BoxFit.cover),
                        )
                      ),
                      SizedBox(height: 15),
                      Text(
                        anime.name,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(height: 7.5),
                      Row(
                        children: [
                          //SvgPicture.asset('assets/anime/icons/play.svg'),
                          //SizedBox(width: 5),
                          Text(
                            'Score ${anime.score}',
                            style: style,
                          ),
                          SizedBox(width: 7.5),
                          Text(
                            '# ${anime.score}',
                            style: style.copyWith(color: AnimeUiColors.cyan)
                          )
                        ]
                      )
                    ]
                  )
                )
              );
            }
          );
        }
      )
    );
  }
}

class HeaderTrends extends StatelessWidget {
  const HeaderTrends({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Trends', 
              style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            )
          ),
          Text('View all',
            style: Theme.of(context).textTheme.subtitle2.copyWith(
              color: AnimeUiColors.cyan,
              fontWeight: FontWeight.w700
            )
          )
        ]
      )
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        floating: true,
        delegate: SliverCustomHeaderDelegate(
            minHeight: 60,
            maxHeight: 60,
            child: Container(
              color: AnimeUiColors.background,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            'My Anime Stream',
                            style: Theme.of(context).textTheme.headline6
                            .copyWith(color: AnimeUiColors.cyan),
                          )
                      ),
                      Icon(Icons.search, color: Colors.white, size: 30)
                    ],
                  ),
                  SizedBox(height: 5),
                  Text('What would you like to watch today?',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white))
                ]
              )
            )
        )
    );
  }
}
