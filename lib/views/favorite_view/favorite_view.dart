import 'package:flutter/cupertino.dart';

import 'package:marengoo/widgets/text_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const TextWidget(
        title: "Favorite VIew",
      ),
    );
  }
}
