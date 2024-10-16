import 'package:flutter/material.dart';
import 'package:jala/HomeScreen.dart';
import 'package:jala/Profilepage.dart';
import 'package:jala/Category_Tab/Chicken.dart';
import 'package:jala/Category_Tab/Mutton.dart';
import 'package:jala/Category_Tab/Fish.dart';
import 'package:jala/Category_Tab/Prawn.dart';
import 'package:jala/Category_Tab/Eggs.dart';
import 'package:jala/Category_Tab/Pork.dart';
import 'package:jala/Products_data/products_list.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<bool> _isExpanded = [false, false, false, false, false, false];

  int _selectedIndex = 1;
  int _currentPage = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()), // Your home page
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryPage()), // Category page
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()), // Category page
          );
          break;
      // Add other cases for additional pages
      }

    });
  }


  final List<Map<String, dynamic>> productlist = [
    {
      'image': 'assets/Chicken/Chicken-Lollipop-300x169.jpg',
      'title': 'Chicken',
      'description': 'Raised on biosecure farms',
      'products': [
        {'name': 'Currys Cuts', 'image': 'assets/Chicken/Chicken-Lollipop.jpg'},
        {'name': 'Boneless Chicken', 'image': 'assets/Chicken/Chicken-barbecue cut.jpg'},
        {'name': 'Special Cuts', 'image': 'assets/Chicken/Chicken-Cut-Up3-1.png'},
      ]
    },
    {
      'image': 'assets/Mutton/1590135411-fresh-cut-mutton-500x500.jpg',
      'title': 'Mutton',
      'description': 'Freshly marinated meats',
      'products': [
        {'name': 'Chop Cuts', 'image': 'assets/Mutton/fresh-mutton-curry-cut-500x500.webp'},
        {'name': 'Boneless', 'image': 'assets/Mutton/161-mutton-chops_1.jpg'},
        {'name': 'Legs', 'image': 'assets/Mutton/Goat-Shoulder-Curry-Cut-300x169.jpg'},
      ]
    },
    {
      'image': 'assets/SeaFood/catla-fish-benefits.jpg',
      'title': 'Fish',
      'description': 'Fish & Seafood',
      'products': [
        {'name': 'Fresh Water', 'image': 'assets/SeaFood/1623403621_roopchandnewimage-min.webp'},
        {'name': 'Sea Water', 'image': 'assets/SeaFood/0003101_king-fish-surmai_550anjal.jpeg'},
      ]
    },
    {
      'image': 'assets/SeaFood/fresh-tiger-prawns.jpg',
      'title': 'Prawn',
      'description': 'Pasture raised lamb & goats',
      'products': [
        {'name': 'Small Prawn', 'image': 'assets/SeaFood/sea-prawn-500x500-1-.jpg'},
        {'name': 'Medium Prawn', 'image': 'assets/SeaFood/seer fish king fish surami naymeen vanjaram anjal.jpg'},
        {'name': 'Large Prawn', 'image': 'assets/SeaFood/Whole-Red-Prawns-2kg-1-Custom.jpg'},
      ]
    },
    {
      'image': 'assets/Eggs/Farm-Eggs.jpg',
      'title': 'Eggs',
      'description': 'Rich & flavourful cuts of liver, kidney, Paya & more',
      'products': [
        {'name': 'Farm Egg', 'image': 'assets/Eggs/Farm-Eggs.jpg'},
        {'name': 'Nati Egg', 'image': 'assets/Eggs/fresh nati-eggs   -country chicken eggs.jpg'},
        {'name': 'Giriraja Double Egg', 'image': 'assets/Eggs/giriraja double-yolks.jpg'},
      ]
    },
    {
      'image': 'assets/Pork/Pork-Without-Bone-300x169.jpg',
      'title': 'Pork',
      'description': 'Cleaned, peeled & deveined',
      'products': [
        {'name': 'Curry Cuts', 'image': 'assets/Pork/Bacon-300x169.jpg'},
        {'name': 'Boneless & Mince', 'image': 'assets/Pork/3190016porkboneless.jpg'},
        {'name': 'Speciality Cuts', 'image': 'assets/Pork/BACON-SHORT-CUT-RINDLESS-1000x1000.jpg'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productlist.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              imageUrl: productlist[index]['image']!,
              title: productlist[index]['title']!,
              description: productlist[index]['description']!,
              isExpanded: _isExpanded[index],
              products: productlist[index].containsKey('products')
                  ? List<Map<String, String>>.from(productlist[index]['products'])
                  : [],
              onTap: () {
                setState(() {
                  _isExpanded[index] = !_isExpanded[index];
                });
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.purple[100],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool isExpanded;
  final List<Map<String, String>> products;
  final VoidCallback onTap;

  CategoryItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isExpanded,
    required this.products,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 6.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate based on product name
                    if (product['name'] == 'Currys Cuts') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChickenPage(selectedCategory: 'Currys Cuts')), // Navigate to Curry Cuts page
                      );
                    } else if (product['name'] == 'Boneless Chicken') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChickenPage(selectedCategory: 'Boneless Chicken')), // Navigate to Boneless & Mince page
                      );
                    } else if (product['name'] == 'Special Cuts') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChickenPage(selectedCategory: 'Special Cuts')), // Navigate to Speciality Cuts page
                      );
                    }
                    if (product['name'] == 'Chop Cuts') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MuttonPage(selectedCategory: 'Chop Cuts')), // Navigate to Curry Cuts page
                      );
                    } else if (product['name'] == 'Boneless') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MuttonPage(selectedCategory: 'Boneless')), // Navigate to Boneless & Mince page
                      );
                    } else if (product['name'] == 'Legs') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MuttonPage(selectedCategory: 'Legs')), // Navigate to Speciality Cuts page
                      );
                    }
                    if (product['name'] == 'Fresh Water') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FishPage(selectedCategory: 'Fresh Water')), // Navigate to Curry Cuts page
                      );
                    } else if (product['name'] == 'Sea Water') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FishPage(selectedCategory: 'Sea Water')), // Navigate to Boneless & Mince page
                      );
                    }
                     if (product['name'] == 'Small Prawn') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrawnPage(selectedCategory: 'Small Prawn')), // Navigate to Boneless & Mince page
                      );
                    }else if (product['name'] == 'Medium Prawn') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrawnPage(selectedCategory: 'Medium Prawn')), // Navigate to Boneless & Mince page
                      );
                    }
                    else if (product['name'] == 'Large Prawn') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrawnPage(selectedCategory: 'Large Prawn')), // Navigate to Speciality Cuts page
                      );
                    }
                    if (product['name'] == 'Farm Egg') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EggPage(selectedCategory: 'Farm Egg')), // Navigate to Curry Cuts page
                      );
                    } else if (product['name'] == 'Nati Egg') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EggPage(selectedCategory: 'Nati Egg')), // Navigate to Boneless & Mince page
                      );
                    } else if (product['name'] == 'Giriraja Double Egg') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EggPage(selectedCategory: 'Giriraja Double Egg')), // Navigate to Speciality Cuts page
                      );
                    }
                    if (product['name'] == 'Curry Cuts') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PorkPage(selectedCategory: 'Curry Cuts')), // Navigate to Curry Cuts page
                      );
                    } else if (product['name'] == 'Boneless & Mince') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PorkPage(selectedCategory: 'Boneless & Mince')), // Navigate to Boneless & Mince page
                      );
                    } else if (product['name'] == 'Speciality Cuts') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PorkPage(selectedCategory: 'Speciality Cuts')), // Navigate to Speciality Cuts page
                      );
                    }
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          product['image']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        product['name']!,
                        style: TextStyle(fontSize: 12.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

