import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

SnackBar errorMessage(String msg) {
  return SnackBar(
    content: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Text(
              "ERROR",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Text(
              msg,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}


SnackBar InfoMessage(String msg) {
  return SnackBar(
    content: Container(
        padding: const EdgeInsets.all(16),
        height: 50,
        width: 30,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
            Text(
              msg,
              style: const TextStyle(color: Color(0xfff9a825), fontSize: 14,fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
