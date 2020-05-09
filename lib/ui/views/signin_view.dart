// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';

// VIEW MODEL / MODELS
import 'package:api_dashboard/core/view_models/sign_in_view_model.dart';

// UTILS
import 'package:api_dashboard/ui/utils/theme.dart';
import 'package:api_dashboard/ui/utils/util.dart';
import 'package:api_dashboard/ui/utils/base_view.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignInViewModel>(
      model: SignInViewModel(),
      builder: (context, model, child) => Scaffold(
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
                  Text("Dashboard", style: Theme.of(context).textTheme.headline4),
                  verticalSpaceMedium,
                  Container(
                    width: 400.0,
                    child: Form(
                      key: model.formKey,
                      onChanged: () => setState(() => model.formKey.currentState.validate()),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                            autofocus: true,
                            validator: model.emailValidator,
                          ),
                          verticalSpaceMedium,
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                            autofocus: true,
                            validator: model.passwordValidator,
                          ),
                          verticalSpaceMedium,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                child: Text("Sign in"),
                                onPressed: model.isSubmitEnabled ? model.onSubmitPressed:null,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
