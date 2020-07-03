import 'package:chatappui/models/message_model.dart';
import 'package:chatappui/view/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index){
                final chat = chats[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_)=>ChatScreen(
                          user: chat.sender,
                        )
                    ),);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                      color: chat.unread ? Color(0xFFFFEFEE): Colors.white,
                    ),

                    margin: EdgeInsets.only(left: 5.0,right: 20.0,bottom: 5.0,top: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 35.0,
                              backgroundImage: AssetImage(chat.sender.pic),
                            ),
                            SizedBox(width: 10.0,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(chats[index].sender.name,
                                  style: TextStyle(color: Colors.grey,
                                      fontSize: 15,
                                  fontWeight: FontWeight.bold),),

                                SizedBox(height: 5.0,),
                                Text(chat.text,
                                    style: TextStyle(color: Colors.blueGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(chat.time,
                              style: TextStyle(color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: 5.0,),
                            chat.unread ? Container(
                              height: 20.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: Alignment.center,
                                child: Text('New',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),)
                            ): Text(''),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
