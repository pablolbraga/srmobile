import 'package:flutter/material.dart';

class Uteis {
  static mostrarAviso(BuildContext context, String titulo, String aviso) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(titulo),
        content: Text(aviso),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              })
        ],
      ),
    );
  }
}
