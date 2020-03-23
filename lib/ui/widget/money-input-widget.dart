import 'package:easy_exchange/redux/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:money/money.dart';

class MoneyInput extends StatefulWidget {

  final double amount;
  final Currency currency;

  const MoneyInput({this.amount, this.currency});

  @override
  _MoneyInputState createState() => _MoneyInputState();
}

class _MoneyInputState extends State<MoneyInput> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return (StoreBuilder<AppState>(
      builder: (context, store) {
      var text = Money.fromDouble(widget.amount, widget.currency).amountAsString;
      return TextField(
          controller: TextEditingController(text: text),
          keyboardType: TextInputType.number,          
          onChanged: (text){
            store.dispatch(ActionSetLeftAmount(double.parse(text)));
          },
      );
      }       
    ));
  }
}