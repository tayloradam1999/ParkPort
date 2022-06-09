import 'package:flutter/material.dart';
import '../models/user.dart';

class AppState extends ChangeNotifier {
  PPUser _currentUser = PPUser(
      userID: '',
      email: '',
      userName: '',
      lowercaseName: '',
      status: 'Excited about Tulsa parks!',
      dateJoined: DateTime.now(),
      profilePicUrl: 'https://picsum.photos/100/100',
      points: 0,
      friendList: [],
      friendNotifs: [],
      collectedStampList: [],
      stampNotifs: [],
      notifs: []);
  PPUser get currentUser => _currentUser;
  set currentUser(PPUser value) {
    _currentUser = value;
    notifyListeners();
  }

  int _pageIndex = 0;
  int get pageIndex {
    return _pageIndex;
  }
  set setpageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
