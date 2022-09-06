import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Visual extends StatefulWidget {
  final String ipek;
  const Visual({Key? key, required this.ipek}) : super(key: key);

  @override
  State<Visual> createState() => _VisualState();
}

class _VisualState extends State<Visual> {
  var dio = Dio();
  late Timer _periodicT;
  var temp1 = '';
  var typOdzysk = '';

  void initState() {
    dio.options.receiveTimeout = 1000;
    dio.options.connectTimeout = 1000;
    dio.options.sendTimeout = 1000;

    data_vis();
    super.initState();
    _periodicT = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await data_vis();
      print('http');
    });
  }

  @override
  void dispose() {
    _periodicT.cancel();
    super.dispose();
  }

  Future<void> data_vis() async {
    try {
      final response = await Future.wait([
        dio.get('http://' + widget.ipek + '/getvar.csv?name=SupplyTemp.Val',
            options: Options(headers: {"Connection": "keep-alive"})),
        dio.get('http://' + widget.ipek + '/getvar.csv?name=HeatExchgTyp',
            options: Options(headers: {"Connection": "keep-alive"})),
      ]);
      print(response[1].toString().length);
      var temp1res = response[0].toString();
      setState(() {
        temp1 = temp1res[98] +
            temp1res[99] +
            temp1res[100] +
            temp1res[101] +
            temp1res[102] +
            ' oC ';
      });
      var odzysk2res = response[1].toString();
      print(odzysk2res);
      setState(() {
        typOdzysk = odzysk2res[120];
      });
      print(typOdzysk);
    } on DioError catch (e) {
      print(e);
    }
  }

  String setAHUtype() {
    if (typOdzysk == '0') {
      return 'assets/PRCS.png';
    } else if (typOdzysk == '1') {
      return 'assets/RRCS.png';
    } else {
      return 'assets/PRCS.png';
    }
  }
  void offAHU() async {
    var ipek = widget.ipek;
    http.get(Uri.parse('http://' + ipek + '/setvar.csv?Scheduler_OnOffUnit.KeybOnOff=0'));
  }
  void onAHU() async {
    var ipek = widget.ipek;
    http.get(Uri.parse('http://' + ipek + '/setvar.csv?Scheduler_OnOffUnit.KeybOnOff=1'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Visualization ' + widget.ipek),
        ),
        body: Center(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(6.0),
                  child: Image(
                    image: AssetImage(setAHUtype()),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 146.0, left: 290.0),
                  child:Text(temp1),
                ),
              ],
            ),
            ElevatedButton(onPressed: onAHU, child: const Text('ON')),
            ElevatedButton(onPressed: offAHU, child: const Text('OFF'))
          ]),
        ),
      ),
    );
  }
}
