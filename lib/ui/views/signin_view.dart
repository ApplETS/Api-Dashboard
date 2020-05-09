// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';

// UTILS
import 'package:api_dashboard/ui/utils/theme.dart';
import 'package:api_dashboard/ui/utils/util.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplETSTheme.violet,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 100,
                  child: Image.asset('assets/images/black_logo.png'),
                ),
                verticalSpaceMedium,
                Container(
                  width: 400.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    autofocus: true,
                    validator: (value) => "Please retry",
                    onEditingComplete: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
