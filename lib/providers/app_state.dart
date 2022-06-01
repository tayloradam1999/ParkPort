import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class AppState extends ChangeNotifier {
  bool _isBusy = false;
  bool get isbusy => _isBusy;
  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  PPUser _currentUser = PPUser(
      userID: '',
      email: '',
      userName: '',
      status: 'Excited about Tulsa parks!',
      location: 'Tulsa, OK',
      dateJoined: DateTime.now(),
      profilePicUrl: 'https://picsum.photos/100/100',
      points: 0,
      friendList: [],
      collectedStampList: []);
  PPUser get currentUser => _currentUser;

  int _pageIndex = 0;
  int get pageIndex {
    return _pageIndex;
  }

  set setpageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
