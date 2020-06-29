import 'package:flutter/material.dart';

showDialogUtil(BuildContext context,String title, String content,){
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions:<Widget>[
            new FlatButton(child:new Text("OK"), onPressed: (){
              Navigator.of(context).pop();
            },)
          ]
      ));
}

showLoadingDialog(BuildContext context, {String message: 'loadding...'}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          type: MaterialType.transparency,
          child: new Center(
            child: new SizedBox(
              width: 120.0,
              height: 120.0,
              child: new Container(
                decoration: ShapeDecoration(
                  color: Color(0x00ffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(),
                    new Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: new Text(
                        message,
                        style: new TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
