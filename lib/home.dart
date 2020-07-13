import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_task/colors.dart';
import 'package:test_task/error.dart';
import 'package:test_task/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

Future<List<Users>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/users');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Users> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Users>((json) => Users.fromJson(json)).toList();
}

class Users {
  final int albumId;
  final int id;
  final String name;
  final String username;
  final String email;

  Users({this.albumId, this.id, this.name, this.username, this.email});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mSurfaceWhite,
        brightness: Brightness.dark,
        leading: IconButton(
          color: mBlack,
          iconSize: 30,
          icon: Icon(Icons.reply_all),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        title: Text(
          "Пользователи",
          style: TextStyle(
            color: mBlack,
            fontSize: 23.0,
          ),
        ),
      ),
      body: FutureBuilder<List<Users>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? UserList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class UserList extends StatelessWidget {
  final List<Users> photos;

  UserList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 7.0 / 1.5,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return (Row(
          children: <Widget>[
            IconButton(
              iconSize: 45,
              icon: Icon(Icons.account_circle),
              onPressed: () {
                 Navigator.push(
                context, MaterialPageRoute(builder: (context) => ErrorPage()));
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Text(
                  photos[index].name,
                  style: TextStyle(
                    color: mBlack,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  photos[index].email,
                  style: TextStyle(
                    color: mGray,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Surf",
                  style: TextStyle(
                    color: mBlack,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ));
      },
    );
  }
}
