import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jala/Categorypage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jala/Products_data/products_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:jala/Profilepage.dart';
import 'package:jala/Category/BestSellingCategory.dart';
import 'package:jala/Category/MuttonCategory.dart';
import 'package:jala/Category/Fish&SeafoodCategory.dart';
import 'package:jala/Category/ChickenCategory.dart';
import 'package:jala/Category/PorkCategory.dart';
import 'package:jala/Category/EggCategory.dart';
import 'package:jala/Cart/CartPage.dart';
import 'package:jala/Category/CrabCategory.dart';
import 'package:jala/Category/PrawnsCategory.dart';
import 'package:jala/Category/FishCategory.dart';

final List<Map<String, String>> categories = [
  {'name': 'Best Sellings', 'image': 'assets/Our_best_sellings/Bacon-300x169.jpg'},
  {'name': 'Mutton', 'image': 'assets/Mutton/FRESH-MUTTON-BONE-IN-500-GM.webp'},
  {'name': 'Chicken', 'image': 'assets/Chicken/premium_chicken_lollipop_1.jpg'},

];

final List<Map<String, String>> categories1 = [
  {'title': 'Best Selling', 'image': 'assets/Our_best_sellings/Ham-300x169.jpg'},
  {'title': 'Chicken', 'image': 'assets/Chicken/1610189709-chickenfullleg.jpg'},
  {'title': 'Eggs', 'image': 'assets/Eggs/White-Eggs.webp'},
  {'title': 'Crabs', 'image': 'assets/SeaFood/crab blue.jpg'},
  {'title': 'Prawns', 'image': 'assets/SeaFood/farm-prawn-300x169.jpg'},
  {'title': 'Mutton', 'image': 'assets/Mutton/1590135411-fresh-cut-mutton-500x500.jpg'},
  {'title': 'Pork', 'image': 'assets/Pork/BACON-SHORT-CUT-RINDLESS-1000x1000.jpg'},
  {'title': 'Fish', 'image': 'assets/SeaFood/seer_fish_steak_catalogue anjal.jpg'},
];


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  int _currentPage = 0;


  late CarouselSliderController _carouselController = CarouselSliderController(); // Define the current page
  late PageController _pageController; // Define the PageController
  bool _isImageVisible = true;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage); // Initialize the controller
    print('dhanu');
  }

  void _onCarouselPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _isImageVisible = false; // Hide image before switching
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _currentPage = index; // Update current page
        _isImageVisible = true; // Show image again after switching
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage()), // Your home page
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage()), // Category page
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage()), // Category page
          );
          break;
      // Add other cases for additional pages
      }
    });
  }


  final List<String> imagePaths = [
    'assets/Carousel/mutton goat.jpg',
    'assets/Carousel/chicken.jpg',
    'assets/Carousel/fish.jpg',
    'assets/Carousel/mutton sheep.jpg',
    'assets/Carousel/eggs.jpg'
  ];

  final List<Map<String, String>> imagePaths1 = [
    {
      'image': 'assets/SeaFood/40005333_4-fresho-roopchand-fish-slice-preservative-free-10-14-pcs.webp',
      // replace with actual image
      'text': 'Fresh Fish & Seafood',
      'description1': 'Small boat fishing for max freshness',
      'description2': 'Cut & cleaned by experts',
    },
    {
      'image': 'assets/Mutton/FRESH-MUTTON-BONE-IN-500-GM.webp',
      'text': 'Fish Variety 2',
      'description1': 'Best quality for you',
      'description2': 'Handled with care',
    },
    {
      'image': 'assets/Chicken/Fresh-raw-chicken-legs-on-a-cutting-board.jpeg',
      'text': 'Seafood Special',
      'description1': 'Direct from the ocean',
      'description2': 'Expertly prepared',
    },
    {
      'image': 'assets/Pork/prok-belly.jpg',
      'text': 'Seafood Special',
      'description1': 'Direct from the ocean',
      'description2': 'Expertly prepared',
    },
    // Add more entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Colors.purple[100],
            leading: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset('assets/hm-removebg-preview.png',
                  fit: BoxFit.contain),
            ),
            title: Container(
              width: 500,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Meat',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.qr_code_scanner_rounded),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
                  // Handle more actions here
                },
              ),
            ],
          ),
        ),
        body: Scrollbar(
          thumbVisibility: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,


              children: [
                SizedBox(height: 20,),


                // SizedBox(height: 20),
                // Carousel Slider
                CarouselSlider(
                  items: imagePaths.map((path) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Image.asset(
                            path,
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  carouselController: _carouselController,
                  // Use the same controller
                  options: CarouselOptions(
                    height: 250.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 12 / 9,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index; // Update current page index
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    // Now use the carousel controller
                    count: imagePaths.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.purple,
                      dotColor: Colors.grey,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                      expansionFactor: 3,
                    ),
                    onDotClicked: (index) {
                      _carouselController.animateToPage(index);
                      // Jump to page when dot is clicked
                    },
                  ),
                ),


                SizedBox(height: 20),
                // Categories Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Shop by Category:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 130.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return GestureDetector(
                          onTap: () {
                            if (category['name'] == 'Best Sellings') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Bestsellingcategory(
                                          BestsellingcategoryName: ''),
                                ),
                              );
                            } else if (category['name'] == 'Mutton') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Muttoncategory(
                                          MuttoncategoryName: ''), // Navigate to Mutton category
                                ),
                              );
                            }
                            // Add more else-if cases for other categories as needed
                            else if (category['name'] == 'Chicken') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Chickencategory(
                                            ChickenCategoryName: '') // Navigate to Mutton category
                                ),
                              );
                            }
                          },

                          child: Container(
                            width: 120.0,
                            //height: 200.0,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple[100]!.withOpacity(0.6),
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),


                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),


                                Image.asset(
                                  category['image']!,
                                  width: 90.0,
                                  height: 80.0,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  category['name']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                          )
                      );
                    },
                  ),
                ),


                // GridView for Products
                SizedBox(height: 30),

