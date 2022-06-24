# Shorcuts basics

>**d** - delete    
>**c** - change  
>**y** - yank  
>**v** - select
 
 >**a** - around   
 >**i** - inside or inner

>**w** - word  
>**p** - paragraph  
>**"** - comillas  
>**'** - comilla sencilla  
>**{** - llaves  
>**[** - corchetes  
><     - Simbolos de <>  

## Comodines

>**0**- inicio  
>**$**- final  
>**%**- el archivo actual  

# Modos

>**normal**  
>**i**      : insert  
>**v**      : visual  
>**V**      : block visual  
>**ctrl**+v : char visual  
>**:**      :commands  

# Insert

>**a**: FINAL del TEXTO  
>**A**: FINAL de la LINEA    

>**i**: INICIO del TEXTO  
>**I**: INICIO de la LINEA  

>**o**: ABAJO de la LINEA  
>**O**: ARRIVA de la LINEA  

# Movimientos basicos

>**e**: Avanzar a al último caracter de una palabra
>**ge**: Retrocede al último caracter de una palabra
>**E**: Avanzar a al último caracter de una palabra sin importar puntos,comas

# Utilities

>**J**: Une la linea actual con la linea de abajo

## LowerCase

>**gu**: Texto seleccionado a minúsculas

## UpperCase

>**gU**: Texto seleccionado a mayúsculas

## Text Formatting

>**gq**: Text formatting


# Files

>**:e** myFile - abre un nuevo achivo  
>**:E** - abre un arbol de directorios  
>**:w** - guardar  
>**:q** - salir  
>**:x** - guardar y salir  

# Desplazamiento en el archivo

>**h**: izquierda  
>**l**: derecha  
>**j**: abajo  
>**k**: arriva  

>**w**: PRIMERA LETRA de la siguiente palabra  
>**e**: ULTIMA LETRA de la siguente palabra  
>**b**: PRIMERA LETRA de la anterior palabra  

>**0**: INICIO de la linea  
>**$:** FINAL de la linea  

>**gg**: INICIO del documento  
>**G** : FINAL del documento  
>**num+G**: IR al NUM del documento  
>**n|**:Ir al n numero de columna

>**%**: Desplazarse entre corchetes, comas, etc  

# Desplazamiento entre archivos

>**gd: go definicion** -  se dirige a la definicion de una variable  
>**gf: go file**       -  se dirige al archivo importador  

>**ctrl + o** : focus RETROCEDE posicion anterior  
>**ctrl + i** : focus AVANZA posicion que fue retrocedido.  

# undo, redo

>**u**      : undo - deshacer  
?>**ctrl+r** : redo - rehacer  

# Eliminar texto

>**x**: eliminar LETRA  
>**dd**: eliminar LINEA completa  
>**D** : eliminar LINEA y posicion del cursor permanece   

>**d0**: eliminar del cursor hasta el INICIO  
>**d$**: eliminar del cursor hasta el FINAL  

# Copiar, pegar

>**y**: - yank - copia TODA la LINEA o la seleccionada  
>**p**: - paste- PEGA el texto DEBAJO del cursor  
>**P**: - paste- PEGA el texto ENCIMA del cursor(shift+p)  

# Reemplazar texto

>**r+caracter**: reemplaza un caracter(letra)  
>**R:** modo reemplazar  

>**cw:** change word - borra una palabra y cambias a modo insertar  

# Seleccionar(modo visual)

>**w**: Selecciona la palabra siguiente(espacio lo toma como word)

>**as**: "a sentence" selecciona toda una sentencia(parecido a párrafo) 
>**is**: "inner sentence" selecciona toda una sentencia(parecido a párrafo) 

>**ap**: "a paragraph" selecciona un párrafo 
>**ip**: "inner paragraph" selecciona un párrafo 

>**[ - ] - ( - )**: selecciona con los movimientos de desplazamiento de normal







# Sustituir palabras

>**:s/myText/newText**      : reemplaza la PRIMERA ocurrencia de la LINEA  
>**:s/myText/newText/g**    : reemplaza TODAS las ocurrencias de la LINEA  
>**:%s/myText/newText/g**   : reemplaza TODAS las ocurrencias ENCONTRADAS  
>**:%s/myText/newText/gc** : PREGUNTA y reemplaza TODAS las ocurrencias ENCONTRADAS

# Buscar y desplazarse

>**/myText** : Buscar la palabra  

>**n**: salta al SIGUIENTE match  
>**N**: salta a la ANTERIOR match  

## Ir a n numero de linea

>**:n**: Se situa a la linea n
>**ngg - nG**: Se situa en la linea n
>**n%**: Se situa a cierto porcentaje en el archivo

# Comandos de desplazamiento

^f : forward scroll - desplazarse una página hacia abajo
^b: backward scroll - dezplazarse una página hacia arriva

^d: down semi forward scroll- dezplazarse media página hacia abajo
^u: up semi backward scroll -  dezplazarse media página hacia arriva

^e: scroll forwards one line -  se dezplaza una linea hacia abajo
^y: scroll backward one linea - se dezplaza una linea hacia abajo

H: home, the top line of screen - el cursor se situa en la primera linea de la
pantalla
M: middle, the middle linea of screen - el cursor se situa en el medio de la
pantalla
L:bottom, the bottom line of screen -  el cursor se situa al último de la
pantalla
+: El mouse se dezpla una linea hacia abajo
-: El mouse se desplazas una linea hacia arriva



n|: Te desplazas hacia la poscion n de una columna en una linea
( - ): Te desplazas a la primera ocurrencia de cada párrafo (arriva - abajo )
{ - }:Te desplazas a la primera ocurrencia de cada salto de línea (arriva - abajo )


gg: Cursor en la primera linea del archivo
G: Cursor en la ultima linea del archivo
nG: Cusor en n linea del archivo

n: Repite la última busqueda hecha

