import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/views/cake_shop_detail_ui.dart';
import 'package:flutter_kin_cake_kun_app/views/cake_shop_list_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
 void initState() {
    super.initState();
    Future.delayed
    (Duration(seconds: 3),
     () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CakeShopListUi(),
        ),
        // เปลี่ยนเส้นทางไปยังหน้าหลักหลังจาก 3 วินาที
      );
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(// แก้ไขเส้นทางของภาพพื้นหลัง
            image: AssetImage('assets/images/bg_welcome.png'),// แก้ไขเส้นทางของภาพพื้นหลัง
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50), // เพิ่มระยะห่างด้านบน
              Text(
                'กินเค้กกันเถอะ!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 191, 48, 38),
                ),
              ),
              Text(
                'Eat Cake Together!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่างข้อความและตัวโหลด
              CircularProgressIndicator(// ตัวโหลดหมุน
                color: const Color.fromARGB(255, 0, 0, 0),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}