import 'package:flutter/material.dart';

import 'package:my_contact/ui/widgets/listview_card.dart';

class ListViewContact extends StatelessWidget {
  const ListViewContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 119.0,
          ),
          Divider(),
          SizedBox(
            height: 18.0,
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (BuildContext context, int i) {
              return ListViewCard();
            },
          )
        ],
      ),
    );
  }
}
