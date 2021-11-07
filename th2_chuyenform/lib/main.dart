import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // làm mất nút debug trên giao diện
    routes: <String, WidgetBuilder>{
      '/': (context) => LoginPage(),
      '/load-dang-nhap': (context) => LoadingPage(),
      '/list-mail': (context) => ListEmail(),
      '/loi-dang-nhap': (context) => const PageLoiDangNhap(),
    },
  ));
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _IDControlUse = TextEditingController();
  final _IDControlPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void Login() {
      if (_IDControlUse.text == '' || _IDControlPass.text == '') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content: Text('Yêu cầu nhập đầy đủ thông tin'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Đóng'),
                  )
                ],
              );
            });
      } else if (_IDControlUse.text == _IDControlPass.text) {
        //Navigator chuyển tới trang Load + mailBoxes
        Navigator.pushNamed(context, '/load-dang-nhap');
        Timer(Duration(seconds: 3), () {
          Navigator.pushNamed(context, '/list-mail');
        });
      } else {
        //Navigator chuyển tới trang lỗi đăng nhập, Showdialog chỉ mang tính chất test xử lý đăng nhập
        Navigator.pushNamed(context, '/loi-dang-nhap');
      }
    }

    ;

    Widget Imagesection = Image.asset(
      'images/Email.JPG',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    );
    Widget TextSignln = Container(
      alignment: Alignment.center,
      child: Text(
        'Signln',
        style: TextStyle(fontSize: 60, color: Colors.white),
      ),
    );
    Widget Textabc = Container(
      alignment: Alignment.center,
      child: Text(
        'Speak, friend, and enter',
        style: TextStyle(fontSize: 20),
      ),
    );
    Widget TextBoxEmail = Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: _IDControlUse,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Email',
          prefixIcon: Icon(Icons.email, color: Colors.black),
        ),
      ),
    );
    Widget TextBoxPassword = Container(
      padding: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 50),
      child: TextField(
        controller: _IDControlPass,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock, color: Colors.black),
        ),
        obscureText: true,
      ),
    );
    Widget ButtonSignin = Container(
      width: 480,
      height: 50,
      // padding: EdgeInsets.all(25),
      child: OutlinedButton(
        onPressed: () {
          Login();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        child: Text('SIGN IN', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        //title: Text('Đăng nhập'),
      ),
      backgroundColor: Colors.cyan,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Imagesection,
          TextSignln,
          Textabc,
          TextBoxEmail,
          TextBoxPassword,
          // SizedBox(
          //   width: 30,
          //   height: 30,
          // ),
          ButtonSignin,
        ],
      )),
    );
  }
}

// Giao diện loading
class LoadingPage extends StatelessWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget Imagesection = Image.asset(
      'images/Email.JPG',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    );
    Widget TextSignln = Container(
      alignment: Alignment.center,
      child: Text(
        'Signln',
        style: TextStyle(fontSize: 60, color: Colors.white),
      ),
    );
    Widget Textabc = Container(
      alignment: Alignment.center,
      child: Text(
        'Speak, friend, and enter',
        style: TextStyle(fontSize: 20),
      ),
    );
    Widget Load = Container(
      width: 300,
      height: 300,
      child: SpinKitFadingCircle(color: Colors.white),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          children: [
            Imagesection,
            TextSignln,
            Textabc,
            Load,
          ],
        ),
      ),
    );
  }
}

class ListEmail extends StatefulWidget {
  ListEmail({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomePage();
}

class HomePage extends State<ListEmail> {
  // true là đã check
  bool AllMailBoxes = false;
  bool Icloud = false;
  bool Gmail = false;
  bool HostMail = false;
  bool Vip = false;
  bool Secure = false;
  bool Notication = false;

  // xóa mềm
  bool delAllMailBoxes = false;
  bool delIcloud = false;
  bool delGmail = false;
  bool delHostMail = false;
  bool delVip = false;
  bool delSecure = false;
  bool delNotication = false;
  void _delCheckBox() {
    setState(() {});
    if (AllMailBoxes) {
      delAllMailBoxes = true;
    }
    if (Icloud) {
      delIcloud = true;
    }
    if (Gmail) {
      delGmail = true;
    }
    if (HostMail) {
      delHostMail = true;
    }
    if (Vip) {
      delVip = true;
    }
    if (Secure) {
      delSecure = true;
    }
    if (Notication) {
      delNotication = true;
    }
  }

  Container titleSection(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 40, 20, 10),
      color: Colors.grey[200],
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[500],
              // backgroundColor: Colors.blueGrey[50],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget navSection = Container(
      color: Colors.grey[100],
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 200),
            child: const Text(
              'Mailboxes',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Done',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );

    Widget listItemMailboxesSection = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Offstage(
          offstage: delAllMailBoxes,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: AllMailBoxes,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              AllMailBoxes = !AllMailBoxes;
                            });
                          },
                        ),
                        Icon(
                          Icons.mail_outline,
                          color: Colors.green[120],
                          size: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('All mailboxes'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('1'),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
        Offstage(
          offstage: delIcloud,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: Icloud,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              Icloud = !Icloud;
                            });
                          },
                        ),
                        Icon(
                          Icons.mail_outline,
                          color: Colors.green[120],
                          size: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Icloud'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('1'),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
        Offstage(
          offstage: delGmail,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: Gmail,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              Gmail = !Gmail;
                            });
                          },
                        ),
                        Icon(
                          Icons.mail_outline,
                          color: Colors.green[120],
                          size: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Gmail'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('3'),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
        Offstage(
          offstage: delHostMail,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: HostMail,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              HostMail = !HostMail;
                            });
                          },
                        ),
                        Icon(
                          Icons.mail_outline,
                          color: Colors.green[120],
                          size: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('HostMail'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('4'),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
        Offstage(
          offstage: delVip,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: Vip,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              Vip = !Vip;
                            });
                          },
                        ),
                        Icon(
                          Icons.mail_outline,
                          color: Colors.green[120],
                          size: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('VIP'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('1'),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
      ],
    );
    Widget listItemSpecicalSection = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Offstage(
          offstage: delSecure,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: Secure,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              Secure = !Secure;
                            });
                          },
                        ),
                        Icon(
                          Icons.mail_outline,
                          color: Colors.green[120],
                          size: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Secure'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('1'),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
        Offstage(
          offstage: delNotication,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: Notication,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {
                            setState(() {
                              Notication = !Notication;
                            });
                          },
                        ),
                        Icon(
                          Icons.mail_outline,
                          color: Colors.green[120],
                          size: 25.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Notications'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('1'),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
      ],
    );
    Widget footerSection = Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 2,
                color: Colors.blue,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 220),
                      child: TextButton(
                        onPressed: _delCheckBox,
                        child: Text(
                          'Delete',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.delete_forever,
                      color: Colors.green[120],
                      size: 25.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          navSection,
          titleSection('Mailboxes'),
          listItemMailboxesSection,
          titleSection('Specical folders'),
          listItemSpecicalSection,
          footerSection,
        ],
      )),
    );
  }
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
                              Navigator.pop(context);
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
