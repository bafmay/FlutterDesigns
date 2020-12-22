import 'package:flutter/material.dart';
import 'package:flutter_design/linkedin/providers/menu_options.dart';
import 'package:flutter_design/linkedin/utils/data_mock.dart';
import 'package:flutter_design/linkedin/utils/linkedin_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuOptionsInfo>(context,listen: false);
    return ValueListenableBuilder<bool>(
      valueListenable: provider.show,
      builder: (_, value,__) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: 0,
          right: 0,
          bottom: value ? 0 : -kBottomNavigationBarHeight * 1.25,
          child: Padding(
            padding: EdgeInsets.all(12 ),
            child: Container(
              height: kToolbarHeight,
              decoration: BoxDecoration(
                color: LinkedInColors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: ValueListenableBuilder<int>(
                valueListenable: provider.index,
                builder: (_, value,__) {
                  return Row(
                    children: List.generate(
                      itemsNavBar.length, 
                      (index) {
                        if(index == 2){
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: () => provider.setIndex(index),
                                child: Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: LinkedInColors.cyan),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(itemsNavBar[index],color: Colors.white,width: 15)
                                )
                              )
                            ),
                            flex: 2
                          );
                        }else{
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => provider.setIndex(index),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(itemsNavBar[index],width: 25,color: value == index ? LinkedInColors.cyan : Colors.grey),
                                  if(value == index) CircleAvatar(radius: 2.5,backgroundColor: LinkedInColors.cyan)
                                ]
                              )
                            ),
                            flex: 1
                          );
                        }
                      }
                    ),
                  );
                }
              ),
            ),
          )
        );
      }
    );
  }
}