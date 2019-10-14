import 'package:alcohol_gasoline/widgets/logo.widget.dart';
import 'package:alcohol_gasoline/widgets/submit-form.wodget.dart';
import 'package:alcohol_gasoline/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = 'Compensa utilizar álcool';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          _completed
              ? Success(
                  result: _resultText,
                  reset: reset,
                )
              : SubmitForm(
                  alcCtrl: _alcCtrl,
                  gastCtrl: _gasCtrl,
                  submitFunc: calculate,
                  busy: _busy,
                ),
        ],
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), ''));
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), ''));

    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7)
          _resultText = 'Compensa Utilizar Gasolica';
        else
          _resultText = 'Compensa utilizar Álcool';

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _alcCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}