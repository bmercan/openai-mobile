import 'package:flutter/material.dart';
import 'package:mobile_gpt/mainstructure.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            featureSelectButton("Chat-GPT"),
            featureSelectButton("Dall-E 2"),
          ],
        ),
      ),
    );
  }

  Widget featureSelectButton(String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MainStructure(feature: title == "Chat-GPT" ? 1 : 0)));
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.inverseSurface)),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 48),
          )),
        ),
      ),
    );
  }

  String chatGptPlaceholder =
      '''Sed imperdiet volutpat mi, sit amet accumsan ante commodo id. Aliquam pellentesque viverra magna ac viverra. Aliquam suscipit ornare urna et egestas. Donec mattis velit vitae dui varius commodo. Sed consectetur tristique odio, vel dictum leo convallis non. Sed non imperdiet nibh. Aliquam et laoreet risus. Nulla condimentum eget risus et placerat. Nulla nec faucibus libero, ac rhoncus risus. Ut molestie placerat semper. Sed elit odio, placerat eget quam in, elementum dictum augue.Pellentesque congue tempus lacinia. Nulla quis sagittis libero. Ut cursus diam id nisi rhoncus, venenatis malesuada mi consequat. Aenean viverra lorem velit, congue egestas lacus pulvinar eget. Ut congue pulvinar lectus, eget posuere arcu blandit sit amet. Mauris porttitor velit sed purus semper maximus. Pellentesque ornare augue a enim facilisis, vitae viverra nisl hendrerit.Quisque sed velit pellentesque, tempus urna nec, elementum massa. Nam varius mattis justo, nec consectetur odio pretium mollis. Sed nec augue a enim sollicitudin sagittis sit amet in turpis. Quisque sollicitudin libero massa, sit amet eleifend dui faucibus at. Aenean id felis sit amet velit rutrum rhoncus. Aliquam erat volutpat. Nam ut commodo justo. Cras volutpat mattis erat, at ultricies quam cursus sit amet. Nulla egestas, mauris non convallis ultrices, justo risus convallis nisl, a finibus ex risus eu nulla.Mauris accumsan varius tristique. Ut molestie metus nec eros pretium, nec finibus ante consequat. Sed a ultricies magna. Vestibulum convallis lectus nec tortor tincidunt, ut suscipit quam hendrerit. Ut a ligula mattis, suscipit augue a, blandit felis. Ut ligula justo, fermentum quis iaculis eu, posuere ut nisl. Nam nec risus ac nulla imperdiet iaculis. Donec at porttitor velit, et vehicula dui. Nunc iaculis elit gravida erat venenatis pretium. Nunc nec libero nec leo feugiat ullamcorper et vitae risus.''';
  String dallePlaceholder =
      'https://www.digitaltrends.com/wp-content/uploads/2022/10/DALL-E-2-Image-on-OpenAI.jpg?p=1';
}
