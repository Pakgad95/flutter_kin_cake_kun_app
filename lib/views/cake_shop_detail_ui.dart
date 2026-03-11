import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/models/cake_shop.dart';
import 'package:url_launcher/url_launcher.dart';

class CakeShopDetailUi extends StatefulWidget {
final CakeShop? cakeShop;

const CakeShopDetailUi({super.key, this.cakeShop});

@override
State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {

/// เปิดลิงก์
Future<void> openUrl(String url) async {
final Uri uri = Uri.parse(url);
if (await canLaunchUrl(uri)) {
await launchUrl(uri);
}
}

/// โทรศัพท์
Future<void> callPhone(String phone) async {
final Uri uri = Uri.parse("tel:$phone");
if (await canLaunchUrl(uri)) {
await launchUrl(uri);
}
}

/// เปิด Google Map
Future<void> openMap() async {
final Uri uri = Uri.parse(
"https://www.google.com/maps/search/?api=1&query=13.7440,100.5340",
);


if (await canLaunchUrl(uri)) {
  await launchUrl(uri);
}


}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: const Color.fromARGB(255, 191, 48, 38),
centerTitle: true,
title: Text(
widget.cakeShop?.name ?? "Cake Shop",
style: const TextStyle(color: Colors.white),
),
),


  body: SingleChildScrollView(
    child: Column(
      children: [

        const SizedBox(height: 20),

        /// รูปร้าน
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/${widget.cakeShop?.img1}',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 10),

            Column(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/${widget.cakeShop?.img2}',
                    width: 120,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/${widget.cakeShop?.img3}',
                    width: 120,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// กล่องข้อมูลร้าน
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 240),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ชื่อร้าน
              Row(
                children: [
                  const Icon(Icons.store),
                  const SizedBox(width: 10),
                  Text(widget.cakeShop?.name ?? ""),
                ],
              ),

              const SizedBox(height: 10),

              /// ที่อยู่
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(widget.cakeShop?.address ?? ""),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// โทร
              GestureDetector(
                onTap: () {
                  callPhone(widget.cakeShop?.phone ?? "");
                },
                child: Row(
                  children: [
                    const Icon(Icons.phone),
                    const SizedBox(width: 10),
                    Text(widget.cakeShop?.phone ?? ""),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// Website
              GestureDetector(
                onTap: () {
                  openUrl(widget.cakeShop?.website ?? "");
                },
                child: Row(
                  children: [
                    const Icon(Icons.public),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(widget.cakeShop?.website ?? ""),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// Facebook
              GestureDetector(
                onTap: () {
                  openUrl(widget.cakeShop?.facebook ?? "");
                },
                child: Row(
                  children: [
                    const Icon(Icons.facebook, color: Colors.blue),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(widget.cakeShop?.facebook ?? ""),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// Map
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: openMap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/map.png',
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

      ],
    ),
  ),
);


}
}
