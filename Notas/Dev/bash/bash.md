# bash (.sh)

Notas:

Agregar permisos de execution al bash para poder ejecutarlo

"echo -e` nos permite usar caracteres, new line(\n), tabulacion(\t), etc.

```bash
sudo chmod -x ./my_file_bash.sh
```

Agregar el comentario `# !/bin/bash` que le dirá a nuestro sistema que es sun archivo bash

#### Ejecutar operacion: $((A + B))

# Tipos de operadores

## Cadena de texto

```bash
myVar="hello world"

echo "My var: $myVar"
#Salida
My var: hello world
```

# Operadores relacionales

Si es verdaderos nos retorna `1` si es falso retorna `0`

```bash
A=10
B=4

# A > B = 1
# A < B = 0
# A >= B = 1
# A <= B = 0
# A == B = 0
# A != B = 1
```

# Operadores de asignacion

```bash
A=10
B=4
# A +=B = 14
# A -=B = 4
# A \*=B = 40
# A /=B = 2
# A %=B =2
```

# funciones con argumentos

```bash

nombreCurso=$1
horarioCurso=$2

echo "Variable nombreCurso: $1"
echo "Variable horarioCurso: $2"

echo "Total de parametros: $#"
echo "Todos los parametros: $*"

#Bash o terminal
./funciones_argumentos.bash uno dos tres

#Output:
Variable nombreCurso: uno
Variable horarioCurso: dos
Total de parametros: 3
Todos los parametros: uno dos tres
```

# Sustitucion de comandos en variables

Nos permite ejecutar un comando y obtener el stdout de este y almacenarlo en una variable para luego imprimir o precesarla,etc.
Esto se hace mediante ` \` ` backticks o `$()`

```bash
rutaACtual=`pwd`
infoKernel=$(uname -a)

echo "$rutaACtual"
echo "$infoKernel"

#output
# /home/janssen
# Linux Dev 4.4.0-19041-Microsoft #1237-Microsoft Sat Sep 11 14:32:00 PST 2021 x86_64 x86_64 x86_64 GNU/Linux
```

# Debug simple de script

```bash
bash -v ./myScript.sh
bash -x ./myScript.sh
```

**options:**
- -v: muestra informacion del script
- -x: Muestra informacion del script un poco mas detallado, donde (+) significa command o que se ejecuta.

# Capturar informacion del usuario

Para capturar la informacion del usuario por consola se usa `read`
y se almacena en $REPLY.

*Pero esta forma a continuacion es la mas indicada para usar*

```bash
read -p "Ingresar nombre" name
read -p "Ingresar apellido" lastname
```

```
# bash
./funciones_argumentos.bash

# output:
# Ingresar nombre: janssen
# Ingresar apellido: segura
# nombre: janssen
# apellido:segura
```


**options:**

- -p: Permite ingresar una frase o prompt antes de pedir el dato.
- -s: Modo Sigiloso. No muestra ningún caracter en la terminal, util para contraseñas o información sensible.
- -n [num]: Permite leer como máximo n caracteres.
- -r: Toma el botón de retroceso o backspace como un caracter y no borra ningun otro caracter previamente escrito.


# Condicional if/elif/else

if [ condicional ] ; then 
  //code 
elif [ condicional ]; then 
  //code
else
fi


if [ posix shell ]; then
  //code
elif [[ bash Extennsion ]]; then
  //code
else
  //code
fi

*Nota*: Los espacios son obligatorios, if/[  y [/condicional
