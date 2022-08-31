import 'package:flutter/material.dart';
import 'package:unite_board/view/home.dart';

class Info extends StatelessWidget{
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(16, 27, 73, 1.0),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All assets, images and texts are owned by © 2022 Pokémon. ©1995–2022 Nintendo Creatures Inc. / GAME FREAK inc. © 2022 Tencent. All rights reserved.\n\nWe are not affiliated, associated, authorized, endorsed by, or in any way officially connected with any of the listed companies.Unite board provides based on Pokémon Unite guideline.\n\n',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  Text(
                    'ref: https://www.pokemonunite.jp/ja/guideline/210922/',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  ElevatedButton.icon(
                    label: Text(
                      'OK',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home(),));
                    }, icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}