// Display the uploaded image here
                Center(
                  child: Container(
                    width: 350,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0,
                              3), // Changes the position of the shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CarouselSlider.builder(
                        carouselController: _carouselController,
                        itemCount: imagePaths1.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          final item = imagePaths1[itemIndex];

                          return Stack(
                            children: [
                              // Animated image fade-in/out
                              AnimatedOpacity(
                                opacity: _isImageVisible ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 500),
                                child: Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Text overlay with animated switcher for descriptions
                              Positioned(
                                left: 10,
                                top: 20,
                                child: Container(
                                  padding: EdgeInsets.all(10), // Add some padding to the background
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7), // Semi-transparent white background
                                    borderRadius: BorderRadius.circular(8), // Rounded corners if desired
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AnimatedSwitcher(
                                        duration: Duration(milliseconds: 500),
                                        child: Text(
                                          item['text']!,
                                          key: ValueKey(item['text']),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black, // Change to black for better contrast on white
                                            shadows: [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: Colors.black.withOpacity(0.8),
                                                offset: Offset(2, 2),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      AnimatedSwitcher(
                                        duration: Duration(milliseconds: 500),
                                        child: Text(
                                          item['description1']!,
                                          key: ValueKey(item['description1']),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black, // Change to black for better contrast
                                            shadows: [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: Colors.black.withOpacity(0.8),
                                                offset: Offset(1, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      AnimatedSwitcher(
                                        duration: Duration(milliseconds: 500),
                                        child: Text(
                                          item['description2']!,
                                          key: ValueKey(item['description2']),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black, // Change to black for better contrast
                                            shadows: [
                                              Shadow(
                                                blurRadius: 10.0,
                                                color: Colors.black.withOpacity(0.8),
                                                offset: Offset(1, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          );
                        },
                        options: CarouselOptions(
                          height: 250,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1.0,
                          onPageChanged: _onCarouselPageChanged,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore more categories',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Freshest meats and so much more!',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(), // Disable scrolling for the GridView
                          shrinkWrap: true, // Allow GridView to take up only as much space as needed
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Adjust this to change the number of columns
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 26,
                          ),
                          itemCount: categories1.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigate to the desired page based on category selection
                                if (categories1[index]['title'] == 'Best Selling') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Bestsellingcategory(BestsellingcategoryName: '')),
                                  );
                                } else if (categories1[index]['title'] == 'Chicken') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Chickencategory(ChickenCategoryName: '')),
                                  );
                                }
                                else if (categories1[index]['title'] == 'Eggs') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Eggcategory(EggCategoryName: '')),
                                  );
                                }
                                else if (categories1[index]['title'] == 'Crabs') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Crabcategory(CrabcategoryName: '')),
                                  );
                                }
                                else if (categories1[index]['title'] == 'Prawns') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Prawnscategory(PrawnscategoryName: '')),
                                  );
                                }
                                else if (categories1[index]['title'] == 'Mutton') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Muttoncategory(MuttoncategoryName: '')),
                                  );
                                }
                                else if (categories1[index]['title'] == 'Pork') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Porkcategory(PorkCategoryName: '')),
                                  );
                                }
                                else if (categories1[index]['title'] == 'Fish') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Fishcategory(FishcategoryName: '')),
                                  );
                                }
                                // Add more navigation logic for other categories
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 40, // Adjust the size of the circle
                                    backgroundImage: AssetImage(categories1[index]['image']!),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    categories1[index]['title']!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )





              ],
            ),
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
