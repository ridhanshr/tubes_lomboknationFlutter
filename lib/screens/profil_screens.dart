import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_lomboknation/auth_services.dart';

class profilePages extends StatelessWidget {
  const profilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: Provider.of<authServices>(context, listen: false)
                .getCurrentUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return displayUserInformation(context, snapshot);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}

// display user information
Widget displayUserInformation(BuildContext context, AsyncSnapshot snapshot) {
  return Container(
    child: Column(
      children: <Widget>[
        Text(
          'User Information',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Email: ${snapshot.data.email}',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'UID: ${snapshot.data.uid}',
          style: TextStyle(fontSize: 20),
        ),
        RaisedButton(
          child: Text('Sign Out'),
          onPressed: () {
            Provider.of<authServices>(context, listen: false).signOut();
          },
        ),
      ],
    ),
  );
}

Widget showSignOut(context) {
  return RaisedButton(
    child: Text("Sign Out"),
    onPressed: () {
      Provider.of<authServices>(context, listen: false).signOut();
    },
  );
}
