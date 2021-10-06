import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
//import 'services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = currenciesList.first;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> itemList = [];

    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text('$currency'),
        value: currency,
      );
      itemList.add(item);
    }

    return DropdownButton<String>(
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
      items: itemList,
      onChanged: (val) {
        setState(() {
          selectedValue = val;
          print(val);
        });
        if (fetchedBtcPrice == null) {
          setState(() {
            fetchedBtcPrice = ' ???';
          });
        }
        allCryptoRequest();
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> itemList = [];
    for (String currency in currenciesList) {
      var item = Text(
        '$currency',
        style: TextStyle(color: Colors.white),
      );
      itemList.add(item);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (idx) {
        print(idx);
        setState(() {
          selectedValue = currenciesList[idx];
        });
        if (fetchedBtcPrice == null) {
          setState(() {
            fetchedBtcPrice = ' ???';
          });
        }
        allCryptoRequest();
      },
      children: itemList,
    );
  }

  Widget showWaitingSpinner() {
    return fetchedBtcPrice != null
        ? Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SpinKitPouringHourglass(
                color: Colors.white,
                size: 50,
              ),
            ))
        : Icon(Icons.sentiment_very_dissatisfied);
  }

  @override
  void initState() {
    super.initState();
    allCryptoRequest();
  }

  void allCryptoRequest() async {
    CoinData coinData =CoinData();
    var data = await coinData.requestCoinsPrice(selectedCurrency: selectedValue);
    print('init');
    String tempBTC = data['BTC'];
    String tempLTC = data['LTC'];
    String tempETH = data['ETH'];
    //TODO : the  await cant be used in the SET STATE method cuz it makes it return a FUTURE it breaks it so it must be called after the await NEXT LINE MAN AFTER AWAIT
    setState(() {
      fetchedBtcPrice = tempBTC;
      fetchedLTCPrice = tempLTC;
      fetchedETHPrice = tempETH;
    });
    print(fetchedBtcPrice);
  }

  String fetchedBtcPrice = ' ???';
  String fetchedLTCPrice = ' ???';
  String fetchedETHPrice = ' ???';

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
          Column(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          fetchedBtcPrice != null
                              ? '1 BTC = $fetchedBtcPrice $selectedValue'
                              : 'network problems ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        showWaitingSpinner(),
                      ],
                    ),
                  ),
                ),
              ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          fetchedBtcPrice != null
                              ? '1 LTC = $fetchedLTCPrice $selectedValue'
                              : 'network problems ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        showWaitingSpinner(),
                      ],
                    ),
                  ),
                ),
              ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          fetchedBtcPrice != null
                              ? '1 ETH = $fetchedETHPrice $selectedValue'
                              : 'network problems ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        showWaitingSpinner(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidDropdown(),
          ),
          //end of ICon
        ],
      ),
    );
  }
}
