import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_contact/model/user.dart';
import 'package:my_contact/provider/behavior_provider.dart';
import 'package:my_contact/provider/user_provider.dart';
import 'package:my_contact/ui/pages/detail_page.dart';
import 'package:provider/provider.dart';

import '../../shared/theme.dart';

class ListViewCard extends StatelessWidget {
  final User user;
  final int index;

  const ListViewCard({Key? key, required this.user, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BehaviorProvider>(
      builder: (context, behaviorProvider, _) => Container(
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
              margin: EdgeInsets.only(left: 9.0, right: 7.0),
              width: 42.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      user.photo ??
                          "https://cdn.pixabay.com/photo/2018/03/23/22/11/question-mark-3255140_960_720.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
              child: null),
          title: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailPage.routeDetailPage,
                  arguments: user.id);
              behaviorProvider.changeCondition(behavior.detailData);
            },
            child: Text(
              user.name!,
              style: blackTextFont,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Consumer<UserProvider>(
            builder: (context, userProvider, _) => Container(
              height: 61.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14.0),
                  bottomRight: Radius.circular(14.0),
                ),
                color: redColor,
              ),
              child: IconButton(
                onPressed: () {
                  var snackBar;
                  if (userProvider.deleteUser(user)) {
                    snackBar = SnackBar(
                      content: Text('delete succes'),
                    );
                  } else {
                    snackBar = SnackBar(
                      content: Text('delete failed'),
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
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
        ),
      ),
    );
  }
}
