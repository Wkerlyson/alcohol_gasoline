import 'package:alcohol_gasoline/widgets/input.widget.dart';
import 'package:alcohol_gasoline/widgets/loading-button.widget.dart';
import 'package:alcohol_gasoline/widgets/logo.widget.dart';
import 'package:alcohol_gasoline/widgets/submit-form.wodget.dart';
import 'package:alcohol_gasoline/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          SubmitForm(
            alcCtrl: _alcCtrl,
            gastCtrl: _gasCtrl,
            submitFunc: () {},
            busy: false,
          ),
        ],
      ),
    );
  }
}
