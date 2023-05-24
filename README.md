# DCC Tools

Repositorio con scripts para manejar más facilmente el servidor del departamento.

## Instalación

1. Ingresar al servidor anakena:
> Reemplazar *user* con el designado por el departamento.
```
$ ssh user@anakena.dcc.uchile.cl
```

2. Crear directorio para los ejecutables:
```
$ mkdir -p ~/.local/bin
```

3. Editar el archivo `.bashrc` para añadir la nueva ruta:
> Así el comando estará disponible en los Lab Lorenzo|Toqui.
```
$ nano ~/.bashrc
---
# No borrar contenido anterior, añadir esto al final
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
```

4. Editar el archivo `.profile` para apuntar al anterior:
> Así el comando estará disponible al hacer ssh.
```
$ nano ~/.profile
---
# No borrar contenido anterior, añadir esto al final
source .bashrc
```

5. Aplicar los cambios instantáneamente:
```
$ source ~/.bashrc
```

6. Crear directorio para *source code*:
```
$ mkdir -p ~/.local/src
```

Ir al directorio de *source code*:
```
$ cd ~/.local/src
```

7. Clonar este repositorio:
```
$ git clone https://github.com/tvillega/dcc-tools.git
```

8. Instalar herramientas deseadas (e.g. `imprime`):
```
$ ln -s ${HOME}/.local/src/dcc-tools/imprime ${HOME}/.local/bin/imprime
```

## Actualización

Para actualizar las herramientas:
```
$ cd ~/.local/src/dcc-tools
$ git pull
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
