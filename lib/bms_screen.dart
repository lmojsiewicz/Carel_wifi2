import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:async';
import 'visual.dart';
import 'pgd.dart';

class BMS_screen extends StatefulWidget {
  final String ip1;
  final String ip2;
  final String ip3;
  final String ip4;
  final String ip5;
  const BMS_screen(
      {Key? key,
      required this.ip1,
      required this.ip2,
      required this.ip3,
      required this.ip4,
      required this.ip5})
      : super(key: key);

  @override
  State<BMS_screen> createState() => _BMS_screenState();
}

class _BMS_screenState extends State<BMS_screen> {
  var dio = Dio();
  late Timer _periodicT;
  var temp1 = '';
  var temp2 = '';
  var temp3 = '';
  var temp4 = '';
  var temp5 = '';

  @override
  void initState() {
    dio.options.receiveTimeout = 1000;
    dio.options.connectTimeout = 1000;
    dio.options.sendTimeout = 1000;

    data_bms();
    super.initState();
    _periodicT = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await data_bms();
      print('http');
    });
  }

  @override
  void dispose() {
    _periodicT.cancel();
    super.dispose();
  }

  Future<void> data_bms() async {
    try {
      final response = await Future.wait([
        dio.get('http://' + widget.ip1 + '/getvar.csv?name=SupplyTemp.Val',
            options: Options(headers: {"Connection": "keep-alive"})),
        dio.get('http://' + widget.ip2 + '/getvar.csv?name=SupplyTemp.Val',
            options: Options(headers: {"Connection": "keep-alive"})),
        dio.get('http://' + widget.ip3 + '/getvar.csv?name=SupplyTemp.Val',
            options: Options(headers: {"Connection": "keep-alive"})),
        dio.get('http://' + widget.ip4 + '/getvar.csv?name=SupplyTemp.Val',
            options: Options(headers: {"Connection": "keep-alive"})),
        dio.get('http://' + widget.ip5 + '/getvar.csv?name=SupplyTemp.Val',
            options: Options(headers: {"Connection": "keep-alive"})),
      ]);
      print(response[0].toString().length);
      var temp1res = response[0].toString();
      setState(() {
        temp1 = temp1res[98] +
            temp1res[99] +
            temp1res[100] +
            temp1res[101] +
            temp1res[102] +
            ' oC ';
      });
      var temp2res = response[1].toString();
      setState(() {
        temp2 = temp2res[98] +
            temp2res[99] +
            temp2res[100] +
            temp2res[101] +
            temp2res[102] +
            ' oC ';
      });
      var temp3res = response[2].toString();
      setState(() {
        temp3 = temp3res[98] +
            temp3res[99] +
            temp3res[100] +
            temp3res[101] +
            temp3res[102] +
            ' oC ';
      });
      var temp4res = response[3].toString();
      setState(() {
        temp4 = temp4res[98] +
            temp4res[99] +
            temp4res[100] +
            temp4res[101] +
            temp4res[102] +
            ' oC ';
      });
      var temp5res = response[4].toString();
      setState(() {
        temp5 = temp5res[98] +
            temp5res[99] +
            temp5res[100] +
            temp5res[101] +
            temp5res[102] +
            ' oC ';
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Text(temp1),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Visual(ipek: widget.ip1)),
                      );
                    },
                    child: Text('Visualization'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewApp(ip: widget.ip1)),
                      );
                    },
                    child: const Text('PGD1'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(temp2),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Visual(ipek: widget.ip2)),
                      );
                    },
                    child: Text('Visualization'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewApp(ip: widget.ip2)),
                      );
                    },
                    child: const Text('PGD2'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(temp3),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Visual(ipek: widget.ip3)),
                      );
                    },
                    child: Text('Visualization'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewApp(ip: widget.ip3)),
                      );
                    },
                    child: const Text('PGD3'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(temp4),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Visual(ipek: widget.ip4)),
                      );
                    },
                    child: Text('Visualization'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewApp(ip: widget.ip4)),
                      );
                    },
                    child: const Text('PGD4'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(temp5),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Visual(ipek: widget.ip5)),
                      );
                    },
                    child: Text('Visualization'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewApp(ip: widget.ip5)),
                      );
                    },
                    child: const Text('PGD5'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
