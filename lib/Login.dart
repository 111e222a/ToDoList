import 'package:flutter/material.dart';
 
class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final textController_1 = TextEditingController();
  final textController_2 = TextEditingController();
  final textController_3 = TextEditingController();
   
  String pass="";
  bool password=false;
  
  void GoToLogin()
  {
    
    setState(()
    {
    String text1=textController_2.text;
    String text2=textController_3.text;
    String text3=textController_1.text;
   

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    bool email= regExp.hasMatch(textController_1.text);
    if(text1.isEmpty || text2.isEmpty || text3.isEmpty)
    {
      pass="Complete all fields";
    }
    else
    {
    if(text1==text2 && email)
    {
      password=true;
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
      pass="Do something , wrong email";
      print(pass);
    }
    if(text1!=text2 && email)
    {
      password=false;
      pass="Wrong passwords";
      print(pass);
    }
    if(text1!=text2 && !email)
    {
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
          child: Padding(
          padding: const EdgeInsets.all(50.0),
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
            RaisedButton(
                      color:Colors.redAccent,
                      textColor:Colors.white,
                      
                      onPressed: () {
                        GoToLogin();
                      },
                        
                      
                      child: Text('Login'),
                    ),
            SizedBox(height:20),
            
            Text('$pass'),

          ])
          )
          )
          )
          )
          )
    );
  }
  }