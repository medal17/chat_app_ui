import 'package:chatappui/models/message_model.dart';
import 'package:chatappui/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _messageComposer(){
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_library),
            onPressed: (){},
          ),
          Expanded(
            child: TextField(
              onChanged: (value){},
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(hintText: 'Type Message...'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: (){},
          ),
        ],
      ),
    );
  }

  buildMessage(Message message, bool isMe){

    final Container msg = Container(
          decoration: isMe? BoxDecoration(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15)),color: Theme.of(context).accentColor):
      BoxDecoration(borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15)),
        color: Color(0xFFFFEFEE),
      ),

      margin: !isMe ? EdgeInsets.only(top: 8.0, bottom: 8.0,):
      EdgeInsets.only(top:8.0, bottom: 8.0,left: 80.0),
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      width: MediaQuery.of(context).size.width *0.75,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.time,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                fontSize: 14.0),),
          SizedBox(height: 5.0,),
          Text(message.text, style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
              fontSize: 16.0),),
        ],
      ),
    );
    if(isMe){
      return  msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked ?
          Icon(Icons.favorite,
            color: Theme.of(context).primaryColor,):
          Icon(Icons.favorite_border,color:Theme.of(context).primaryColor,),
          onPressed: (){
           setState(() {
            // bool like = message.isLiked;
             //message.isLiked ==like ? this.message.isLiked =false : message.isLiked;
           });
          },
        )
      ],
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){},
            icon:Icon(Icons.arrow_back_ios),
        ),
        title: Text(widget.user.name),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon:Icon(Icons.more_horiz),
          )
        ],
        elevation: 0.0,
      ),
      body:GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                      ),
                    color: Colors.white,
                  ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                  child: ListView.builder(
                   // reverse: true,

                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index){
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return buildMessage(message,isMe);

                  }),
                ),

              ),
            ),
            _messageComposer(),
          ],
        ),
      )
    );
  }
}


