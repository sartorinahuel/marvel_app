import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorCode;
  final String errorMessage;

  const ErrorScreen(this.errorCode, this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Text(errorCode, style: Theme.of(context).textTheme.headline2),
            SizedBox(height: 5),
            Text(errorMessage, style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('Reload', style: Theme.of(context).textTheme.button),
            ),
          ],
        ),
      ),
    );
  }
}
