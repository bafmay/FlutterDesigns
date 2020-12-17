import 'package:flutter/material.dart';
import 'package:flutter_design/design_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Designs')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: optionsData.length,
          itemBuilder: (_, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () => _handleToPage(context, optionsData[index].destWidget),
                    child: Text(
                      optionsData[index].option,
                      style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white
                      ) 
                    ),
                    color: Theme.of(context).primaryColor
                  ) 
                ),
                SizedBox(height: 20)
              ]
            );
          }
        )
      )
    );
  }

  void _handleToPage(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => child));
  }
}
