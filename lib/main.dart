import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'todo.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
void main() async{
  await Firebase.initializeApp(options: FirebaseOptions(
  apiKey: "AIzaSyAEP-V00knRxIZVKPBQwqZs-BGXZOlTEc0",
  authDomain: "chatmodule-64f6e.firebaseapp.com",
  projectId: "chatmodule-64f6e",
  storageBucket: "chatmodule-64f6e.appspot.com",
  messagingSenderId: "324574854053",
  appId: "1:324574854053:web:73288e870142dc7367464c",
  measurementId: "G-ZL7DWL6YQV"
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:SignUp(),
      
    );
  }
}
class SignUp extends StatefulWidget {
  @override
  SignUpState createState() {
    return SignUpState();
  }
}
  CollectionReference ref = FirebaseFirestore.instance.collection('Todo_List');
  final textController_1 = TextEditingController();
  final textController_2 = TextEditingController();
  bool correct=false;
  final textController_3 = TextEditingController();
  final textController = TextEditingController();
  final email = TextEditingController();
  final passX = TextEditingController();
  
class SignUpState extends State<SignUp> {
 

 // CollectionReference ref = FirebaseFirestore.instance.collection('Todo_List');

  String pass="";
  bool password=false;
  
  void GoToLogin()
  {
    
    setState(()
    {
    String text1=textController_2.text;
    String text2=textController_3.text;
    String text3=textController_1.text;
    String text=textController.text;
   
    
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    bool email= regExp.hasMatch(textController_1.text);
    if(text1.isEmpty || text2.isEmpty || text3.isEmpty || text.isEmpty)
    {
      pass="Complete all fields";
    }
    else
    {
    if(text1==text2 && email)
    {
      password=true;
      correct=true;
      pass="Login";
      print(pass);
      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
    }
    if(text1==text2 && !email)
    {
      password=false;
      correct=false;
      pass="Do something , wrong email";
      print(pass);
    }
    if(text1!=text2 && email)
    {
      correct=false;
      password=false;
      pass="Passwords do not match";
      print(pass);
    }
    if(text1!=text2 && !email)
    {
      correct=false;
      password=false;
      pass="Do something , wrong email & pass does not match";
      print(pass);
    }
    }
    });
    
    

  }  
     
   
  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.white,
           appBar: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor:Colors.redAccent,
           title:Text('Sign_Up',style:TextStyle(color:Colors.white)),
           centerTitle: true,
           elevation:0,
           ),
          body: Scrollbar(
          child:  SingleChildScrollView(
          child: Container(
          child: Center(
          child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double v, Widget? child) {
        return Opacity(
          opacity:v,  
          child:child
          
        );
      },
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:50,vertical:150),
              child: Column(
              children: [
                TextField(
                          
                          decoration: InputDecoration(
          
                          border:  OutlineInputBorder(),
          
                          labelText: 'Enter your Username:',
                          labelStyle: TextStyle(color:Colors.grey[500]) ,
          
          
                                    enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color:Colors.grey) ),
                          ),
                          //keyboardType: TextInputType.number,
                          //inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                          //keyboardType: TextInputType.number,
                          //inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly], 
                          cursorColor:Colors.grey[500],
                                 // onChanged: (value) => num =int.parse(value)   , 
                                 controller: textController,
              ),
                SizedBox(height:20),
                TextField(
                          
                          decoration: InputDecoration(
          
                          border:  OutlineInputBorder(),
          
                          labelText: 'Enter your Email:',
                          labelStyle: TextStyle(color:Colors.grey[500]) ,
          
          
                                    enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color:Colors.grey) ),
                          ),
                          
                          cursorColor:Colors.grey[500],
                                 
                                 controller: textController_1,
              ),
                SizedBox(height:20),
                TextField(
                            obscureText:true,
          
                            decoration: InputDecoration(
          
                            border:  OutlineInputBorder(),
          
                            labelText: 'Enter your Password:',
                            labelStyle: TextStyle(color:Colors.grey[500]) ,
          
          
                                      enabledBorder:  OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder:OutlineInputBorder(borderSide:BorderSide(color:Colors.grey) ),
                            ),
                            //keyboardType: TextInputType.number,
                            //inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
          
                            cursorColor:Colors.grey[500],
                                  // onChanged: (value) => num =int.parse(value)   , 
                                  controller: textController_2,
                ),
                SizedBox(height:20),
                TextField(
                          obscureText:true,
                          decoration: InputDecoration(
                          border:  OutlineInputBorder(),
                          labelText: 'ReEnter your password:',
                          //errorText: password? null: 'passwords are not same',
                          labelStyle: TextStyle(color:Colors.grey[500]) ,
          
                                    enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color:Colors.grey) ),
                          ),
                          //keyboardType: TextInputType.number,
                          //inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
          
                          cursorColor:Colors.grey[500],
                                 // onChanged: (value) => num =int.parse(value)   , 
                                 controller: textController_3,
              ),
                SizedBox(height:20),
                RaisedButton(
                          color:Colors.redAccent,
                          textColor:Colors.white,
                          
                          onPressed: () {
                             GoToLogin();
                             if(correct)
                             ref.doc(textController_1.text).set({
                    'Email': textController_1.text,
                    'Password': textController_2.text,});
                          },
                            
                          
                          child: Text('SignUp'),
                        ),
                SizedBox(height:20),
                TextButton(
                          
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                        );
                            
                          },
                            
                          
                          child: Text('Login',
                          
                          style: TextStyle(fontSize:15,color:Colors.black),
                          
                        ),),
                        
                SizedBox(height:20),
                Text('$pass'),
          
              ]),
            )
            ),
          
          )
          )
          )
          )
    );
  }
  }
