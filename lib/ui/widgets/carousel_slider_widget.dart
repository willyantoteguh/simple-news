part of 'widgets.dart';

  CarouselSlider carouselSliderWidget(BuildContext context, News news) {
    return CarouselSlider(
                  height: MediaQuery.of(context).size.height / 8,

                  // enlargeCenterPage: true,
                  // autoPlay: true,
                  // initialPage: 0,
                  // pauseAutoPlayOnTouch: Duration(seconds: 10),
                  // aspectRatio: 12 / 8,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enableInfiniteScroll: true,
                  // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  reverse: false,
                  enableInfiniteScroll: false,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  scrollDirection: Axis.horizontal,
                  // onPageChanged: (index) {
                  //   setState(() {
                  //     _current = index;
                  //   });
                  // },
                  items: [
                    Container(
                      margin: EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.61),
                              Colors.black.withOpacity(0)
                            ]),
                        image: DecorationImage(
                          image: NetworkImage((news.slideshow.isNotEmpty)
                              ? news.slideshow.elementAt(0) ??
                              "": imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.90),
                              Colors.black.withOpacity(0)
                            ]),
                        image: DecorationImage(
                          image: NetworkImage((news.slideshow.isNotEmpty)
                              ? news.slideshow.elementAt(1) ??
                              "": imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.61),
                              Colors.black.withOpacity(0)
                            ]),
                        image: DecorationImage(
                          image: NetworkImage((news.slideshow.isNotEmpty)
                              ? news.slideshow.elementAt(2) ??
                              "": imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
  }

