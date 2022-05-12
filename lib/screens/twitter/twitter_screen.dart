import 'package:covidtracker/screens/twitter/constants.dart';
import 'package:covidtracker/screens/twitter/mock_data.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/link.dart';

class TwitterScreen extends StatelessWidget {
  final ValueNotifier<String> keyword = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 200,
        ),
        ValueListenableBuilder(
          valueListenable: keyword,
          builder: (context, value, child) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Autocomplete<String>(
                  displayStringForOption: (option) => option,
                  fieldViewBuilder: (context, textEditingController, focusNode,
                          onFieldSubmitted) =>
                      TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Delhi"),
                  ),
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text == '') {
                      return [];
                    }
                    return cities.where((String option) {
                      return option
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) {
                    keyword.value = selection;
                  },
                ),
              ),
              Link(
                target: LinkTarget.blank,
                uri: Uri.parse(
                    "https://twitter.com/search?q=verified+${keyword.value}+(bed+OR+beds+OR+icu+OR+oxygen+OR+ventilator+OR+ventilators+OR+fabiflu)+-%22not+verified%22+-%22unverified%22+-%22needed%22+-%22required%22&f=live"),
                builder: (context, followLink) => ElevatedButton(
                  onPressed: followLink,
                  child: Text(Constants.findOnTwitter),
                ),
              )
            ]);
          },
        ),
      ],
    ));
  }
}
