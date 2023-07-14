class ApiendPoint {
  static const String baseUrl = 'http://restapi.adequateshop.com/api/';
  static _AuthEndpoint authEndpoint = _AuthEndpoint();
}

class _AuthEndpoint {
  final String registerEmail = 'authaccount/restration';
  final String loginEmail = 'authaccount/login';
}