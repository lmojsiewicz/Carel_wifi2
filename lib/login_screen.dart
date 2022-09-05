import 'package:flutter/material.dart';
import 'bms_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String ipek1 = '';
  String ipek2 = '';
  String ipek3 = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: ipek1,
                        ),
                        onChanged: (text) {
                          ipek1 = text;
                        }),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: ipek2,
                        ),
                        onChanged: (text) {
                          ipek2 = text;
                        }),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top:40.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: ipek3,
                        ),
                        onChanged: (text) {
                          ipek3 = text;
                        }),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMS_screen(
                          ip1: ipek1,
                          ip2: ipek2,
                          ip3: ipek3,
                        ),
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          )),
    );
  }
}
