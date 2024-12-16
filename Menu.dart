import 'dart:io';

void main() {
  Map<String, double> menuItems = {
    'lasagna': 30.0,
    'taco': 50.0,
    'sopa': 25.0,
    'sándwich': 40.0,
  };

  while (true) {
    print('''
    === Opciones del Menú ===
    1. Ver todos los platillos
    2. Consultar un platillo
    3. Modificar precio de un platillo
    4. Salir
    ''');
    stdout.write('Elige una opción: ');
    String? option = stdin.readLineSync();

    switch (option) {
      case '1':
        mostrarPlatillos(menuItems);
        break;
      case '2':
        stdout.write('Escribe el nombre del platillo a consultar: ');
        String? nombrePlatillo = stdin.readLineSync();
        consultarPlatillo(menuItems, nombrePlatillo);
        break;
      case '3':
        stdout.write('Escribe el nombre del platillo a modificar: ');
        String? nombrePlatillo = stdin.readLineSync();
        stdout.write('Escribe el nuevo precio: ');
        String? nuevoPrecioStr = stdin.readLineSync();
        double? precioActualizado = double.tryParse(nuevoPrecioStr ?? '');
        if (precioActualizado != null) {
          modificarPrecio(menuItems, nombrePlatillo, precioActualizado);
        } else {
          print('Precio no válido. Inténtalo de nuevo.');
        }
        break;
      case '4':
        print('Cerrando el programa...');
        return;
      default:
        print('Opción no válida. Por favor, intenta otra vez.');
    }
  }
}

void mostrarPlatillos(Map<String, double> menu) {
  print('\n=== Listado de Platillos ===');
  menu.forEach((nombre, precio) {
    print('$nombre: \$${precio.toStringAsFixed(2)}');
  });
  print('');
}

void consultarPlatillo(Map<String, double> menu, String? platillo) {
  if (platillo != null && menu.containsKey(platillo)) {
    print('Platillo disponible: $platillo - \$${menu[platillo]!.toStringAsFixed(2)}');
  } else {
    print('El platillo no está en el menú.');
  }
}

void modificarPrecio(Map<String, double> menu, String? platillo, double nuevoPrecio) {
  if (platillo != null && menu.containsKey(platillo)) {
    menu[platillo] = nuevoPrecio;
    print('Precio actualizado exitosamente: $platillo - \$${nuevoPrecio.toStringAsFixed(2)}');
  } else {
    print('No se encontró el platillo en el menú.');
  }
}
