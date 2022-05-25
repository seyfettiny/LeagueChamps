import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String title;
  const BlurredAppBar({
    Key? key,
    required this.name,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 48, bottom: 12),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0, 2),
        ),
      ]),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const BackButton(),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis),
                ),
                Expanded(
                  child: Text(
                    ', $title',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(94.0);
}
