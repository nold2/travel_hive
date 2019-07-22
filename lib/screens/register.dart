import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm>{
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment(-1.0, 0.0),
                  height: queryData.size.height / 3,
                  child: Text(
                    'Your phone Number',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefix: Text('+62 |  ')
                  ),
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Required Input';
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: OutlineButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          Scaffold
                              .of(context)
                              .showSnackBar(
                              SnackBar(content: Text('Processing Data'))
                          );
                        }
                      },
                      child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.black
                          )
                      ),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.black,
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}