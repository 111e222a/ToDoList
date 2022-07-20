import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'todo.dart';
class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  CollectionReference dataRef = ref.doc(email.text).collection('todoList');
  final String str=email.text;
  void incI()
{
  i++;
  if(i>5)
  i=0;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.redAccent,
        title:Text('Add_Todo',style:TextStyle(color:Colors.white)),
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
            Text('Add your todo, enter title and content'),
                SizedBox(height:20),
              
              Container(
               // decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
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
                  
                  //decoration: BoxDecoration(border: Border.all(color:Colors.grey)),
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

              RaisedButton(
            color:Colors.redAccent,
            textColor:Colors.white,
            onPressed: () {
              incI();
              dataRef.add({
                'title': title.text,
                'content': content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(   
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },           
            child: Text(
              "Save",
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}