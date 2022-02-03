import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int selectedottomTab = 0;

  void onBottomTapChange(int index) {
    selectedottomTab = index;
    notifyListeners();
  }

  // For door locks

  bool isRightDoorlock = true;
  bool isleftDoorLock = true;
  bool isBonnetLock = true;
  bool isBottomDoorLock = true;

  void updateRightDoorLock() {
    isRightDoorlock = !isRightDoorlock;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isleftDoorLock = !isleftDoorLock;
    notifyListeners();
  }

  void updateBonnetLock() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void updateBottomDoorLock() {
    isBottomDoorLock = !isBottomDoorLock;
    notifyListeners();
  }

  // For cool and Heat Button
  bool isCoolSelectedTab = true;

  void upadteIsSelectedTab() {
    isCoolSelectedTab = !isCoolSelectedTab;
    notifyListeners();
  }

  //For tyres
  bool showTyre = false;

  void showTyres(int index) {
    if (selectedottomTab != 3 && index == 3) {
      Future.delayed(
        Duration(milliseconds: 400),
        () {
          showTyre = true;
          notifyListeners();
        },
      );
    } else {
      showTyre = false;
      notifyListeners();
    }
  }

  bool isShowTyresStatus = false;

  void tyreStatus(int index) {
    if (selectedottomTab != 3 && index == 3) {
      isShowTyresStatus = true;
      notifyListeners();
    } else {
      Future.delayed(
        Duration(milliseconds: 400),(){
        isShowTyresStatus = false;
        notifyListeners();
      }
      );

    }
  }
}
