import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/models/cake_shop.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
            color: const Color.fromARGB(255, 251, 247, 224),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.cakeShop?.name ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 161, 126, 0),
                  
                ),
              ),
              
              Text(widget.cakeShop?.description ?? ""),
              SizedBox(height: 10),

              /// ชื่อร้าน
              Row(
                children: [
                  const Icon(Icons.store,
                  color: Color.fromARGB(255, 161, 126, 0)),
                  
                  const SizedBox(width: 10),
                  Text(widget.cakeShop?.name ?? ""),
                  

                ],
              ),

             SizedBox(height: 15),
                 Row(
                children: [
                  const Icon(Icons.timelapse_sharp,
                  color: Color.fromARGB(255, 161, 126, 0)),
                  const SizedBox(width: 10),
                  Text(widget.cakeShop?.openCloseTime ?? ""),
                ],
              ),
              SizedBox(height: 15),

              /// ที่อยู่
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on,
                  color: Color.fromARGB(255, 161, 126, 0)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(widget.cakeShop?.address ?? ""),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              /// โทร
              GestureDetector( // ทำให้แถวนี้สามารถกดได้
                onTap: () {
                  callPhone(widget.cakeShop?.phone ?? "");
                },
                child: Row(
                  children: [
                    const Icon(Icons.phone,
                    color: Color.fromARGB(255, 161, 126, 0)),
                    const SizedBox(width: 10),
                    Text(widget.cakeShop?.phone ?? ""),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// Website
              GestureDetector(
                onTap: () {
                  openUrl(widget.cakeShop?.website ?? "");
                },
                child: Row(
                  children: [
                    const Icon(Icons.public,
                    color: Color.fromARGB(255, 161, 126, 0)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(widget.cakeShop?.website ?? ""),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// Facebook
              GestureDetector(
                onTap: () {
                  openUrl(widget.cakeShop?.facebook ?? "");
                },
                child: Row(
                  children: [
                    const Icon(Icons.facebook, 
                    color: Color.fromARGB(255, 161, 126, 0)),
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

        SizedBox(height: 20),

        /// Map
        Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: FlutterMap(
                    //กำหนดตำแหน่งของแผนที่
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.tryParse(widget.cakeShop?.latitude ?? "0") ?? 0,
                        double.tryParse(widget.cakeShop?.longitude ?? "0") ?? 0,
                       ),
                      initialZoom: 15.0,
                    ),
                    //วาดแผนที่
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.google.com/vt/lyrs=m,h&x={x}&y={y}&z={z}&hl=ar-MA&gl=MA',
                            subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () {
                              launchUrl(
                                Uri.parse(
                                    'https://openstreetmap.org/copyright'),
                              );
                            },
                          ),
                        ],
                      ),
                      // แสดงหมุดบนแผนที่
                      MarkerLayer(
                        markers: [
                          Marker( // กำหนดตำแหน่งของหมุด
                            point: LatLng( 
                              double.tryParse(widget.cakeShop?.latitude ?? "0") ?? 0,
                              double.tryParse(widget.cakeShop?.longitude ?? "0") ?? 0,
                            ),
                            child: InkWell( // ทำให้หมุดสามารถกดได้
                              onTap: () {
                                //เปิด Google Maps ด้วยพิกัดที่กำหนด
                                String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=${
                                  widget.cakeShop?.latitude ?? "0"
                                },${widget.cakeShop?.longitude ?? "0"
                                },${
                                  widget.cakeShop?.name ?? "Unknown"
                                }';
                                launchUrl(Uri.parse(googleMapsUrl));
                              },
                              child: Icon(
                                // FontAwesomeIcons.locationArrow,
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


       

      ],
    ),
  ),
);


}
}
