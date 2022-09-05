import 'package:flutter/material.dart';
import 'visual.dart';
import 'pgd.dart';

class BMS_screen extends StatefulWidget {
  final String ip1;
  final String ip2;
  final String ip3;
  const BMS_screen(
      {Key? key, required this.ip1, required this.ip2, required this.ip3})
      : super(key: key);

  @override
  State<BMS_screen> createState() => _BMS_screenState();
}

class _BMS_screenState extends State<BMS_screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Visual()),
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
      ),
    );
  }
}
