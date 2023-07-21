import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:dropdown_search/dropdown_search.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key});

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String? _selectedOption;
  List<Quote> _dropdownItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'SAME DAY QUOTES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Bold',
                        fontSize: 30,
                        color: Colors.blue[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NO OBLIGATIONS',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Innovating for a',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sustainable Future',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Our Multi-Strategy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Bold',
                        fontSize: 35,
                        color: Colors.blue[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fund Approach',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[400]!,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DropdownSearch<Quote>(
                      mode: Mode.MENU,
                      showSearchBox: true,
                      isFilteredOnline: true,
                      dropDownButton: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 18,
                      ),
                      dropdownSearchDecoration: InputDecoration(
                        hintText: 'Search (AAPL, GOOG) etc.',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      dropdownBuilder: _customDropdownQuote,
                      popupItemBuilder: _customPopupItemBuilder,
                      onChanged: (Quote? object) {
                        setState(() {
                          _selectedOption = object?.symbol;
                          if (object != null) {}
                        });
                      },
                      onFind: (String? filter) async {
                        return getData(filter ?? '');
                      },
                      showClearButton: false,
                      clearButtonBuilder: (_) => const Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.clear,
                          size: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 55,
                  width: 220,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Qoute');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GET A QUOTE TODAY',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _customDropdownQuote(BuildContext context, Quote? item) {
  return Container(
    child: (item == null)
        ? const ListTile(
            contentPadding: EdgeInsets.all(16.0),
            title: Text(
              "Search (AAPL, GOOG) etc.",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(235, 158, 158, 158),
              ),
            ),
          )
        : ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: Text(
              item.name,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13.5, color: Colors.black),
            ),
          ),
  );
}

Widget _customPopupItemBuilder(
    BuildContext context, dynamic item, bool isSelected) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: ListTile(
      title: Text(
        item.name,
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 102, 100, 100),
        ),
      ),
    ),
  );
}

Future<List<Quote>> getData(String filter) async {
  var response = await http.get(
    Uri.parse("https://liqueous.logixsy.com/api/quote/tickers?search=$filter"),
  );

// Print the JSON data from the API before decoding
  print(response.body);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    if (data['data'] != null) {
      List<dynamic> quotesJson = data['data'];
      var detailsList = <Quote>[];
      for (Map<String, dynamic> quote in quotesJson) {
        detailsList.add(Quote(
          symbol: quote['code'],
          name: quote['name'],
          exchangeName: quote['exchange_name'],
        ));
      }
      print(detailsList); // Check if the list is correctly populated
      return detailsList;
    } else {
      return []; // Return an empty list if 'data' is null or empty
    }
  } else {
    throw Exception("Error ${response.statusCode}");
  }
}

class Quote {
  final String symbol;
  final String name;
  final String exchangeName;

  Quote({
    required this.symbol,
    required this.name,
    required this.exchangeName,
  });
}
