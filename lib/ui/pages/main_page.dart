import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:my_contact/provider/behavior_provider.dart';
import 'package:my_contact/provider/theme_provider.dart';
import 'package:my_contact/provider/user_provider.dart';
import 'package:my_contact/shared/theme.dart';
import 'package:my_contact/ui/widgets/listview_card.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';

class MainPage extends StatelessWidget {
  static const routeMainPage = '/main-page';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 19.0,
                    child: Image.network(
                      "https://gravatar.com/avatar/503f5a145a84199a8ce0e5e99390642f?s=400&d=robohash&r=x",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 40,
                  margin: EdgeInsets.only(top: 20, left: 9.0, right: 3.0),
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/vector/ic_search.svg',
                        ),
                      ),
                      fillColor: Color(0xFFE4E8F8),
                      hintText: "Search contact...",
                      contentPadding: EdgeInsets.only(bottom: 20, left: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: pinkColor),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: IconButton(
                    onPressed: () {
                      context.read<ThemeProvider>().changeBool();

                      context.read<ThemeProvider>().theme();
                    },
                    icon: Consumer<ThemeProvider>(
                      builder: (context, theme, child) {
                        return Icon(
                          Icons.light_mode,
                          size: 19,
                          color: theme.isLight ? Colors.black : Colors.white,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: 18.0,
            ),
            Consumer<UserProvider>(
              builder: (context, userProvider, _) =>
                  (context.read<UserProvider>().getAllUser.length == 0)
                      ? noDataFound()
                      : ListView.builder(
                          primary: false,
                          reverse: true,
                          shrinkWrap: true,
                          itemCount:
                              context.read<UserProvider>().getAllUser.length,
                          itemBuilder: (context, int i) {
                            return ListViewCard(
                              user: context.read<UserProvider>().getAllUser[i],
                              index: i,
                            );
                          },
                        ),
            )
          ],
        ),
      ),
      floatingActionButton: Consumer<BehaviorProvider>(
        builder: (context, behaviorProvider, _) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: FloatingActionButton(
            backgroundColor: pinkColor,
            child: Icon(Icons.add),
            onPressed: () {
              behaviorProvider.changeCondition(behavior.addData);
              Navigator.pushNamed(
                context,
                DetailPage.routeDetailPage,
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget noDataFound() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Lottie.asset(
          'assets/json/no_records_found.json',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Text(
          'No Data Found',
          style: greyTextFont,
        ),
      ],
    );
  }
}
