import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.title, required this.callback});

  final String title;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 20, 30, 0),
        child: InkWell(
          onTap: () => callback(),
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          splashColor: const Color.fromARGB(163, 158, 158, 158),
          child: Ink(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .inverseSurface
                        .withOpacity(.3),
                    blurRadius: 3.0,
                    offset: const Offset(2, 4)),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () => callback(),
                    icon: Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    iconSize: 26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
