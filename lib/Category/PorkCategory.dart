import 'package:flutter/material.dart';
//import 'package:jala/Products_data/products_list.dart';
import 'package:jala/Products_data/products_pork.dart';
import 'package:jala/Cart/CartPage.dart';
import 'package:jala/Cart/CartManager.dart';

class Porkcategory extends StatefulWidget {
  final String PorkCategoryName;

  // Constructor to initialize BestSellingcategoryName
  const Porkcategory({Key? key, required this.PorkCategoryName}) : super(key: key);

  @override
  State<Porkcategory> createState() => _PorkcategoryState();
}

class _PorkcategoryState extends State<Porkcategory> {

  List<bool> isAdded = []; // Track whether "Add" button has been pressed for each product

  @override
  void initState() {
    super.initState();
    // Initialize all products as "not added"
    isAdded = List<bool>.filled(productPork.length, false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Pork')
            // Text(widget.PorkCategoryName), // Access categoryName here
            // SizedBox(width: 100),
            // Icon(Icons.search),
            // SizedBox(width: 10),
            // Icon(Icons.favorite),
            // SizedBox(width: 10),
            // Icon(Icons.shopping_cart),
          ],
        ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(),),
                );
              },
            ),
          ]
      ),
      body: Container(
        child : Scrollbar(
    thumbVisibility: true,
        child: GridView.builder(
          itemCount: productPork.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 50.0,
          ),
            itemBuilder: (context, index) {
              return Container(
                width: 200.0,
                height: 10.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0x1F000000)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFE1BEE7),
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image and Price
                    Stack(
                      children: [
                        Image.asset(
                          productPork[index]['image']!,
                          width: double.infinity,
                          height: 110,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          right: 12,
                          bottom: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              "${productPork[index]['price']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "${productPork[index]['itemName']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    // This will wrap the remaining content inside a Flexible widget
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "${productPork[index]['itemDescription']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                maxLines: 2,
                                // Limit the number of lines to avoid overflow
                                overflow: TextOverflow
                                    .ellipsis, // Show ellipsis if text overflows
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: ()  {
                              setState(() {
                                isAdded[index] = true;
                              });

                              CartManager().addToCart(productPork[index], 1); // Default quantity 1

                              // Navigate to cart page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              // Use backgroundColor instead of primary
                              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
        )
      )
    );
  }
}