import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Text(
            'test',
          ),
        ],
      )),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _IDControlUse = TextEditingController();
  final _IDControlPass = TextEditingController();
  String Us = 'TOB123';
  String Pass = '123456';

  @override
  Widget build(BuildContext context) {
    void Login() {
      if (_IDControlUse.text == '' && _IDControlPass.text == '') {
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
                    child: Text('Tắt'),
                  )
                ],
              );
            });
      } else if (_IDControlUse.text == Us && _IDControlPass.text == Pass) {
        //Navigator chuyển tới trang Load + mailBox, Showdialog chỉ mang tính chất test xử lý đăng nhập
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content: Text('Đăng nhập thành công'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Tắt'),
                  )
                ],
              );
            });
      } else {
        //Navigator chuyển tới trang lỗi đăng nhập, Showdialog chỉ mang tính chất test xử lý đăng nhập
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content: Text('Đăng nhập không thành công'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Tắt'),
                  )
                ],
              );
            });
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
