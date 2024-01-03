import 'package:flutter/material.dart';
import 'myhomepage.dart';

/// A stateless widget that serves as the landing page of the application.
/// This widget provides the initial view the user encounters, designed with material design principles.
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is the base layout structure from the Material Design library, providing a consistent layout framework.
    return Scaffold(
      // AppBar provides a familiar top navigation bar with a title.
      appBar: AppBar(
        title: Text('Welcome to Our eCommerce App'),
      ),
      // SafeArea ensures that the UI does not intrude into system-reserved areas like the notch or the status bar.
      body: SafeArea(
        // LayoutBuilder allows the widget to adapt to various parent widget sizes, aiding in responsive design.
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Adaptively render the layout based on the screen width, enhancing user experience on different devices.
            return constraints.maxWidth > 600
                ? _buildWideLayout(context) // Uses a horizontal layout for wider screens.
                : _buildNarrowLayout(context); // Uses a vertical layout for narrower screens.
          },
        ),
      ),
    );
  }

  /// Constructs a layout optimized for wide screen devices, arranging content horizontally.
  Widget _buildWideLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildContent(context), // Invokes a common method to construct shared content elements.
      ],
    );
  }

  /// Constructs a layout optimized for narrow screen devices, arranging content vertically.
  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildContent(context), // Invokes a common method to construct shared content elements.
      ],
    );
  }

  /// A shared method that constructs common UI elements used in both wide and narrow layouts.
  /// This method centralizes content creation for easier maintenance and consistency.
  Widget _buildContent(BuildContext context) {
    return Center(
      child: SingleChildScrollView( // Enables scrolling for overflow content.
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                // Navigates to the main home page of the app on button press.
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
                // TODO: Implement login functionality.
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
