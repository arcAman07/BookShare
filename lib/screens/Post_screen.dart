import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  var url = Uri.parse('http://10.0.2.2:3000/books');
  String title = "";
  String content = "";
  double rating = 0.0;
  bool isItAvailable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        titleSpacing: 50,
        title: Text('Loan a Book',
          style: TextStyle(
            fontSize: 30,
            color: Colors.deepPurple,
          ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              'Title of the Book',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height:10),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
            onChanged: (value) {
              //Do something with the user input.
              title = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter the title',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(height:40 ),
          Center(
            child: Text(
              'Content of the Book',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height:10),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
            onChanged: (value) {
              //Do something with the user input.
              content = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter the type of content',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Text(
              'Rating of the Book',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height:10),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
            onChanged: (value) {
              //Do something with the user input.
              rating = double.parse(value);
            },
            decoration: InputDecoration(
              hintText: 'Enter the rating',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Text(
              'Willing to be purchased',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height:10),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
            onChanged: (value) {
              //Do something with the user input.
              bool b = value.toLowerCase() == 'true';
              isItAvailable = b;
            },
            decoration: InputDecoration(
              hintText: 'True/False',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(height:40),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () async {
                  // var response = await http.post(url, body: {"title": title, "content": content,
                  //   "isItAvailable":isItAvailable,"rating":rating},
                  // options:Options(contentType:Headers.formUrlEncodedType));
                  // print('Response status: ${response.statusCode}');
                  // print('Response body: ${response.body}');
                  //
                  // print(await http.read(Uri.parse('http://10.0.2.2:3000/books')));
                  void getHttp() async {
                    try {
                      var response = await Dio().get('http://www.google.com');
                      print(response);
                    } catch (e) {
                      print(e);
                    }
                  }


                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Loan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )

        ],
      ),

    );
  }
}

