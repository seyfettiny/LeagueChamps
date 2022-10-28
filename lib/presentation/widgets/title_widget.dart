import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final double textScaleFactor;
  const TitleWidget({
    Key? key,
    this.textScaleFactor = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: <Color>[Color(0xff7c5e28), Color(0xffcabd8f)],
      ).createShader(
        const Rect.fromLTWH(0.0, 0.0, 100.0, 50.0),
      ),
      child: Text.rich(
        textScaleFactor: textScaleFactor,
        const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'League',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            TextSpan(
                text: 'Champs', style: TextStyle(fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }
}
