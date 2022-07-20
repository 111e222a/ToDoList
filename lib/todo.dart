import 'package:cloud_firestore/cloud_firestore.dart';
import 'add.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'update.dart';
void main() async {
  await Firebase.initializeApp(options: FirebaseOptions(
  apiKey: "AIzaSyAEP-V00knRxIZVKPBQwqZs-BGXZOlTEc0",
  authDomain: "chatmodule-64f6e.firebaseapp.com",
  projectId: "chatmodule-64f6e",
  storageBucket: "chatmodule-64f6e.appspot.com",
  messagingSenderId: "324574854053",
  appId: "1:324574854053:web:73288e870142dc7367464c",
  measurementId: "G-ZL7DWL6YQV"
  ));
  runApp(todo());
}
class todo extends StatefulWidget {
  @override
  _todoState createState() => _todoState();
}
 int i=0;
void initState()
{
 
}
List<Color>color=[Colors.orange,Colors.redAccent,Colors.teal];
class _todoState extends State<todo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,

      title: "Todo List",
      
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String str=textController.text;

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Todo_List').doc(email.text).collection('todoList').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.redAccent,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => addnote()));
        },
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(
                                  color:Colors.white,
                                  
                                ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.redAccent,
        title:Text('Todo_List',style:TextStyle(color:Colors.white)),
        centerTitle: true,
        elevation:0,
       
      ),
      body: 
       StreamBuilder(
          
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color:Colors.redAccent,
                ),
                
              );
            }
      
            return 
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                editnote(docid: snapshot.data!.docs[index]),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                         
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 3,
                              right: 3,
                            ),
                            child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double v, Widget? child) {
        return Opacity(
          opacity:v,  
          child:Padding(
            padding:EdgeInsets.all(v*7),
            child:child
          )
          
        );
      },
                                child: Card(   
                                //tileColor:Colors.redAccent,
                              
                                    elevation: 8,
                                    shadowColor: i>2? color[i=0]:color[i++],
                                    
                                    
                               child:ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: Colors.white
                                  ),
                                ),
                               
                                title: Text(
                                  snapshot.data!.docChanges[index].doc['title'],
                                  style: TextStyle(
                                    fontSize: 25,
                                    color:Colors.black87,
                                  ),
                                ),
                                subtitle: Text(
                                  snapshot.data!.docChanges[index].doc['content'],
                                  style: TextStyle(
                                    color:Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                              ),
                                                      ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            
            );
          },
        ),
      
    );
  }
}