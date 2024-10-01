import 'package:bretify_mvp/features/home/cubit/cubit_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton(
      {super.key,
      this.btnPosition,
      required this.btnIcon,
      required this.heroTag});
  final Alignment? btnPosition;
  final IconData btnIcon;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitIndicator, bool>(
      builder: (context, state) => Align(
        alignment: btnPosition ?? Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          heroTag: heroTag,
          onPressed: () => _dialogBuilder(context),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Icon(btnIcon),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    // Usa el contexto original que contiene el BlocProvider
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        final cubit = context.read<CubitIndicator>();

        // Controladores de texto para los campos del formulario
        final TextEditingController nameController = TextEditingController();
        final TextEditingController emailController = TextEditingController();

        return AlertDialog(
          title: const Text('Formulario personalizado'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Campo de texto para el nombre
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingresa tu nombre',
                ),
              ),
              const SizedBox(height: 10),
              // Campo de texto para el correo electrónico
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'Ingresa tu correo',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.pop(dialogContext); // Cerrar el diálogo
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enviar'),
              onPressed: () {
                // Realiza la acción que desees con los datos ingresados
                String name = nameController.text;
                String email = emailController.text;

                // Activar el estado en el cubit si lo deseas
                cubit.activateIndicator();

                // Puedes hacer algo con los datos aquí
                print('Nombre: $name, Correo: $email');

                Navigator.of(dialogContext).pop(); // Cerrar el diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
