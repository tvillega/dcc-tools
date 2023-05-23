# DCC Tools

Repositorio con scripts para manejar más facilmente el servidor del departamento.

## Instalación

Ingresar al servidor anakena:
```
$ ssh user@anakena.dcc.uchile.cl
```
Reemplazar *user* con el designado por el departamento

Crear directorio para los ejecutables:
```
$ mkdir -p ~/.local/bin
```

Editar el archivo `.bashrc` para añadir la nueva ruta:
```
$ nano ~/.bashrc
---
# No borrar contenido anterior, añadir esto al final
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
```

Editar el archivo `.profile` para apuntar al anterior:
```
$ nano ~/.profile
---
# No borrar contenido anterior, añadir esto al final
. .bashrc
```

Aplicar los cambios instantáneamente:
```
$ source ~/.bashrc
```

Crear directorio para *source code*:
```
$ mkdir -p ~/.local/src
```

Ir al directorio de *source code*:
```
$ cd ~/.local/src
```

Clonar este repositorio:
```
$ git clone https://github.com/tvillega/dcc-tools.git
```

Instalar herramientas deseadas (e.g. `imprime`):
```
$ ln -s ${HOME}/.local/src/dcc-tools/imprime ${HOME}/.local/bin/imprime
```

# Herramientas disponibles

## Imprimir

```
$ imprime --help
---
Script para imprimir en el dcc
  --help         | -h       - Print this help message
  --lorenzo      | -lp      - Usar impresora del pasillo Lab Lorenzo
  --toqui        | -tp      - Usar impresora en Lab Toqui
  --file    FILE | -f FILE  - Archivo a imprimir, DEBE ser pdf
                              se incluye la conversión a PostScript
  --single       | -s       - Imprimir por una sola cara de la hoja
  --duplex       | -d       - Imprimir por ambas caras de la hoja
```
