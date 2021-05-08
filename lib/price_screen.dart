import 'package:flutter/material.dart';
import 'coin_data.dart';
import "package:flutter/cupertino.dart";
import 'package:vibration/vibration.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {


  String currency=currenciesList[0];
  String rateBTC="?";
  String rateETH="?";
  String rateLTC="?";
  CoinData coindata;

  @override
  void initState() {
    coindata=CoinData();
    getDataAndUpdateUI(0);
  }

  getDataAndUpdateUI(int index) async
  {
    String newrateBTH= await coindata.getCoinData(cryptoName: cryptoList[0],
        currencyName: currenciesList[index]);
    String newrateETH= await coindata.getCoinData(cryptoName: cryptoList[1],
        currencyName: currenciesList[index]);
    String newrateLTC= await coindata.getCoinData(cryptoName: cryptoList[2],
        currencyName: currenciesList[index]);
    setState(() {


      this.rateBTC=newrateBTH;
      this.rateETH=newrateETH;
      this.rateLTC=newrateLTC;
      this.currency=currenciesList[index];


    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[0]} = ${rateBTC} $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[1]} = ${rateETH} $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[2]} = ${rateLTC} $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: /*DropdownButton(
              value: selectedCurrency,
              items: getDropdownMenuList(),
            onChanged: (value){
                setState(() {
                  this.selectedCurrency = value;
                });
              print(value);
            },),*/
            CupertinoPicker(itemExtent: 50.0,
            children: getCutertinoMenuList(),

            onSelectedItemChanged: (index) async{

              Vibration.vibrate(duration: 30);
              getDataAndUpdateUI(index);






            },)
          ),
        ],
      ),

    );
  }
  getCutertinoMenuList() {
    List<Widget> menuListItem=[];
    for(int i=0;i<currenciesList.length;i++)
    {
      menuListItem.add( Center(
        child: Text(currenciesList[i],
        style:TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,),
        ),
      ));

    }
    return menuListItem;
  }
  updateUI({String rate,String currency})
  {

  }
}
