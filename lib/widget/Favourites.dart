import 'package:chatappui/models/message_model.dart';
import 'package:chatappui/view/chat_screen.dart';
import 'package:flutter/material.dart';

class FavouriteContacts  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Favourite Contacts',style: TextStyle(
                  fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.blueGrey,
                ),),
                IconButton(
                  iconSize: 30.0,
                  color: Colors.blueGrey,
                  icon: Icon(
                      Icons.more_horiz
                  ),
                  onPressed: (){},
                )
              ],
            ),
          ),
          Container(
            height: 140.0,

            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favourites.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(
                          builder:(_)=>ChatScreen(user: favourites[index]),
                      ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(favourites[index].pic),
                          ),
                          SizedBox(height: 16.0,),
                          Text(favourites[index].name,
                            style: TextStyle(fontSize: 16.0,color: Colors.blueGrey),),
                        ],
                      ),
                    ),
                  );
            }),
          )
        ],
      ),
    );
  }
}
