part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final News news;

  const DetailPage({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.parse(news.createdAt);
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
                        horizontal: margin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                          height: 45,
                        ),
                        Text(
                          'K-Pop',
                          style: boldTextFontprimary,
                        )
                      ],
                    ),
                  ),
                ])),
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: greyColor,
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(40),
                        ),
                        child: Text(
                            "${news.title} Dikabarkan akan segera rilis",
                            style: boldTextFont.copyWith(fontSize: 24)),
                      ),
                      Text(
                        news.contributorName,
                        style: boldTextFontprimary,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                        Waktu(datetime).format('EEEE, d MMMM y'),
                        style: blackTextFont,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(35),
                            horizontal: ScreenUtil().setWidth(margin)),
                        child: Image.network(
                          news.slideshow[0],
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                      ),
                      (news.slideshow.isNotEmpty) ?  carouselSliderWidget(context, news): SizedBox(),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Foto: ${news.contributorName}',
                              style: blackTextFont.copyWith(color: greyColor),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(margin)),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: "Berlin - ",
                                  style: boldTextFont,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: news.content,
                                        style: blackTextFont,
                                        
                                        )
                                  ]),
                            ),
                             SizedBox(height: ScreenUtil().setHeight(45)),
                             RichText(
                               textAlign: TextAlign.left,
                               text: TextSpan(
                                 text: "Baca juga: ",
                                 style: blackTextFont,
                                 children: <TextSpan>[
                                    TextSpan(
                                        text: 'Wah! Ternyata ini Kebiasaan Tidur Aneh Anggota Kelompok Yang itu',
                                        style: primaryTextFont,
                                        
                                        )
                                 ]
                               ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
