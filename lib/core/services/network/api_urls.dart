class ApiUrls {
  static const baseUrl = 'http://10.0.2.2:8082/api/v1/';
  static const signup = '${baseUrl}auth/register';
  static const login = '${baseUrl}auth/login';
  static const refresh = '${baseUrl}auth/refresh';
  static const logout = '${baseUrl}auth/logout';
  static const profile = '${baseUrl}user/profile/get-user';
}