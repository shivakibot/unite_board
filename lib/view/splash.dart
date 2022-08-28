import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewModel/splashVM.dart';
import 'home.dart';

class Splash extends ConsumerStatefulWidget{
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends ConsumerState<Splash>{
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => ref.read(splashProvider.notifier).triggered());
  }

  @override
  Widget build(BuildContext context) {
    final triggered = ref.watch(splashProvider);
    if(triggered){
      Future(()=>Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (context) {
            return const Home();
        },)));
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }else{
      return Scaffold(
        backgroundColor: const Color.fromRGBO(16, 27, 73, 1.0),
        key: const Key('splash'),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Logo(),
                Text(
                  'unite board',
                  style: TextStyle(
                    fontSize: Theme.of(context).primaryTextTheme.headline5?.fontSize,
                    color: Theme.of(context).primaryTextTheme.headline5?.color,
                  ),
                ),
              ],
            )
        ),
      );
    }
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('logo'),
      child: CircleAvatar(
        maxRadius: 40,
        minRadius: 20,
        backgroundColor: Colors.transparent,
        child: Image.asset('assets/unite_board_Icon.png'),
      ),
    );
  }
}