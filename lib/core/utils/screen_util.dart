import 'package:flutter/material.dart';

class ScreenUtil {
  static ScreenUtil instance = ScreenUtil();

  int width;
  int height;
  bool allowFontScaling;

  static MediaQueryData? _mediaQueryData;
  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;
  static double _screenHeightNoPadding = 0.0;
  static double _pixelRatio = 0.0;
  static double _statusBarHeight = 0.0;
  static double _bottomBarHeight = 0.0;
  static double _textScaleFactor = 0.0;
  static Orientation? _orientation;

  ScreenUtil({
    this.width = 1080,
    this.height = 1920,
    this.allowFontScaling = false,
  });

  static ScreenUtil getInstance() {
    return instance;
  }

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
    _orientation = mediaQuery.orientation;
    _screenHeightNoPadding = mediaQuery.size.height - _statusBarHeight - _bottomBarHeight;
  }

  static MediaQueryData? get mediaQueryData => _mediaQueryData;

  static double get textScaleFactory => _textScaleFactor;

  static double get pixelRatio => _pixelRatio;

  static Orientation? get orientation => _orientation;

  static double get screenWidth => _screenWidth;

  static double get screenHeight => _screenHeight;

  static double get screenWidthPx => _screenWidth * _pixelRatio;

  static double get screenHeightPx => _screenHeight * _pixelRatio;

  static double get screenHeightNoPadding => _screenHeightNoPadding;

  static double get statusBarHeight => _statusBarHeight * _pixelRatio;

  static double get bottomBarHeight => _bottomBarHeight * _pixelRatio;

  get scaleWidth => _screenWidth / instance.width;

  get scaleHeight => _screenHeight / instance.height;

  setWidth(int width) => width * scaleWidth;

  setHeight(int height) => height * scaleHeight;

  setSp(int fontSize) => allowFontScaling ? setWidth(fontSize) : setWidth(fontSize) / _textScaleFactor;
}
