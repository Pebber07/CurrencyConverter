import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'currency_converter_material_page.dart';
import 'currency_converter_cupertino_page.dart';

void main() {
  runApp(const MyApp());
}

// MaterialApp -> material design, navigation, localisation, internationalisation, theming
// CupertinoApp
// In Flutter every component can be a widget.(Widgets are classes.)

// Types of widgets
// 1. StatelessWidget(UI) - State immutable
// 2. StatefulWidget(UI) - State can change
// 3. InheritedWidget(something else)

// State: refers to data that determines how the rendered data(Widget) should look like.
// widgettrees, elementtrees, renderobjects
// Scaffold: looks after the local part(there can be more), materialapp for the global part(only one)

// 1. Material Design (Google)
// 2. Cupertino Design (Apple)

// BuildContext: Flutter wants to know the e.g. Widgets location (tells the location of the widget, widgettree)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterialPage(),
    ); // setup navigation for a project
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        home: CurrencyConverterCupertinoPage(),
    );
  }
}