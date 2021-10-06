import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = currenciesList.first;

  List<DropdownMenuItem<String>> createListItems() {
    List<DropdownMenuItem<String>> itemList = [];

    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text('$currency'),
        value: currency,
      );
      itemList.add(item);

      //TODO: IF WE PUT RETURN HERE JUMPS OUT OF FUNC

    }
    return itemList;
  }

  List<Text> createPickerItems() {
    List<Text> itemList = [];
    for (String currency in currenciesList) {
      var item = Text(
        '$currency',
        style: TextStyle(color: Colors.white),
      );
      itemList.add(item);
    }
    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32.0,
              backgroundColor: Colors.lightBlue,
              onSelectedItemChanged: (idx) {
                print(idx);
              },
              children: createPickerItems(),
            ),
          ),
          //end of ICon
        ],
      ),
    );
  }
}
//=========================================================

//
//DropdownButton<String>(
//value: selectedValue,
//// underline: Container(width: double.infinity,color: Colors.blue[900].withAlpha(50),height: 2,),
//icon: Container(
//decoration: BoxDecoration(
//color: Colors.blue,
//borderRadius: BorderRadius.all(Radius.circular(10)),
//),
////                color: Colors.red, //conflict //  error [selectedValue]
//child: Padding(
//padding: const EdgeInsets.all(4),
//child: Icon(Icons.attach_money),
//),
//),
//items: createListItems(),
//onChanged: (val) {
//setState(() {
//selectedValue = val;
//print(val);
//});
//},
//),
