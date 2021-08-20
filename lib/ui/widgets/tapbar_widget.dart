part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabBar({this.selectedIndex, @required this.titles, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titles
              .map((e) => Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (onTap != null) {
                            onTap(titles.indexOf(e));
                          }
                        },
                        child: Container(
                          width: (titles.indexOf(e) == selectedIndex) ? 60 : 30,
                          height: 3,
                          margin: EdgeInsets.only(top: 13),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.5),
                              color: (titles.indexOf(e) == selectedIndex)
                                  ? primaryColor
                                  : greyColor),
                        ),
                      ),
                      // SizedBox(width: titles.indexOf(e) == selectedIndex ? 30 : 0),
                      SizedBox(height: 35),
                    ],
                  )))
              .toList(),
        ),
      ],
    ));
  }
}
