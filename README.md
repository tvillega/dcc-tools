# DCC Tools

Repositorio con scripts para manejar más facilmente el servidor del departamento.

Inspirado en [`scoop`](https://scoop.sh).

## Instalación

1. Ingresar al servidor anakena:
> Reemplazar *user* con el designado por el departamento.
```
ssh user@anakena.dcc.uchile.cl
```

2. Ejecutar el instalador:
```
curl https://raw.githubusercontent.com/tvillega/dcc-tools/master/install.sh | bash && source ~/.bashrc
```

Para desinstalar, ejecutar:
> Esto eliminará los programas y symlinks creados por `dcc-tools`, así como su source code.
```
dcc-tools remove dcc-tools
```

## Comandos

Listar comandos disponibles:
```
dcc-tools help
```
```
Administrador de paquetes locales para el servidor del dcc

  bucket      Administra repositorios externos **
  fetch       Descarga actualizaciones
  install     Instala un programa **
  list        Lista los programas instalados
  os-release  Información sobre el servidor
  pull        Aplica las actualizaciones
  remove      Quita un programa **
  update      Actualiza todos los repositorios

Vea 'dcc-tools help <command>' para leer acerca de subcomandos especificos,
actualmente sólo disponibles para los marcados con '**'.
```

Instalar un programa:
```
dcc-tools install <tool>
```

Actualizar repositorio actual:
```
dcc-tools pull
```

Actualizar todos los repositorios:
```
dcc-tools update
```

# Programas disponibles

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

## Sitioweb

> Instalar con `dcc-tools install sitioweb`
```
$ sitioweb --help
---
Script para publicar sitio web en el dcc
  --help    - Imprime este mensaje de ayuda
  --archive - Archiva la versión anterior del sitio
  --perms   - Establece permisos de directorios
  --setup   - Alias de '--archive --perms'
```

# Más programas

Se puede añadir repositorios externos, denominados buckets, que contengan otros programas para instalar.

## [dcc-tools-extra](https://github.com/tvillega/dcc-tools-extra)

> Bucket oficial con herramientas no-específicas al dcc.
```
dcc-tools bucket add extra https://github.com/tvillega/dcc-tools-extra.git
```

Para instalar programas de este bucket (e.g. [`zola`](https://www.getzola.org):
```
dcc-tools install extra/zola
```
