import 'package:chatappui/main.dart';
import 'package:chatappui/models/user_model.dart';

class Message{
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message(this.sender,this.text,this.time, this.isLiked, this.unread);
}


// Current User
final User currentUser=User( 0, 'currentuser', 'images/fine gu.png',);
final User med = User(1,'medallion','images/b.jpg');
final User sirP = User(2,'Sirp','images/sirp.jpg');
final User see = User(3,'Mr Cee','images/c.jpg');
final User mee = User(4,'Gen2soul','images/a.jpg');

//Favourite Contacts

List<User> favourites = [med,sirP,see];

//CHATS ON MyHomePage
List <Message> chats = [

  Message(med, "U re Such a Saint","05:30 AM",true,false),
  Message(mee, "Whats up Friend","6:30 PM",false,false),
  Message(mee, "Whats up Friend","6:30 PM",false,false),
  Message(sirP, "Hw fa asshole","12:30 AM",true,true),
  Message(med, "U re Such a Saint","05:30PM",true,false),
];

//MESSAGES

List <Message> messages =[
  Message(
    med, "hey dude","08:10 AM",true, true
  ),
  Message(
      currentUser, "how re u doing bro","08:15 AM",true, true
  ),
  Message(
      med, "Good, You?","08:16 AM",true, true
  ),
  Message(
      med, "Hope u aint feeling the cold as i am?","08:22 AM",false, true
  ),
  Message(
      currentUser, "at all, not salt bro","08:32 AM",true, false
  ),
  Message(
      med, "Up for C.O.D, liiike now?","08:33 AM",true, true
  ),
  Message(
      currentUser, "Naaaaaa.... got some shit to do","08:34 AM",true, false
  ),
  Message(
      med, "figured aidy","08:33 AM",true, true
  ),
  Message(
      med, "sounds like somebody is scared his ass will be whooped","08:36 AM",true, true
  ),
  Message(
      currentUser, "what?..... forgotten so soon?","08:38 AM",true, false
  ),
  Message(
      currentUser, "Status just changed.... ready to get ur ass kicked","08:39 AM",true, false
  ),

];