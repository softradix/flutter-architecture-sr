

/*
This is a abstract class,
 which declare all the required network requests such as get, post delete etc.
 A class which extends this class, has a responsibility to define each of the declared function.
 */

abstract class IHttpClient {
  Future<dynamic> getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> deleteRequest({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> postRequest({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> uploadRequest({
    required String path,
    dynamic data,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> patchRequest({
    required String path,
    dynamic data,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? headers,
  });
  Future<dynamic> putRequest({
    required String path,
    dynamic data,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? headers,
  });
}