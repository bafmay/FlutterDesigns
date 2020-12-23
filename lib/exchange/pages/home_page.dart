import 'package:flutter/material.dart';
import 'package:flutter_design/exchange/utils/exchange_colors.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  final _centerCard = 70.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu_open,color: Colors.white), 
          onPressed: (){}
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today_rounded),
            onPressed: (){}
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: _centerCard / 2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: ExchangeColors.primaryGradient
                      ),
                      child: _TopWidget(),
                    )
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: _centerCard,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: _CenterWidget(),
                    )
                  )
                ],
              )
            ),
            Expanded(
              flex: 3,
              child: _BottomWidget()
            )
          ],
        ),
      
    );
  }
  
  
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Detail of movements',
              style: Theme.of(context).textTheme.headline6
            ),
            _ListItemWidget(icon: Icons.restaurant_menu,title: 'Restaurant Manhattan', date: DateTime(2018,6,10),amount: -170),
            _ListItemWidget(icon: Icons.attach_money,title: 'Deposite Freelance', date: DateTime(2018,6,7),amount: 800),
            _ListItemWidget(icon: Icons.shopping_bag,title: 'Central Market', date: DateTime(2018,6,6),amount: -50),
            _ListItemWidget(icon: Icons.money,title: 'Salary Deposit', date: DateTime(2018,6,1),amount: 4200),
            _ListItemWidget(icon: Icons.restaurant_menu,title: 'Restaurant Manhattan', date: DateTime(2018,6,10),amount: -170),
            _ListItemWidget(icon: Icons.attach_money,title: 'Deposite Freelance', date: DateTime(2018,6,7),amount: 800),
            _ListItemWidget(icon: Icons.shopping_bag,title: 'Central Market', date: DateTime(2018,6,6),amount: -50),
            _ListItemWidget(icon: Icons.money,title: 'Salary Deposit', date: DateTime(2018,6,1),amount: 4200) 
          ],
        )
      )
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  const _ListItemWidget({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.amount,
    @required this.date
  }) : super(key: key);

  final IconData icon;
  final String title;
  final double amount;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final isNegative = amount < 0;
    final amountColor = isNegative ? Colors.red[800] : Colors.green;
    return Card(
      elevation: 3,
      shadowColor: Colors.black87,
      child: ListTile(
        leading: Icon(icon),
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
        title: Text(title),
        subtitle: Text(DateFormat.yMMMd().format(date)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '\$${amount.abs().toStringAsFixed(0)}',
              style: TextStyle(color: amountColor),
            ),
            Icon(isNegative ? Icons.arrow_upward : Icons.arrow_downward,color: amountColor)
          ],
        ),
      )
    );
  }
}

class _CenterWidget extends StatelessWidget {
  const _CenterWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      shadowColor: Colors.black87,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _CenterItem(text: 'Income', amount: 9302),
            _CenterItem(text: 'Expense', amount: -2790)
          ],
        ), 
      ),
    );
  }
}

class _CenterItem extends StatelessWidget {
  const _CenterItem({Key key,this.text,this.amount}) : super(key: key);
  final String text;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final isNegative = amount < 0;
    final amountColor = isNegative ? Colors.red[800] : Colors.green;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
            child: Text(text,style: TextStyle(fontSize: 11)) 
          )
        ),
        Row(
          children: [
            Icon(isNegative ? Icons.arrow_upward : Icons.arrow_downward,color: amountColor),
            SizedBox(width: 5),
            Text(
              '\$${amount.abs().toStringAsFixed(0)}',
              style: TextStyle(color: amountColor,fontSize: 14),
            )
          ]
        )
      ],
    );
  }
}

class _TopWidget extends StatelessWidget {
  const _TopWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Available Balance',
          style: TextStyle(color: Colors.greenAccent,fontSize: 12),
        ),
        Text(
          '\$7,392.00',
          style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white)
        ),
        Text(
          'June 9, 2018',
          style: TextStyle(color: Colors.grey[300],fontSize: 12),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Card(
            elevation: 5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: ExchangeColors.secondaryGradient
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FittedBox(
                      child: Text(
                        '42012 3049 2800 9815',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[300],fontSize: 19)
                      )
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EXPIRE - 02/22',
                          style: TextStyle(color: Colors.white,fontSize: 12),
                        ),
                        Text(
                          'CVC CODE - 230',
                          style: TextStyle(color: Colors.white,fontSize: 12),
                        )
                      ]
                    )
                  ]
                )
              )
            ),
          ),
        )
      ],
    );
  }
}