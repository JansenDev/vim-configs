# Commands

# Utilities commands

## neofetch

Ver logo e información del sistema

## htop

Ver procesos del sistema en la terminal  

`
 q    -> salir
`
## ncdu

Ver el tamaño de las carpetas en el sistema

## figlet


Imprime el texto pasado en simbolos

``` bash
> figlet texto

```
## tree

``` bash 
> tree path
```

Muestra la estructura en forma de arbol

## bc

Calculadora simple en la terminal.
`quit` para salir

## date

Hora actual de la pc

## man

``` bash
> man date 
```

Breve documentación de un comando determinado

## history

Muestra el historial de todos los comandos ejecutados

# Busqueda

## grep

``` bash
> grep -n -r myFile.txt -e myWordToSearch
> grep -R wordToSearch myPath  
> grep -Ril wordToSearch myPath  
> grep -l palabra_a_buscar ./*
```

- **R**: buscar los archivos de forma recursiva en subdirectorios,
- **i**: ignora mayusculas y minusculas.
- **l**: mostrar nombres de los archivos en lugar de partes del contenido del archivo 
- **e**: expresión a buscar
- **r**: muestra los directorios que tengan archivos con la palabra buscada
- **n**: muestra el NUMERO DE LINEA en que se encuentra la palabra buscada

*Nota: -L muestra los nombres de  los archivos que no contienen la pabrabra*

## find

``` bash
> find myPath -name myFile.php
> find mypath -type d 
```
*d:directorio*


# Path

## pwd

print working directory

Devuelve nuestra ruta actual

## ls

lista el contenido de una ruta
``` bash
> ls myPath
```
- **l**: Lista con detalles y vertical
- **h**: Listado legible para humanos
- **a**: Muestra los archivos ocultos
- **S**: Muestra el tamaño de los archivos(descendente)
- **R**: Muestra los directorios de manera recursiva

## cd

Change directory
``` bash
> cd Descargas   ->ir a una ruta
> cd ..    ->Retroceder nivel
> cd /     ->Path /
> cd ~     ->Path /Home
> cd -     ->Muestra la ultima ruta situtada
```

E.g:
``` bash
> cd ~/Escritorio    
 
```


# Copiar, mover y eliminar 

## cp

### copiar

``` bash
> cp file.txt
> cp ~/carpeta/file.txt

```
## rm

#### remove

``` bash
> rm file.txt
> rm ~/myCarpeta/file.txt  
> rm  myDirectory -r  

```
- **-r**: recursirve - remueve directorio y su contenido

## mv

### move

``` bash
> mv rutaArchivo destino  
```
E.g 
``` bash
> mv ~/myCarpeta/file.txt ~/Escritorio  
> mv oldFile.txt Path/newName.txt

```

# Directorio y archivos

## mkdir

Crea una nueva carpeta en la ruta especificada  
``` bash
> mkdir path
```

## touch

Crea un archivo en el directorio situado  
``` bash
> touch path
```

## nano

Ver y editar archivos  
``` bash
> nano path
```

## cat

Ver archivos desde consola  

```bash
> cat path
```

## less

Mostrar de manera paginada el texto de un archivo  

``` bash
> less path
```



# alias

``` bash
> alias myAliasName='myCommands'
```

*Nota:se guarda en ~/Home/.bashrc para que persista en la terminal*

# curl  

Nos permite descargar archivos desde la terminal  

```bash
> curl myUrl.jpg -o myPath/file.jpg -s 
```

- **o**: output  - Salida del archivo
- **s**: Silence - No muestra el medido de progreso


# Zip commands

## zip

```bash
> zip myZipName.zip myfiles
```
E.g
 
```bash
> zip misArchivos.zip *.jpg
```

## unzip

``` bash
> unzip -l myZip.zip -d myPath 
```
- **l**: lista en consola lo que se descomprimió
- **d**: salida del directorio
  

## unar

``` bash
> unar  myZip.zip -d -o myPath
```
- **d**: descromprime con el mismo nombre 
- **o**: salida del directorio

## tar.gz

Agrupa los archivos, no comprime
``` bash
> tar cfz myTarName.tar.gz myFiles
```
Dessagrupar archivos 

``` bash
> tar xfz myTar.tar.gz mypath
```

- **c**: create
- **x**: extract
- **f**:files
- **zip**: zip


# Permisos de usuario

## chmod

Cambia permisos los permisos a  un archivo o directorio

``` bash
> chmod RootGroupAnyone myPath
```
Example:

``` bash
> chmod 777 myDirectory
```

``` bash
//Ouput:
drwxrwxrwx NameRoot NameUser sizeFile dateCreation timeCreation nameFile
```
 
> d: tipo de archivo(en este caso un directorio)  
> r: read  
> w: write  
> x: eXecute  

* rwx: Root
* rwx: Group(users)
* rwx: AnyOne


## super su 

Permite acceder al sistema completamente sin restriccion

``` bash 
> super su
```

## crontab

``` bash
> crontab
```

En el editor:

``` bash
##
## minuto  hora  diaDelMes   mesDelAño  diaDeLaSemana      Command
   0-59    0-23     1-31       1-12         0-7             script
    *         *       *           *          *                *
```

*=cada minuto  
1=En un tiempo determinado  
1,2,3= los minutos 1,2,3  
1-10 = primeros 10 minutos  
*/x= cada x tiempo  

***Nota: Se puede usar plataformas de internet para hacerlo rapido y sencillo***




