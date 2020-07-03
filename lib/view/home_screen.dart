import 'package:chatappui/models/message_model.dart';
import 'package:chatappui/widget/Category.dart';
import 'package:chatappui/widget/Favourites.dart';
import 'package:chatappui/widget/RecentChats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          iconSize: 30.0,
          color: Colors.white,
          onPressed: (){},
          icon:Icon(Icons.arrow_back),
        ),
        title: Text('Chat',
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold),),
          actions: <Widget>[
        IconButton(
        iconSize: 30.0,
        color: Colors.white,
        onPressed: (){},
        icon:Icon(Icons.search),
        )
          ],
      ),
            body: Column(
              children: <Widget>[
                Container(
                  height: 90.0,
                    color: Colors.blue,
                    child: CategorySelector(),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Column(
                      children: <Widget>[
                         FavouriteContacts(),
                        RecentChats()
                      ],
                    ),
                  ),

                ),
              ],
            ),
    );
  }
}
