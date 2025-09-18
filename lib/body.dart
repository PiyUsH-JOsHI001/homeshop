import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:homeshop/placeorder.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  List<String> _items = [
    "https://assets.ajio.com/medias/sys_master/root/20240728/V5Pf/66a560141d763220fa3fc114/-1117Wx1400H-462068883-black-MODEL.jpg",
    "https://res.cloudinary.com/dzdgpwtox/image/upload/w_900,c_scale/l_final_designs:seller_design_486660:f_20230623165620.png,w_360,h_460,c_fit,x_0,y_-60/oversized_tees/white_f.jpg",
    "https://m.media-amazon.com/images/I/61e0m1RTBEL._UY1100_.jpg",
  ];
  List<int> _price = [699, 799, 899];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(child: Image.network(_items[_selectedIndex])),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 150,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8),
                      title: Image.network(
                        _items[index],
                        fit: BoxFit.fitHeight,
                        height: 80,
                      ),
                      // subtitle: Center(child: Text("Item $index")),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Column(
                         crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fine Tshirt",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '₹ ${NumberFormat.simpleCurrency(name: '').format(_price[_selectedIndex])}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Available Sizes: S, M, L, XL, XXL",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Color Options: White, Black, Blue",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Description:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Upgrade your casual wardrobe with this premium quality oversized T-shirt, crafted from 100% pure cotton for unmatched comfort and breathability. Its relaxed fit and soft fabric ensure all-day wearability — perfect for chilling at home or stepping out in style.",
                            style: TextStyle(fontSize: 13.5),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Key Features:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "🧵 Made from high-quality, skin-friendly cotton",
                            style: TextStyle(fontSize: 13.5),
                          ),
                          Text(
                            "👕 Stylish oversized fit for a trendy streetwear look",
                            style: TextStyle(fontSize: 13.5),
                          ),
                          Text(
                            "🌬️ Breathable & lightweight fabric — ideal for all seasons",
                            style: TextStyle(fontSize: 13.5),
                          ),
                          Text(
                            "💧 Pre-shrunk & fade-resistant even after multiple washes",
                            style: TextStyle(fontSize: 13.5),
                          ),
                          Text(
                            "🧼 Easy to maintain – machine washable",
                            style: TextStyle(fontSize: 13.5),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Ideal For: College students, casual outings, travel, and everyday wear.",
                            style: TextStyle(fontSize: 13.5),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: Size(double.infinity, 0),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PlaceOrderScreen(price: _price[_selectedIndex],);
                }));
              },
              child: Text("Place order", style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
