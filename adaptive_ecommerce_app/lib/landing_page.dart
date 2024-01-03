import 'package:flutter/material.dart';
import 'myhomepage.dart';

    // Defines a stateless widget for the landing page of the app
    class LandingPage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        // Scaffold provides the basic material design visual layout structure
        return Scaffold(
          // AppBar at the top of the app with a title
          appBar: AppBar(
            title: Text('Welcome to Our eCommerce App'),
          ),
          // SafeArea ensures the body doesn't overlap with system interfaces (like notches)
          body: SafeArea(
            // LayoutBuilder provides the ability to build a widget tree based on the parent widget's size
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Checking screen width to determine layout type
                return constraints.maxWidth > 600
                    ? _buildWideLayout(context) // For wide screens, use horizontal layout
                    : _buildNarrowLayout(context); // For narrow screens, use vertical layout
              },
            ),
          ),
        );
      }
    
      // Builds a horizontal layout for wide screen devices
      Widget _buildWideLayout(BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers content horizontally
          crossAxisAlignment: CrossAxisAlignment.center, // Centers content vertically
          children: [
            _buildContent(context), // Calls a method to build the common content
          ],
        );
      }
    
      // Builds a vertical layout for narrow screen devices
      Widget _buildNarrowLayout(BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
          children: [
            _buildContent(context), // Calls a method to build the common content
          ],
        );
      }
    
      // Common content building method used by both layouts
      Widget _buildContent(BuildContext context) {
        return Center(
          // Center aligns its child within itself
          child: SingleChildScrollView( // Allows the content to scroll
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimizes the space taken by the column
              children: [
                Image.network(
                  'https://via.placeholder.com/150',
                  height: 150,
                ),
                SizedBox(height: 20),
                Text(
                  'Explore Our Products',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text('See products'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder for login button action
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        );
      }
    }