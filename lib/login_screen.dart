import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String ipek4 = '';
  String ipek5 = '';

  @override
  void initState() {
    super.initState();
    defShPr();

  }


  Future defShPr() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      ipek1 = prefs.getString('ipek1ShP') ?? '192.168.1.139';
      ipek2 = prefs.getString('ipek2ShP') ?? '192.168.1.139';
      ipek3 = prefs.getString('ipek3ShP') ?? '192.168.1.139';
      ipek4 = prefs.getString('ipek4ShP') ?? '192.168.1.139';
      ipek5 = prefs.getString('ipek5ShP') ?? '192.168.1.139';
    });
  }
  void saveShPr() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('ipek1ShP', ipek1);
      prefs.setString('ipek2ShP', ipek2);
      prefs.setString('ipek3ShP', ipek3);
      prefs.setString('ipek4ShP', ipek4);
      prefs.setString('ipek5ShP', ipek5);
    });
  }


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
                padding: const EdgeInsets.only(top: 10.0),
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
                padding: const EdgeInsets.only(top: 10.0),
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
                padding: const EdgeInsets.only(top:10.0),
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
              Container(
                padding: const EdgeInsets.only(top:10.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: ipek4,
                        ),
                        onChanged: (text) {
                          ipek4 = text;
                        }),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top:10.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: ipek5,
                        ),
                        onChanged: (text) {
                          ipek5 = text;
                        }),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    saveShPr();
                  },
                  child: Text('Save'),
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
                          ip4: ipek4,
                          ip5: ipek5,
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
