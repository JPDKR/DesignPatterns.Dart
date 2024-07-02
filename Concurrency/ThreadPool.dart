import 'dart:async';

// Función principal del programa
void main() async {
  // Lista de tareas (Futures)
  List<Future<void>> tasks = [];

  for (int i = 0; i < 10; i++) {
    int taskNo = i;

    // Crear y añadir la tarea a la lista
    tasks.add(Future(() async {
      print('Task $taskNo is running on thread');
      await Future.delayed(Duration(seconds: 1));
    }));
  }

  // Imprimir que todas las tareas están en cola
  print('All tasks queued.');

  // Esperar a que todas las tareas completen
  await Future.wait(tasks);

  print('All tasks completed.');
}
