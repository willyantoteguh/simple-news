import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:simple_news/models/models.dart';
import 'package:simple_news/services/services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is FetchNews) {
      List<News> news = await NewsApiServices().getNews();

      yield NewsLoaded(news: news);
      print(news);
    }
  }
}
