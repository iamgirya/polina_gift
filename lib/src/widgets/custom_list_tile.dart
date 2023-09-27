import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.onTap,
    this.child,
  });
  final String title;
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 18,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99.0),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        splashColor: const Color.fromARGB(255, 32, 0, 87).withOpacity(0.1),
        highlightColor: Colors.transparent,
        onPressed: onTap,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple,
                Color.fromARGB(255, 131, 10, 224),
                Colors.deepPurple,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(99.0)),
          ),
          height: 45,
          child: Container(
            alignment: Alignment.center,
            child: child ??
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 220),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
          ),
        ),
      ),
    );
  }
}
