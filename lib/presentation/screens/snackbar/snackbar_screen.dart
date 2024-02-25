import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class SnackbarsScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarsScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        
        title: const Text('¿Estas seguro?'),
        content: const Text('Irure dolor sit proident velit fugiat officia aliqua officia anim irure.'),
        actions: [
          TextButton(onPressed: ()=>context.pop(), 
          child: const Text('Cancelar')),
          FilledButton(onPressed: ()=>context.pop(), 
          child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Culpa occaecat excepteur consequat nisi proident et velit cillum cillum consequat pariatur. Eiusmod do dolore ut irure labore proident ad veniam consectetur labore dolor tempor fugiat. Lorem esse laboris officia id enim nisi sit sint veniam elit eu duis.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context), 
                child: const Text('Mostrar Dialogo'),
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
