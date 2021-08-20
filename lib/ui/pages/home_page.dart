part of 'pages.dart';

class HomePage extends StatefulWidget {
  // final News news;

  // const HomePage({Key key, this.news}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  List<String> titles = ['POPULAR', 'LATEST NEWS', 'TODAY'];
  List<String> category = [
    'Faboulous',
    'Entertainment',
    'Sport',
    'Fashion',
    'Culture'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(45),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      height: 45,
                    ),
                  ),
                ),
              ])),
          body: RefreshIndicator(
            onRefresh: NewsApiServices().refreshGetNews,
            child: Column(
                children: [
                  Divider(
                    color: greyColor,
                    height: 5,
                  ),
                  Container(
                    child:
                        BlocBuilder<NewsBloc, NewsState>(builder: (_, newsState) {
                      if (newsState is NewsLoaded) {
                        List<News> news = newsState.news.sublist(1, 6);

                        return (news == null) ?  Container(color: primaryColor) : Flexible(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: news.length,

                              // shrinkWrap: true,
                              itemBuilder: (_, index) {
                                final article = news[index];

                                return Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          article.contentThumbnail,
                                          height: ScreenUtil().screenHeight / 2.5,
                                        ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenUtil().setHeight(margin)),
                                          child: Text(
                                            category[index],
                                            style: boldTextFontprimary,
                                          ),
                                        ),

                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => DetailPage(
                                                          news: article,
                                                        )));
                                          },
                                          child: Text(article.title,
                                              style: boldTextFont.copyWith(
                                                  fontSize: 24)),
                                        ),

                                        SizedBox(
                                            height: ScreenUtil().setHeight(30)),

                                        Text(
                                          '4 Menit lalu',
                                          style: greyTextFont,
                                        ),

                                        // //! Tab Kategory

                                        SizedBox(
                                            height: ScreenUtil().setHeight(30)),

                                        CustomTabBar(
                                          titles: titles,
                                          selectedIndex: selectedIndex,
                                          onTap: (index) {
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                          },
                                        ),

                                        Divider(
                                          color: greyColor,
                                          height: 5,
                                        ),

                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: margin),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: titles
                                                    .map(
                                                      (e) => Text(e,
                                                          style: titles.indexOf(
                                                                      e) ==
                                                                  selectedIndex
                                                              ? boldTextFont
                                                                  .copyWith(
                                                                      fontSize:
                                                                          24)
                                                              : boldTextFont.copyWith(
                                                                  color: Colors
                                                                      .transparent,
                                                                  fontSize: 24)),
                                                    )
                                                    .toList())),

                                        Divider(
                                          color: greyColor,
                                          height: 5,
                                        ),

                                        SizedBox(
                                            height: ScreenUtil().setHeight(100)),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ) ;
                      }
                      else {
                        return CircularProgressIndicator(
                            backgroundColor: primaryColor);
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}
