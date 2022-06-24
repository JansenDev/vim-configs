# linea de comandos

---

| Symbol | Path |
| :----: | :--: |
|  `~`   | home |
|  `/`   | raiz |

- clear o ctrl+L = limpia consola

![](https://static.platzi.com/media/user_upload/image-2bc4bcc2-3856-4166-acc6-2e21ce152009.jpg)

---

## ls

listar directorio

```bash
$ls
$ls ./path
$ls -l
```

**Options:**

- -l: long
- -h: human(ver cuanto pesa los archivos en formato humano)
- -a: ver archivos ocultos
- -S: size(ordena por tamaño)
- -r: reverse(mostrar en orden inverso)

---

## tree

lista las carpetas como un arbol

```bash
$tree
$tree -L n
```

**Options:**

- -L: level(profundiza en n numero de niveles)

---

## pwd

Ver la ruta actual situada

```bash
$pwd
```

---

## file

Nos brinda info del archivo

```bash
$file file.md
```

---

## mkdir

Crear un directorio o carpeta

copy

```bash
$mkdir miDirectorio
$mkdir "miDirectorio con espacio"
$mkdir dir1 dir2 dir3
```

---

## touch

Crea uno o varios archivos

```bash
$touch file1.md file2.txt file3.md
```

---

## cp

Copy a file or directory

```bash
$cp file1.md file_backup.md
```

---

## mv

Move a file or directory<br>
_Tambien renombra un archivo o directorio_

```bash
$mv file_backup.md ..
$mv file_backup.md file_newName.md
```

_Nota: `..` mueve el archivo a una nivel atras del directorio actual_

---

## rm

Remove

```bash
$rm file_copy.md
$rm -i file_copy.md
$rm -r dir1
$rm -r dir1 dir2 dir3 "my dir"
```

**Options:**

- -i: interactive
- -r: recursivo(borrado es recursivo básicamente recorrerá cada subcarperta/archivo y las irá borrando uno por uno.)
- -f: force

---

## head

Muestra la cabecera(las primeras lineas) de una archivo

```bash
$head file_copy.md
$head file_copy.md -n 15
```

**options:**

- -n: num(muestra las primeras 15 lineas del archivo) por defecto es 10.

---

## tail

Muestra la cola(ultimas lineas) de una archivo

```bash
$tail file_copy.md
$tail file_copy.md -n 15
```

**options:**

- -n: num(muestra las primeras 15 lineas del archivo) por defecto es 10

---

## less

Muestra todo el archivo de texto con scroll

```bash
$less file_copy.md
```

**_En la interface:_**
/LineaABuscar + enter: buscar texto<br>
q: quit

---

## xdg-open

Abre un archivo especificado

```bash
$xdg-open pathFile
```

---

## nautilus

Abre el directorio especificado

```bash
$nautilus path
```

---

## cat

Muestra informacion de un archivo y/o concatenarlo con otro<br>
_Tambien nos permite sobreescribir una archivo usando `>` o agregar texto con_ `>>`. <br>
**\*Nota**:`ctrl+d` para terminar de editar\*

```bash
$cat error.txt output.txt
$cat > error.txt
$cat >> error.txt
```

---

## nano

Permite editar un archivo

```bash
$nano error.txt
```

---

# UTILIDADES

Muestra infomacion o especiaficaciones de los comandos

```bash
$man tree
$info tree
$whatis git
```

## ifconfig

Ver las redes conectadas

## ping

detectar si hay una conexion con alguna pagina

```bash
$ping url.com
```

## curl

obtiene un documento html

```bash
$curl url.com
```

## wget

Descarga un archivo a la pc

```bash
$wget url.com
```

## traceroute

Nos dice por cuantas pcs ha pasado para hacer ping hacia una pagina

```bash
$traceroute url.com
```

## netstat

Parecido a `ifconfig` pero mas amigable

```bash
$netstat url.com
```

**options:**

- -i: interfaces(display interface table)

## lolcat

agrega color a un string

```bash
$echo "hello wolrd" | lolcat
```

## cowsay

Una vaca diciendo algo

```bash
$cowsay "hello wolrd"
```

# xdg-open

**_(de la libreria xdg-utils)_**<br>
Nos permite abrir un archivos en su programa predeterminado

```bash
$xdg-open file.pdf
$xdg-open img.png
$xdg-open executable.exe
```

---

# Wildcards

Son un símbolo usado para remplazar y/o representar uno o más caracteresm, comúnmente se utiliza el \* .

**Tipos de wildcards**

- `%` - Usado en SQL para relacionar más de un caracteres 0 o más veces.
- `*` - Relaciona cualquier carácter 0 o más veces.
- `?` - Para relacionar un caracter una vez.
- `[ ]` - Realizamos relaciones a través de

```bash
$ls *.txt
$ls doc?
$ls doc???
# Filtrar: que comience con  D o d
$ls [Dd]*
#Filtrar por la primera letra mayuscula
$ls [[:upper:]]*
#Filtrar por la primera letra minuscula
$ls [[:lower:]]*
#Filtrar por numeros
$ls [[:alnum:]]*
$ls [[:digit:]]*
```

# Redirecciones `>`

Nos guarda la salida de algun comando o error de cierto comando<br>
_Tambien se pruebe crear un archivo con `>`_

```bash
$ls > salida.txt
$ls >> salidaConcatenada.txt
$ls asdasda 2> guardarError.txt
$ls Documents > guardarError.txt 2>&1
$ > NewFile.txt
```

---

## tee

Con el comando tee podemos guardar la salida de un comando en varios archivos. El uso de esta opción es para procesar la salida del comando varias veces en un script de shell:

```bash
$ls | tee archivo1.txt archivo2.txt archivo3.txt
```

**Options:**

- -a: añadir

Al igual que con los comandos estándar que se agregan con >, los errores y stdout también se manejan de manera diferente al usar el comando. Al usar las barras regulares | se guardará solo la salida estándar en el archivo, si necesitas tanto la salida estándar como la salida de error, necesitarás usar |& con el comando tee de Linux.
**Copia de salida estándar normal:**

| comando  > archivo.txt          | La forma común de redirigir la salida estándar |
| ------------------------------- | ---------------------------------------------- |
| comando  \| tee archivo.txt     | Usando tee de Linux para sobreescribir         |
| comando   \| tee -a archivo.txt | Usando tee para añadir                         |

**Salida estándar y flujos de error:**

| comando &> archivo.txt          | La forma común de redirigir la salida estándar y el error |
| ------------------------------- | --------------------------------------------------------- |
| comando \|& tee archivo.txt     | Usando tee de Linux para sobreescribir                    |
| comando  \|& tee -a archivo.txt | Usando tee para añadir                                    |

---

# Pipe operator `|`

```bash
$ls -lh | sort | tee ouput.txt | less
```

Nos permite "ingresar" la _salida_ de otro comando ejecutado anteriormente

---

# Encadenando comandos: operadores de control

**Nota importante:**

1. **Comandos separados por punto y coma `“;”` :** Se ejecutan uno seguido del otro en el orden en que fueron puesto. Uno no se ejecuta hasta que el otro proceso aya terminado.

```bash
$ls; mkdir "dir"; cal
```

2. **Comandos separados por `&` :** Se ejecutan todos al mismo tiempo, es decir de forma asíncrona.

```bash
$ls & mkdir "dir" & cal
```

3. **Comandos separados por `&&` :** Se ejecutan solo si el comando anterior se aya ejecutado exitosamente. Suponemos que A, B y C son comando:
   A && B && C
   El B solo se va ejecutar si el A se ejecuta exitosamente, y el C solo se va ejecutar si el B si ejecuta exitosamente. Si el B no se ejecuta exitosamenta el C no se ejecuta. Si el A no se ejecuta exitomante el B y el C no se ejecutan.

```bash
# Si se ejecuta correctamente el primero comando procede a ejecutar 'cal'
$mkdir "dir" && cal
# No se ejecuta cal xq no se ejecuta correctamente el primer comando
$mkdir asdasda && cal
```

4. **Comandos separados por `||` :** Solo se ejecuta uno. Sea cuantos comandos tienes separados por || solo ejecuta o toma en cuenta el primer que se ejecuta exitosamente (bajo la redundacia), y descarta automaticamente los demas. Cuando uno de los comandos se ejecuta exitosamente, descarta los demas comandos

---

# Permisos

![](https://static.platzi.com/media/user_upload/Screen%20Shot%202021-04-22%20at%2010.15.36%20p.m.-ca57b9c9-9853-40b8-96c6-b8eb3a9599eb.jpg)

## Tipos de archivos

| Atributo | Tipos de archivo                                                                                             |
| -------- | ------------------------------------------------------------------------------------------------------------ |
| -        | Un archivo normal                                                                                            |
| d        | Un directoi                                                                                                  |
| l        | Un link simbolico                                                                                            |
| b        | Un archivos de bloque especial. Son archivos que manjean la informacion de los bloques de datos como una USB |

## Tipo de modo

La representacion de numeracion es octal

```bash
$chmod 755 file
```

|    User     |    Group    |   Others    |
| :---------: | :---------: | :---------: |
|     rwx     |     r-x     |     r-x     |
| 1 \| 1 \| 1 | 1 \| 0 \| 1 | 1 \| 0 \| 1 |
|      7      |      5      |      5      |

## Modo Simbolico

| Symbol | Description       |
| ------ | ----------------- |
| u      | Solo para user    |
| g      | Solo para group   |
| o      | Solo para others  |
| a      | Aplica para todos |

---

## chmod

```bash
$chmod 755 file
#Usando el modo simbolico
# Quita permisos de lectura de user a file
$chmod u-r file
# Agrega permisos de lectura de user a file
$chmod u+r file
# =(Sobreescribe todos los permisos)
# -(Quita permisos)
# +(Agrega permisos)
# Quita permisos de lectura de user, sobreescribe a permisos de escritura de group y others a file
$chmod u-r,go=w file
$chmod u-x,go=w file
```

## Whoami

Te devuelve tu usuario en la que estas

## id

Devuelve el id del usuario

## su

Switch user<br>
Cambiar de usuario

```bash
# Cambiar a usuario root
$su sudo
# Cambiar a otro usuario
$su otherUser
```

## passwd

Cambiar contraseña de usuario

```bash
$passwd
```

---

# Enviroments

.bashrc = Aqui se puede crear alias, rutas(PATH) y variables de entorno que necesitemos, etc.

---

# Comandos de busqueda

## which

Nos devuelve la ruta de los binarios de nuestro sistema, del path si esta situado en el path

## whereis

Cuando se usa sin ninguna opción, whereis busca los archivos fuente, binarios y manuales del comando especificado como argumento.

De forma predeterminada, whereis busca archivos de comando en rutas codificadas y directorios enumerados en las `variables de entorno`. Use la opción -l para buscar los directorios donde busca el comando whereis.

```bash
$whereis -l
# Por ejemplo, para obtener información sobre el comando bash, escriba lo siguiente:
$whereis bash
# Output:
# bash: /bin/bash /etc/bash.bashrc /usr/share/man/man1/bash.1.gz
```

```bash
# También puede proporcionar más de un argumento al comando whereis
$whereis netcat uptime
```

## find

```bash
# Buscar todo en un path(ruta)
$find ./
# Buscar por nombre(name) de archivo o directorio en un path especifico
$find ./ -name "file.txt"
# Tambien se puede usar wildcards
$find ./ -name "file*"
# Buscar por tipo de archivos
$find ./ -type d -name "dir1"
#Buscar archivos mayores a 20 mb
$find ./ -size 20M
```

**flags:**

- -name: busca por nombre
- -type: busca por tipo de archivo (df)
- -size: busca por tamaño(20M)

**options:**

- d: directory(directorio)
- f: file(archivo)

## grep

### Sintaxis

```bash
$grep -flags regex file.txt

$grep -n file.txt -e myRegex
```

**optiones:**

- -i: --ignore-case
- -c: count
- -n: number - Nos muestra el numero de linea donde se encuentra las concidencias
- -e: expresion - despues de este flag podemos pasale la expresion que queremos buscar.
- -r: recursive

## wc

count the lines, words and bytes of one file

```bash
$wc file.txt
$wc -l file.txt
$wc -w file.txt
$wc -c file.txt
```

**Optiones:**

- -l: count lines
- -w. count words
- -c: count bytes

# Compress

## tar

comprime y descomprime una compresion de tipo tar y tar-gz(-z)

```bash
$tar -cf name.tar file1 file2 fil3
$tar -czf name.tar.gz file1 file2 fil3
$tar -xzf name.tar.gz
```

**Options**:

- -c: create
- -f: nombre del archivo donde se comprimirá
- -v: verbose(ver proceso)
- -z: gzip
- -x: xtract files from an archive

## zip | unzip

Comprimir y descomprimir una archivo zip

```bash
$zip -r name.zip dirToCompress
$unzip -r name.zip dirToCompress
```

**Options:**
-r: recursive(todos los folderes de una carpeta)

# Manejo de procesos

## ps

ver procesos actuales

```bash
$ps
```

## top

ver procesos actuales en una interfaz

```bash
$top
```

## htop

ver procesos actuales en una interfaz mas amigable

```bash
$htop
```

---

# jobs

Permite ver las ejecuciones en background

## fg

Trae n proceso de background a foreground(consola)

```bash
$fg n
```

## bg

Manda n proceso de foreground(consola) a background

```bash
$bg n
```
