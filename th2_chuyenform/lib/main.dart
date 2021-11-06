import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      '/': (context) => const PageLoiDangNhap(),
    },
  ));
}

class PageLoiDangNhap extends StatelessWidget {
  const PageLoiDangNhap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('images/error_login.png',
                  width: 900, height: 270),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Ôi không!!!!Không đăng nhập được rồi...',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Có thể là bạn nhớ nhầm tài khoản hoặc mật khẩu rồi đấy!',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Bạn hãy kiểm tra lại nhé!',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            child: Text("Thử lại"),
                            onPressed: () {
                              Navigator.pushNamed(context, 'routeName');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
