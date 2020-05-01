import 'package:encryptdecryptapp/Dec.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/physics.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fieldController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Task"),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[

          SizedBox(
            height: 30.0,
          ),
          Form(
            key: _formKey,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20.0),
                child: new TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'enter a data';
                    }
                    return null;
                  },

                  decoration: InputDecoration(labelText: 'enter the data'),

                  controller: _fieldController,
                ),
              )
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 150.0,
            child: FloatingActionButton(
              backgroundColor: Colors.teal.shade400,
              isExtended: true,
              elevation: 12.0,
              child: new Text("Submit"),
              onPressed: (){
                encryptData();
              },
            ),
          )
        ],
      ),
    );
  }

  void encryptData() {
    if(_formKey.currentState.validate()){

      final plainText = _fieldController.text;
       final  key = encrypt.Key.fromUtf8("my 32 length key");
       final iv = encrypt.IV.fromLength(16);

       final encrypter = encrypt.Encrypter(encrypt.AES(key));

       final encrypted = encrypter.encrypt(plainText, iv: iv);
      final decrypted = encrypter.decrypt(encrypted, iv: iv);


      Navigator.push(context, MaterialPageRoute(builder: (context)=> Dec(encrypted, decrypted)));

//      print(decrypted);
//      print("--------------------------------------------------------------------------------");
//      print(encrypted.base16);

    }

  }
}
