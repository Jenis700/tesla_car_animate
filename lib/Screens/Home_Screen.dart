import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_car_animate/Model/TyrePsi.dart';
import 'package:tesla_car_animate/constants.dart';
import 'package:tesla_car_animate/home_controller.dart';
import 'Components/Tyare_psi_card.dart';
import 'Components/bettery_status.dart';
import 'Components/door_lock.dart';
import 'Components/temp_details.dart';
import 'Components/tesla_bottom_navigation_bar.dart';
import 'Components/tyares.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _betteryAnimationController;
  late Animation<double> _animationBettery;
  late Animation<double> _animationBetteryStatus;

  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationTempDetails;
  late Animation<double> _animationCoolGlow;

  late AnimationController _tyreAnimationController;
  late Animation<double> _animationTyre1;
  late Animation<double> _animationTyre2;
  late Animation<double> _animationTyre3;
  late Animation<double> _animationTyre4;

  late List<Animation<double>> _tyreAnimations;

  void setUpBatterAnimation() {
    _betteryAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _animationBettery = CurvedAnimation(
      parent: _betteryAnimationController,
      curve: Interval(0.0, 0.5),
    );

    _animationBetteryStatus = CurvedAnimation(
      parent: _betteryAnimationController,
      curve: Interval(0.5, 1),
    );
  }

  void setupTempAnimation() {
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animationCarShift = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.2, 0.4),
    );

    _animationTempDetails = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.45, 0.65),
    );

    _animationCoolGlow = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.7, 1),
    );
  }

  void setUptyreAnimation() {
    _tyreAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _animationTyre1 = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.32, 0.5));
    _animationTyre2 = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.5, 0.66));
    _animationTyre3 = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.66, 0.82));
    _animationTyre4 = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.82, 1));
  }

  @override
  void initState() {
    super.initState();
    setUpBatterAnimation();
    setupTempAnimation();
    setUptyreAnimation();
    _tyreAnimations = [
      _animationTyre1,
      _animationTyre2,
      _animationTyre3,
      _animationTyre4 ,
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _betteryAnimationController.dispose();
    _tempAnimationController.dispose();
    _tyreAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _controller,
        _betteryAnimationController,
        _tempAnimationController,
        _tyreAnimationController,
      ]),
      builder: (context, _) {
        return Scaffold(
          bottomNavigationBar: TeslaBottomNavigationBar(
            onTap: (index) {
              if (index == 1)
                _betteryAnimationController.forward();
              else if (_controller.selectedottomTab == 1 && index != 1)
                _betteryAnimationController.reverse(from: 0.7);
              if (index == 2)
                _tempAnimationController.forward();
              else if (_controller.selectedottomTab == 2 && index != 2)
                _tempAnimationController.reverse(from: 0.4);

              if (index == 3)
                _tyreAnimationController.forward();
              else if (_controller.selectedottomTab == 3 && index != 3)
                _tyreAnimationController.reverse(from: 1);

              _controller.showTyres(index);
              _controller.tyreStatus(index);
              _controller.onBottomTapChange(index);
            },
            selectedTab: _controller.selectedottomTab,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: constrains.maxWidth,
                      height: constrains.maxHeight,
                    ),
                    Positioned(
                      left: constrains.maxWidth / 2 * _animationCarShift.value,
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: constrains.maxHeight * 0.1,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Car.svg",
                          width: double.infinity,
                        ),
                      ),
                    ),

// locks............................................................................

                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: _controller.selectedottomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isRightDoorlock,
                          press: _controller.updateRightDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: _controller.selectedottomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isleftDoorLock,
                          press: _controller.updateLeftDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: _controller.selectedottomTab == 0
                          ? constrains.maxWidth * 0.28
                          : constrains.maxWidth / 1.2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isBonnetLock,
                          press: _controller.updateBonnetLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _controller.selectedottomTab == 0
                          ? constrains.maxWidth * 0.35
                          : constrains.maxWidth / 1.2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isBottomDoorLock,
                          press: _controller.updateBottomDoorLock,
                        ),
                      ),
                    ),
// Battery............................................................................
                    Opacity(
                      opacity: _animationBettery.value,
                      child: SvgPicture.asset(
                        "assets/icons/Battery.svg",
                        width: constrains.maxWidth * 0.44,
                      ),
                    ),

// Battery status......................................................................

                    Positioned(
                      top: 50 * (1 - _animationBetteryStatus.value),
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Opacity(
                        opacity: _animationBetteryStatus.value,
                        child: BetteryStatus(constrains: constrains),
                      ),
                    ),

// Temp details......................................................................

                    Positioned(
                      top: 60 * (1 - _animationTempDetails.value),
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Opacity(
                        opacity: _animationTempDetails.value,
                        child: TempDetails(controller: _controller),
                      ),
                    ),
                    Positioned(
                      right: -180 * (1.1 - _animationCoolGlow.value),
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: _controller.isCoolSelectedTab
                            ? Image.asset(
                                "assets/images/Cool_glow_2.png",
                                width: 200,
                                key: UniqueKey(),
                              )
                            : Image.asset(
                                "assets/images/Hot_glow_4.png",
                                width: 230,
                                key: UniqueKey(),
                              ),
                      ),
                    ),
                    if (_controller.showTyre) ...tyres(constrains),
                    if (_controller.isShowTyresStatus)
                      GridView.builder(
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                constrains.maxWidth / constrains.maxHeight,
                            crossAxisCount: 2,
                            crossAxisSpacing: defaultPadding,
                            mainAxisSpacing: defaultPadding),
                        itemBuilder: (context, index) => ScaleTransition(
                          scale: _tyreAnimations[index],
                          child: TyrePsiCard(
                            isottomTwoTyre: index > 1,
                            tyrePsi: demoPsiList[index],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
