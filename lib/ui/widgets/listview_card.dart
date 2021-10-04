import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_contact/model/user.dart';
import '../../shared/theme.dart';

class ListViewCard extends StatelessWidget {
  final User user;

  const ListViewCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 61.0,
      margin: EdgeInsets.only(left: 19.0, right: 19, bottom: 24),
      decoration: BoxDecoration(
        color: greyListContactColor,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: ListTile(
        dense: false,
        horizontalTitleGap: 3.0,
        minVerticalPadding: 0.0,
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        leading: Container(
          margin: EdgeInsets.only(top: 7.0, bottom: 7.0),
          child: CircleAvatar(
            radius: 42.0,
            child: Image.network(
              user.photo ??
                  "https://gravatar.com/avatar/503f5a145a84199a8ce0e5e99390642f?s=400&d=robohash&r=x",
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          user.name,
          style: blackTextFont,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          height: 61.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(14.0),
              bottomRight: Radius.circular(14.0),
            ),
            color: redColor,
          ),
          child: IconButton(
            onPressed: () {},
            iconSize: 22.0,
            icon: SvgPicture.asset(
              "assets/vector/ic_delete.svg",
              alignment: Alignment.center,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
