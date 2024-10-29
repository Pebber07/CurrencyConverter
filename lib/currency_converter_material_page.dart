import 'package:flutter/material.dart';

// 1. Create a variable that stores the converted currency value.
// 2. Create a function that multiplies the value given by the textfield with 81.
// 3. Store the value in the variable that we created.
// 4. Display the variable.

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

// State is what allows us to create our variables, functions, and the content of it is mutable.
// marked as private, so it can be accessed only in this file.
class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  /* @override
  void initState() {
    super.initState(); // Lifecycle of StatefulWidget -> what stuff gets called, executes, and when does it happen. E.g. When does initState() gets called.
    print("initState rebuilt"); // initState invokes right before build() -> value assign that are coming from Futures, Streams. 
   } */
  void convert() {
    result = double.parse(textEditingController.text) * 0.0025;
    setState(
        () {}); // build fn() gets called, with only the necessary widgets (they are getting rebuilt)
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose(); // remove certain objects from your Widgettree --> called when my widget is no longer existing (we can consider it as initStates opposite)
  }

  @override
  Widget build(BuildContext context) {
    /* double result = 0; // A statelesswidget is immutable this is why it's in the build and not out from this. */
    // Color(0xAARRGGBB)
    // 0xFF000000
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    // On a regular basis it's advised to not "put" complex code e.g. async in the build function, just smaller variables, functions, and return a widgettree
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // int -> string integervalue.toString()
              // string -> int int.parse(stringvalue)
              Text(
                'EUR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              // If I want to give the textfield some padding, I have to put it into a Container, or in a Padding widget.
              // Padding - Container
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in HUF',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10,),
              // Button - Earlier ElevatedButton was called 'raised', and TextButton was 'flat'
              // Buttons that are raised(actual button) - buttons that are appear like a text(looks like a text, but in fact a button)
              ElevatedButton(
                onPressed: convert,
                // debug(testing the application, building new features) - release(how the app will look like in production) - profile modes(mixture of debug and release)
                //debugPrint("Button clicked!"); Don't use 'print' in production code, becase later some confidential information can be lost
                //if (kDebugMode) {
                //print('Button clicked!');
                //}
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ), // Important: In different devices, it works different -> can cause errors
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
        ), // Column only picks up the amount of space that the child needs,),
      ),
    );
  }
}
