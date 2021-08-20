part of 'services.dart';

class NewsApiServices {
  Dio _dio;

  NewsApiServices() {
    _dio = Dio();
  }

  Future<List<News>> getNews() async {
    try {
      Response response = await _dio.get(baseUrl);
     

      return (response.data as List).map((e) => News.fromJson(e)).toList()  ;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<void> refreshGetNews() async {
    try {
           Response response = await _dio.get(baseUrl);
     

      return (response.data as List).map((e) => News.fromJson(e)).toList()  ;
    }
    on DioError catch (e) {
      print(e);
    }
  }
}
