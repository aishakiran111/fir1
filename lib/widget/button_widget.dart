import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required String this.text,
      required VoidCallback this.onTap,
      this.loading = false});
  final String text;
  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