class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}
class LoginState extends State<Login> {
  
   
  String pass="";
  bool password=false;
 
  void GoToLogin()
  {
  }  
     
  @override

  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.white,
           appBar: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor:Colors.redAccent,
           title:Text('Login',style:TextStyle(color:Colors.white)),
           centerTitle: true,
           elevation:0,
           ),
           body: Scrollbar(
          child:  SingleChildScrollView(
          child: Container(
          child: Center(
         
          child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double v, Widget? child) {
        return Opacity(
          opacity:v,  
          child:child
          
        );
      },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:50,vertical:150),
              child: Column(
              children: [
                TextField(
                          
                          decoration: InputDecoration(
                          
                          border:  OutlineInputBorder(),
          
                          labelText: 'Enter your Email:',
                          labelStyle: TextStyle(color:Colors.grey[500]) ,
          
          
                                    enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color:Colors.grey) ),
                          ),
                          //keyboardType: TextInputType.number,
                          //inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                          //keyboardType: TextInputType.number,
                          //inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly], 
                          cursorColor:Colors.grey[500],
                                 // onChanged: (value) => num =int.parse(value)   , 
                                 controller: email,
              ),
                SizedBox(height:20),
                TextField(
                            obscureText:true,
          
                            decoration: InputDecoration(
          
                            border:  OutlineInputBorder(),
          
                            labelText: 'Enter your Password:',
                            labelStyle: TextStyle(color:Colors.grey[500]) ,
          
          
                                      enabledBorder:  OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder:OutlineInputBorder(borderSide:BorderSide(color:Colors.grey) ),
                            ),
                            //keyboardType: TextInputType.number,
                            //inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
          
                            cursorColor:Colors.grey[500],
                                  // onChanged: (value) => num =int.parse(value)   , 
                                  controller: passX,
                ),
          
                SizedBox(height:20),
                RaisedButton(
                          color:Colors.redAccent,
                          textColor:Colors.white, 
                          onPressed: () {
                            //GoToLogin();
                            ref.doc(email.text).get().then((a){
                              //print(a['Email']+ email.text + passX.text);
                               if(a['Email']==email.text && a['Password']==passX.text)
                               {
                                 print("2");
                                 Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => todo()),
                        );     
                               }
                               
                              
                            });
                          },
                            
                          
                          child: Text('Login'),
                        ),
                SizedBox(height:20),
                 TextButton(
                  
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          
                          child: Text('Not a user yet, SignUp?',
                          style: TextStyle(fontSize:15,color:Colors.black),
                          ),
                        ),
                //Text('$pass'),
          
              ]),
            ),
          )
          )
          )
          )
          )
          
    );
  }
  }