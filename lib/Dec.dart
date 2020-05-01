
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class Dec extends StatefulWidget {

    final  encrypt, decrypt;

    Dec(  this.encrypt, this.decrypt );

  @override
  _DecState createState() => _DecState();
}

class _DecState extends State<Dec> {

     var tempdec = '';


     @override
  void setState(fn) {
        decode(){

        }
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(
              title: new Text("Task"),
              centerTitle: true,
          ),  
            body: new Column(
                children: <Widget>[
                    SizedBox(height: 30.0,),
                    Center(
                        child: new Text("AES Encryption data",style: new TextStyle(fontSize: 20.0),),
                    ),
                    SizedBox(height: 20.0,),
                    Center(
                        child: new Text(widget.encrypt.base16, style: new TextStyle(fontSize: 30.0),),

                    ),
                    SizedBox(height: 30.0),
                    Container(
                        width: 150.0,
                        child: FloatingActionButton(
                            backgroundColor: Colors.teal.shade400,
                            isExtended: true,
                            elevation: 12.0,
                            child: new Text("Decrypt"),
                            onPressed: (){
                                setState(() {
                                   tempdec = widget.decrypt;
                                });
                            },
                        ),
                    ),
                    SizedBox(height: 80.0,),
                    Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: Row(
                            children: <Widget>[
                                new Text("Decrypted Data: ", style:  new TextStyle(fontSize: 20.0),),
                                Text(tempdec, style:  new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                            ],
                        ),
                    )
                ],
            ),
        );
  }


}
