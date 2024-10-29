import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  /* @override
  void initState() {
    super.initState(); // Lifecycle of StatefulWidget -> what stuff gets called, executes, and when does it happen. E.g. When does initState() gets called.
    print("initState rebuilt"); // initState invokes right before build() -> value assign that are coming from Futures, Streams. 
   } */
  void convert() {
    result = double.parse(textEditingController.text) * 0.0025;
    setState(() {}); // build fn() gets called, with only the necessary widgets (they are getting rebuilt)
  }

  @override
  Widget build(BuildContext context) {
    // On a regular basis it's advised to not "put" complex code e.g. async in the build function, just smaller variables, functions, and return a widgettree
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor:  CupertinoColors.systemGrey3,
        middle:Text(
          'Currency Converter',
          style: TextStyle(color: CupertinoColors.white),
        ),
        // centerTitle: true,
      ),
      child: Center(
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
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: 'Please enter the amount in HUF',
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Button - Earlier ElevatedButton was called 'raised', and TextButton was 'flat'
              // Buttons that are raised(actual button) - buttons that are appear like a text(looks like a text, but in fact a button)
              CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                // debug(testing the application, building new features) - release(how the app will look like in production) - profile modes(mixture of debug and release)
                //debugPrint("Button clicked!"); Don't use 'print' in production code, becase later some confidential information can be lost
                //if (kDebugMode) {
                //print('Button clicked!');
                //}

                child: const Text('Convert'),
              ),
            ],
          ),
        ), // Column only picks up the amount of space that the child needs,),
      ),
    );
  }
}
