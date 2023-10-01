# DCC Tools

Repositorio con scripts para manejar más facilmente el servidor del departamento.

Inspirado en `[scoop](https://scoop.sh)`.

## Instalación

### Preparar la cuenta

1. Ingresar al servidor anakena:
> Reemplazar *user* con el designado por el departamento.
```
ssh user@anakena.dcc.uchile.cl
```

2. Crear directorio para los ejecutables:
```
mkdir -p ~/.local/bin
```

3. Editar el archivo `.bashrc` para añadir la nueva ruta:
> Así el comando estará disponible en los Lab Lorenzo|Toqui.
```
nano ~/.bashrc
```
```
# No borrar contenido anterior, añadir esto al final
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
```

4. Editar el archivo `.profile` para apuntar al anterior:
> Así el comando estará disponible al hacer ssh.
```
nano ~/.profile
```
```
# No borrar contenido anterior, añadir esto al final
source .bashrc
```

5. Aplicar los cambios instantáneamente:
```
source ~/.bashrc
```

6. Crear directorio para *source code*:
```
mkdir -p ~/.local/src
```

### Obtener el administrador de paquetes `dcc-tools`

1. Clonar este repositorio:
```
$ git clone https://github.com/tvillega/dcc-tools.git ~/.local/src/dcc-tools
```

3. Habilitar el ejecutable:
```
$ ln -s ${HOME}/.local/src/dcc-tools/dcc-tools ${HOME}/.local/bin/dcc-tools
```

## Comandos

Listar comandos disponibles:
```
dcc-tools help
```
```
  bucket      Administra repositorios externos
  fetch       Descarga actualizaciones
  install     Instala una herramienta
  list        Lista herramientas instaladas
  os-release  Información sobre el servidor
  pull        Aplica las actualizaciones
  remove      Elimina una herramienta
  update      Actualiza todas las herramientas
```

Instalar herramientas:
```
dcc-tools install <tool>
```

Actualizar herramientas:
```
dcc-tools pull
```

Actualizar herramientas (

# Herramientas disponibles

## Imprime

> Instalar con `dcc-tools install imprime`.

```
$ imprime --help
---
Script para imprimir en el dcc
  --help         | -h       - Print this help message
  --more-help    | -hh      - Print extended help message
  --lorenzo      | -lp      - Usar impresora del pasillo Lab Lorenzo
  --toqui        | -tp      - Usar impresora en Lab Toqui
  --file    FILE | -f FILE  - Archivo a imprimir, DEBE ser pdf
                              se incluye la conversión a PostScript
  --single       | -s       - Imprimir por una sola cara de la hoja
  --duplex       | -d       - Imprimir por ambas caras de la hoja
```

## [Zola](https://www.getzola.org)

> Instalar con `dcc-tools install zola`.

```
$ zola --help
---
A fast static site generator with everything built-in

Usage: zola [OPTIONS] <COMMAND>

Commands:
  init        Create a new Zola project
  build       Deletes the output directory if there is one and builds the site
  serve       Serve the site. Rebuild and reload on change automatically
  check       Try to build the project without rendering it. Checks links
  completion  Generate shell completion
  help        Print this message or the help of the given subcommand(s)

Options:
  -r, --root <ROOT>      Directory to use as root of project [default: .]
  -c, --config <CONFIG>  Path to a config file other than config.toml in the root of project [default: config.toml]
  -h, --help             Print help
  -V, --version          Print version
```
