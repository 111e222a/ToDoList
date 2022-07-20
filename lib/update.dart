import 'package:cloud_firestore/cloud_firestore.dart';
import 'todo.dart';
import 'package:flutter/material.dart';

class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({required this.docid});
  @override
  _editnoteState createState() => _editnoteState();
}

class _editnoteState extends State<editnote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('title'));
    content = TextEditingController(text: widget.docid.get('content'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.redAccent,
        title:Text('Update TodoList',style:TextStyle(color:Colors.white)),
        centerTitle: true,
        elevation:0,
        
        actions: [
          
          
          
        ],
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal:50,vertical:100),
        
        child: Container(
          child: Column(
            children: [
            
    Text('Update or delete your todo as required.'),
                SizedBox(height:20),
              Container(
                
                child: TextField(
                 controller: title,
                    decoration: InputDecoration(
                      hintText: ' Enter Title',
                     
            
                            enabledBorder:  OutlineInputBorder(
                            //borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder:OutlineInputBorder(borderSide:BorderSide(color:Colors.grey) ),
                            ),
                             
                            cursorColor:Colors.grey[500],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  
                  child: TextField(
                    textAlignVertical:TextAlignVertical.top,
                      controller: content,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: ' Enter Content',
                         enabledBorder:  OutlineInputBorder(
                            //borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder:OutlineInputBorder(borderSide:BorderSide(color:Colors.grey) ),
                            ),
                             
                            cursorColor:Colors.grey[500],
                  ),
                ),
              ),
              SizedBox(height:20),
            
               Row(
                 children: [
                   RaisedButton(
                     color:Colors.redAccent,
                     textColor:Colors.white, 
              onPressed: () {
                    widget.docid.reference.update({
                      'title': title.text,
                      'content': content.text,
                    }).whenComplete(() {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Home()));
                    });
              },
              child: Text("Save"),
            ),
                
            SizedBox(width:20),

            RaisedButton(
              color:Colors.redAccent,
              textColor:Colors.white, 
              onPressed: () {
                widget.docid.reference.delete().whenComplete(() {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Home()));
                });
              },
              child: Text("Delete"),
            ),
            ],),
            ],
          ),
        ),
      ),
    );
  }
}