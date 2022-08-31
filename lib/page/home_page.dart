import 'package:flutter/material.dart';
import 'package:flutter_weather_app/consts/consts.dart';
import 'package:flutter_weather_app/main.dart';
import 'package:flutter_weather_app/page/widgets/sun_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController? _animationController;
  late MediaQueryData? _mediaQueryData;
  late Tween<Offset> _firstTween;
  late Tween<Offset> _secondTween;
  late Animation<Offset> _firstAnimation;
  late Animation<Offset> _secondAnimation;
  int? _counter = 0;
  String? buttonText = 'Dark mode';

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    super.initState();
  }

  late ThemeData? _theme;
  @override
  void didChangeDependencies() {
    _theme = Theme.of(context);
    _mediaQueryData = MediaQuery.of(context);
    _firstTween = Tween(begin: Offset.zero, end: const Offset(-3, 0));
    _secondTween = Tween(begin: const Offset(3, 0), end: Offset.zero);

    _firstAnimation = _firstTween.animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.bounceIn));
    _secondAnimation = _secondTween.animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.bounceOut));
    super.didChangeDependencies();
  }

  void _changeThemeCallBack() {
    currentTheme.value == ThemeMode.light
        ? currentTheme.value = ThemeMode.dark
        : currentTheme.value = ThemeMode.light;

    _animationController!.status == AnimationStatus.completed
        ? _animationController!.reverse()
        : _animationController!.forward();

    if (currentTheme.value == ThemeMode.light) {
      buttonText = 'Dark mode';
      setState(() {});
    } else {
      buttonText = 'Light mode';
      setState(() {});
    }
    _counter = _counter! + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme!.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SlideTransition(
                position: _firstAnimation,
                child: const SunWidget(
                  icon: AppConsts.sun,
                  color: Color(0xFFDADF85),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: SlideTransition(
                position: _secondAnimation,
                child:
                    const SunWidget(icon: AppConsts.moon, color: Colors.white),
              ),
            ),
            Container(
                alignment: Alignment.topCenter,
                transform: Matrix4.translationValues(100, 120, 0)..scale(0.5),
                child: Image.asset(
                  AppConsts.cloud,
                )),
            Positioned(
                top: _mediaQueryData!.size.height * 0.3,
                bottom: .0,
                left: .0,
                right: .0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                      width: _mediaQueryData!.size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OutlinedButton.icon(
                            // visualDensity: const VisualDensity(
                            //     horizontal: 0, vertical: -4),
                            // padding:
                            //     const EdgeInsets.only(left: 10, right: 10),
                            onPressed: _changeThemeCallBack,
                            icon: const Icon(Icons.play_arrow),
                            label: Text(buttonText!),
                          ),
                          SizedBox(
                            width: _mediaQueryData!.size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  switchInCurve: Curves.easeIn,
                                  transitionBuilder: (child, animation) =>
                                      SlideTransition(
                                    position: Tween<Offset>(
                                            begin: const Offset(-2, 0),
                                            end: const Offset(0, 0))
                                        .animate(animation),
                                    child: FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    ),
                                  ),
                                  child: Text(
                                    '14',
                                    key: UniqueKey(),
                                    style: _theme!.textTheme.bodyMedium!
                                        .copyWith(fontSize: 60),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  switchInCurve: Curves.easeIn,
                                  transitionBuilder: (child, animation) =>
                                      SlideTransition(
                                    position: Tween<Offset>(
                                            begin: const Offset(2, 0),
                                            end: const Offset(0, 0))
                                        .animate(animation),
                                    child: FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    ),
                                  ),
                                  child: Column(
                                    key: UniqueKey(),
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            AppConsts.rainy,
                                            width: 30,
                                          ),
                                          Text(
                                            'rainy',
                                            style: _theme!.textTheme.bodyMedium!
                                                .copyWith(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            AppConsts.rainy,
                                            width: 30,
                                          ),
                                          Text(
                                            'rainy',
                                            style: _theme!.textTheme.bodyMedium!
                                                .copyWith(fontSize: 15),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: _theme!.cardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: SizedBox(
                                width: _mediaQueryData!.size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Today'.toUpperCase(),
                                        style: _theme!.textTheme.bodyMedium!
                                            .copyWith(fontSize: 15),
                                      ),
                                      Expanded(
                                          child: ListView.builder(
                                              itemCount: 20,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  AspectRatio(
                                                    aspectRatio: 1.5 / 2,
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          getText('00'),
                                                          Flexible(
                                                            child: Image.asset(
                                                              AppConsts.rainy,
                                                              width: 40,
                                                            ),
                                                          ),
                                                          getText('14'),
                                                          getText('9 km/h')
                                                        ],
                                                      ),
                                                    ),
                                                  ))),
                                      getText('Next 5 Days'.toUpperCase()),
                                      Expanded(
                                          child: ListView.builder(
                                              itemCount: 5,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  AspectRatio(
                                                    aspectRatio: 1.5 / 2,
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          getText(
                                                              'day of week'),
                                                          Flexible(
                                                            child: Image.asset(
                                                              AppConsts.rainy,
                                                              width: 40,
                                                            ),
                                                          ),
                                                          getText('14'),
                                                          getText('9 km/h')
                                                        ],
                                                      ),
                                                    ),
                                                  ))),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }

  Widget getText(String? text) => Text(
        text!,
        style: _theme!.textTheme.bodyMedium!.copyWith(fontSize: 15),
      );
}
