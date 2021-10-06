
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  int selectedValue = 1;

  void createListItems(){
    List<DropdownMenuItem<String>> itemlist = [];

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
            child: DropdownButton<int>(

              value: selectedValue,
              // underline: Container(width: double.infinity,color: Colors.blue[900].withAlpha(50),height: 2,),
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
//                color: Colors.red, //conflict //  error [selectedValue]
                child: Padding(

                  padding: const EdgeInsets.all(4),
                  child: Icon(Icons.attach_money),
                ),
              ),
              items: [
                DropdownMenuItem(
                  child: Text('hello'),
                  value: 1 ,
                ),
                DropdownMenuItem(
                  child: Text('bye'), //Container(child: Center(child: Text('bye')),color: Colors.blueGrey,),
                  value: 2 ,
                ),
                DropdownMenuItem(
                  child: Text('my'),
                  value: 3 ,
                ),
              ],
              onChanged: (val){
                setState(() {
                  selectedValue = val;
                  print(val);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
