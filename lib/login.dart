/*



*/
import 'package:flutter/material.dart';

import 'colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg_login.jpg",
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 150.0),
              Text(
                " Вход",
                style: TextStyle(
                    color: mSurfaceWhite,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Positioned(
            bottom: 170,
            left: 12,
            right: 12,
            top: 230,
            child: Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              elevation: 8.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 70.0),
                  Container(
                    height: 50.0,
                    width: 250.0,
                    alignment: Alignment.center,
                    child: AccentColorOverride(
                      color: mBrown900,
                      child: TextFormField(
                        controller: _usernameController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: mBlack),
                          ),
                          labelText: "Login",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 50.0,
                    width: 250.0,
                    alignment: Alignment.center,
                    child: AccentColorOverride(
                      color: mBrown900,
                      child: TextFormField(
                        controller: _passwordController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: mBlack),
                          ),
                          labelText: "Password",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 37.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        color: mPink100,
                        borderRadius: BorderRadius.circular(25)),
                    child: MaterialButton(
                      color: mPink100,
                      child: Text("Войти"),
                      shape: StadiumBorder(),
                      elevation: 8.0,
                      onPressed: _usernameController.value.text.isNotEmpty &&
                              _passwordController.value.text.isNotEmpty
                          ? _callback
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  void _callback() {
    Navigator.pop(context);
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
