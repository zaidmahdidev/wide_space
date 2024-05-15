import 'dart:developer';

class DataSourceURL {
  static const String _debugBaseUrl = 'https://ebnbalady.widespace.tech/';

  static const String _myEndPoint = 'api/v1/users/me';
  static const String _signUpEndPoint = 'api/v1/users';
  static const String _signInEndPoint = 'api/v1/login';
  static const String _postEndPoint = 'api/v1/posts';
  static const String _userEndPoint = 'api/v1/users';
  static const String _changePassword = '';
  static String profile = 'api/v1/profile';

  static String verifyOTP = '';
  static String resendOTP = '';
  static String forgetPassword = '';
  static String googleDirections =
      'https://maps.googleapis.com/maps/api/directions/json?';
  static String servicePoints = 'api/v2/service_points';

  static String get getDebugBaseUrlEndPoint => _debugBaseUrl;

  static String get getMyEndPoint => _debugBaseUrl + _myEndPoint;

  static String get getLoginEndPoint => _debugBaseUrl + _signInEndPoint;

  static String get getSignupEndPoint => _debugBaseUrl + _signUpEndPoint;

  static String get getChangePasswordPoint => _debugBaseUrl + _changePassword;

  static String getUserEndPoint({int? userId, int pageNumber = 1}) =>
      userId == null
          ? "$_debugBaseUrl$_userEndPoint?page=$pageNumber&limit=15"
          : '$_debugBaseUrl$_userEndPoint/$userId';

  static String getPostEndPoint({int? postId, int? pageNumber}) {
    log("$_debugBaseUrl$_postEndPoint?page=$pageNumber&limit=15");
    return postId == null
        ? "$_debugBaseUrl$_postEndPoint?page=$pageNumber&limit=15"
        : '$_debugBaseUrl$_postEndPoint/$postId';
  }

  static String getPostLikeEndPoint({required int postId}) =>
      '$_debugBaseUrl$_postEndPoint/$postId/like';

  static String getCommentEndPoint(
          {required int postId, int? commentId, int? pageNumber}) =>
      commentId == null
          ? '$_debugBaseUrl$_postEndPoint/$postId/comments?page=$pageNumber&limit=15'
          : '$_debugBaseUrl$_postEndPoint/$postId/comments/$commentId';

  static String getCommentLikeEndPoint(
          {required int postId, required int commentId}) =>
      '$_debugBaseUrl$_postEndPoint/$postId/comments/$commentId/upvote';

  static String getCommentDislikeEndPoint(
          {required int postId, required int commentId}) =>
      '$_debugBaseUrl$_postEndPoint/$postId/comments/$commentId/downvote';
}
