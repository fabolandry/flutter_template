import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // This is for the bottom navigation bar
  int _selectedCategoryIndex = 0; // This is for the category tabs
  final List<String> _categories = ['Sneakers', 'Watch', 'Jaket'];

  void _onCategoryTapped(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCategoryTab(String label, IconData icon, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0), // Adjust the padding value as needed
    child: TextButton(
      onPressed: () {
        _onCategoryTapped(_categories.indexOf(label));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected ? [BoxShadow(
            color: Colors.orange.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          )] : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: Colors.black),
            SizedBox(width: 8.0),
            Text(
              label,
              style: TextStyle(
                color: Colors.black, // Text color remains black
              ),
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
  );
}

Widget _buildCategoryTabs() {
  return Padding(
    padding: EdgeInsets.only(top: 10.0, bottom: 40.0, left: 10.0, right: 10.0), // Adjust the value as needed
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          _buildCategoryTab('Sneakers', FontAwesome.shoelace_brand, _selectedCategoryIndex == _categories.indexOf('Sneakers')),
          _buildCategoryTab('Watch', Icons.watch, _selectedCategoryIndex == _categories.indexOf('Watch')),
          _buildCategoryTab('Jaket', Icons.checkroom, _selectedCategoryIndex == _categories.indexOf('Jaket')),
          // Add more category tabs here as needed
        ],
      ),
    ),
  );
}


  Widget _buildProductCard(String imageUrl, String name, String tag, String price) {
  // Get screen width and orientation
  double screenWidth = MediaQuery.of(context).size.width;
  var orientation = MediaQuery.of(context).orientation;

  // Determine image size based on screen width and orientation
  double imageSize;
  if (orientation == Orientation.portrait) {
    imageSize = screenWidth > 600 ? 200 : 150; // For portrait mode
  } else {
    imageSize = screenWidth > 1024 ? 100 : (screenWidth > 600 ? 50 : 150); // Adjust for landscape mode
  }

  // Determine font size based on screen width and orientation
  double nameFontSize = orientation == Orientation.portrait ? (screenWidth > 600 ? 18 : 16) : (screenWidth > 1024 ? 14 : 9);
  double tagFontSize = orientation == Orientation.portrait ? (screenWidth > 600 ? 16 : 14) : (screenWidth > 1024 ? 12 : 8);
  double priceFontSize = orientation == Orientation.portrait ? (screenWidth > 600 ? 18 : 16) : (screenWidth > 1024 ? 14 : 9);


  return Padding(
    padding: const EdgeInsets.all(10.0), // Add padding around each card
    child: Card(
      color: Colors.white,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Icon(Icons.favorite_border, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: imageSize,
            child: Center(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: nameFontSize, // Slightly larger text for wider screens
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0), // Vertical space between name and tag
                Text(
                  tag,
                  style: TextStyle(
                    fontSize: tagFontSize, // Slightly larger text for wider screens
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0), // Vertical space between tag and price
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: priceFontSize, // Slightly larger text for wider screens
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "\$", style: TextStyle(color: Colors.orange)),
                      TextSpan(text: price.substring(1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}



  Widget _shopPage() {
   final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _appBarWidget(),
          _introductoryText(),
          _searchAndFilterRow(),
          _buildCategoryTabs(),
          isLargeScreen ? _gridProductView() : _pageProductView(),
        ],
      ),
    );
  }

   Widget _appBarWidget() {
    // AppBar widget
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(AntDesign.menu_outline, color: Colors.black),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      );
  }

  Widget _introductoryText() {
    // Introductory text widget
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 25.0, bottom: 25.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Our',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                'Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget _searchAndFilterRow() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    child: Row(
      children: <Widget>[
        Expanded( // Use Expanded instead of a Container with fixed width
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Products',
              hintStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(Icons.search, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
            ),
          ),
        ),
        SizedBox(width: 20), // Reduce the space between the search bar and the filter button
        Transform.scale(
          scale: 1.3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Bootstrap.sliders2, color: Colors.black),
              onPressed: () {
                // Handle filter button press
              },
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _gridProductView() {
    // Product grid for larger screens
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 6, // Adjust based on your design
      childAspectRatio: 3 / 5,
      children: List.generate(10, (index) { // Replace 10 with your product count
        return _buildProductCard(
          'https://cdn.discordapp.com/attachments/1008571020480876554/1188925006479097876/fritzlandry_Illustration_modernisitic_futuristic_tech_enhanced__e1959bbd-9b63-4136-bb2a-61319e0fef44.png',
          'Product Name $index',
          'Category $index',
          '\$${index * 50}.00',
        );
      }),
    );
  }


  Widget _pageProductView() {
    // PageView for smaller screens
    return Container(
      height: 325,
      child: PageView.builder (
          controller: PageController(
            viewportFraction: 4 / 6,
          ),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildProductCard(
                'https://cdn.discordapp.com/attachments/1008571020480876554/1188924998400868402/fritzlandry_Illustration_modernisitic_futuristic_tech_enhanced__893b33b5-5d6e-40be-b80f-0350b2767937.png',
                'NIKE AIR MAX 200',
                'Trending Now',
                '\$240.00',
              );
            } else if (index == 1) {
              return _buildProductCard(
                'https://cdn.discordapp.com/attachments/1008571020480876554/1188925006479097876/fritzlandry_Illustration_modernisitic_futuristic_tech_enhanced__e1959bbd-9b63-4136-bb2a-61319e0fef44.png',
                'Nike Air Max 97',
                'Best Selling',
                '\$220.00',
              );
            } else {
              return Container(); // This line acts as a placeholder for additional product cards.
            }
          },
        ),
    );
  }





@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 240, 240, 245),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            _shopPage(), // Your main shop page
            Center(child: Text('Search Page Placeholder')), // Placeholder for search page
            Center(child: Text('Cart Page Placeholder')), // Placeholder for cart page
            Center(child: Text('Favorites Page Placeholder')), // Placeholder for favorites page
          ],
        ),
      ),
    ),
    bottomNavigationBar: _bottomNavigationBar(),
  );
}


  Widget _bottomNavigationBar() {
    // Bottom navigation bar widget
    return MoltenBottomNavigationBar(
      selectedIndex: _selectedIndex,
      onTabChange: _onItemTapped,
      domeCircleColor: Colors.orange,
      tabs: [
        MoltenTab(
          icon: Icon(Iconsax.shop_outline),
          selectedColor: Colors.white,
          unselectedColor: Colors.grey,
        ),
        MoltenTab(
          icon: Icon(Iconsax.search_normal_outline),
          selectedColor: Colors.white,
          unselectedColor: Colors.grey,
        ),
        MoltenTab(
          icon: Icon(Iconsax.shopping_bag_outline),
          selectedColor: Colors.white,
          unselectedColor: Colors.grey,
        ),
        MoltenTab(
          icon: Icon(Iconsax.favorite_chart_outline),
          selectedColor: Colors.white,
          unselectedColor: Colors.grey,
        ),
      ],
    );
  }
}

