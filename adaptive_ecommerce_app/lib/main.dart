// Import Flutter's material design library.
    import 'package:flutter/material.dart';
    
    // Import the landing page widget from 'landing_page.dart'.
    import 'landing_page.dart'; 
    
    // The main function, serving as the entry point of the application.
    void main() => runApp(MyApp());
    
    // MyApp class, a stateless widget that represents the root of the application.
    class MyApp extends StatelessWidget {
    
      // Overriding the build method to describe the part of the user interface represented by this widget.
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          // Set the title of the application, displayed in the task switcher.
          title: 'Adaptive eCommerce App',
    
          // Define the default (light) theme settings for the application.
          theme: ThemeData(
            brightness: Brightness.light, // Setting the overall brightness to light.
            primarySwatch: Colors.blue, // The primary color swatch for the application.
            
            // Define a color scheme for the light theme.
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // Primary color for the light theme.
              secondary: Colors.amber, // Secondary (accent) color for the light theme.
            ),
          ),
    
          // Define the dark theme settings for the application.
          darkTheme: ThemeData(
            brightness: Brightness.dark, // Setting the overall brightness to dark.
            primarySwatch: Colors.blueGrey, // The primary color swatch for the dark theme.
            
            // Define a color scheme for the dark theme.
            colorScheme: ColorScheme.dark(
              primary: Colors.blueGrey, // Primary color for the dark theme.
              secondary: Colors.amber, // Secondary (accent) color for the dark theme.
            ),
          ),
    
          // Set the home screen of the application to the LandingPage widget.
          home: LandingPage(),
        );
      }
    }
    