import 'package:flutter/material.dart';

class _Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // final completed = context.select((RewardAdmob model) => model.completed);
    // if(completed){
    //   debugPrint('RewardedCm completed');
    //   WidgetsBinding.instance?.addPostFrameCallback((_) {
    //     Navigator.of(context).pushReplacement(fadeTransitionRoute(Maintenance()));
    //     // Navigator.of(context).pop(completed);
    //   });
    //   return Scaffold();
    // }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            const Text('広告を読み込んでいます\n\n通信環境の悪い場合や、\n広告ブロックアプリ等を使用している場合、\n広告の再生ができないことがあります。'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
            ),
            ElevatedButton.icon(
              label: const Text('キャンセル'),
              onPressed: () {
                // Navigator.of(context).pushReplacement(fadeTransitionRoute(Home5()));
              }, icon: const Icon(Icons.arrow_back_ios),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    );
  }

}