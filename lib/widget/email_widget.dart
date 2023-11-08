import 'package:email_app/model/backend.dart';
import 'package:email_app/model/email.dart';
import 'package:email_app/screens/DetailScreen.dart';
import 'package:flutter/material.dart';

class EmailWidget extends StatefulWidget {
  final Email email;

  const EmailWidget({Key? key, required this.email}): super(key: key);

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  double containerWidth = 200.0;
  Color containerColor = Colors.blue;
  Color iconColor = Colors.green;

  void changeIconColor(){
    setState(() {
      iconColor = Colors.red;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.email.id.toString()),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction){
        Backend().deleteEmail(widget.email.id);
      },
      child: GestureDetector(
        onTap: () {
          Backend().markEmailAsRead(widget.email.id);
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> DetailScreen(email: widget.email,)));
          changeIconColor();
        },
        onLongPress: (){
          Backend().markEmailAsRead(widget.email.id);
          changeIconColor();
        },
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.mail, color: iconColor,),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text(widget.email.dateTime.toString(),),
                        Text(widget.email.from, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.email.subject)
                      ],
                    )
                  ]
                ),

          ),
        ),
      ),
      /*onTap: () {
        Backend().markEmailAsRead(widget.email.id);
        Navigator.push(context, 
        MaterialPageRoute(builder: (context)=> DetailScreen(email: widget.email,)));
        changeIconColor();
      },
      onLongPress: (){
        Backend().markEmailAsRead(widget.email.id);
        changeIconColor();
      },
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.mail, color: iconColor,),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Text(widget.email.dateTime.toString(),),
                      Text(widget.email.from, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.email.subject)
                    ],
                  )
                  
                ]
              ),
            /*     */
        ),
      ),*/
    );
  }
}