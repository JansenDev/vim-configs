# Query Operators

## Comparation

</br>

| Name   | Description                                                                |
| ------ | -------------------------------------------------------------------------- |
| `$eq`  | Coincide con valores que son iguales a un valor especificado.              |
| `$gt`  | Coincide con valores que son mayores que un valor especificado.            |
| `$gte` | Coincide con valores que son mayores o iguales a un valor especificado.    |
| `$in`  | Coincide con cualquiera de los valores especificados en una matriz.        |
| `$lt`  | Coincide con valores que son menores que un valor especificado.            |
| `$lte` | Coincide con valores que son menores o iguales a un valor especificado.    |
| `$ne`  | Coincide con todos los valores que no son iguales a un valor especificado. |
| `$nin` | No coincide con ninguno de los valores especificados en una matriz.        |

## Logic

</br>

| Nombre | Descripción                                                                                                                          |
| ------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| `$and` | Une cláusulas de consulta con una lógica ANDdevuelve todos los documentos que cumplen las condiciones de ambas cláusulas.            |
| `$not` | Invierte el efecto de una expresión de consulta y devuelve documentos que no coinciden con la expresión de consulta.                 |
| `$nor` | Une cláusulas de consulta con una lógica NORdevuelve todos los documentos que no coinciden con ambas cláusulas.                      |
| `$or`  | Une cláusulas de consulta con una lógica ORdevuelve todos los documentos que cumplen las condiciones de cualquiera de las cláusulas. |

## Element

</br>

| Nombre    | Descripción                                                 |
| --------- | ----------------------------------------------------------- |
| `$exists` | Coincide con documentos que tienen el campo especificado.   |
| `$type`   | Selecciona documentos si un campo es del tipo especificado. |

## Evaluation

</br>
</br>

| Nombre   | Descripción                                                                               |
| -------- | ----------------------------------------------------------------------------------------- |
| `$regex` | Selecciona documentos donde los valores coinciden con una expresión regular especificada. |
| `$text`  | Realiza búsqueda de texto.                                                                |

<br/>

## EXAMPLE - $Regex :

### Syntax

```SQL
{ <field>: { $regex: /pattern/, $options: '<options>' } }
{ <field>: { $regex: 'pattern', $options: '<options>' } }
{ <field>: { $regex: /pattern/<options> } }
```

```SQL
-- Retorna los SKU terminados en 789
db.products.find( { sku: { $regex: /789$/ } } )

-- Retorna los names que contengan j sin importar si es mayuscula o minuscula
-- 1era forma
db.users.find({name: { $regex: "j", $options: "i" },});
-- 2da forma
db.users.find({name: { $regex: /j/i }});
```

| $Option | Descripción                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Restricciones de sintaxis           |
| ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| `i`      | Insensibilidad a mayúsculas y minúsculas para que coincida con las mayúsculas y minúsculas. Para obtener un ejemplo, consulte Realizar una coincidencia de expresiones regulares que no distinguen entre mayúsculas y minúsculas                                                                                                                                                                                                                                                                                                                                                                                     | \-                                  |
| `m`      | Para patrones que incluyen anclas (es decir, ^para el inicio, $para el final), haga coincidir al principio o al final de cada línea para las cadenas con valores de varias líneas. Sin esta opción, estos anclajes coinciden al principio o al final de la cadena. Para obtener un ejemplo, consulte Coincidencia de líneas múltiples para líneas que comienzan con un patrón especificado . <br/>Si el patrón no contiene anclajes o si el valor de la cadena no tiene caracteres de nueva línea (p \n. Ej. ), La mopción no tiene ningún efecto.                                                                   | \-                                  |
| `x`      | Capacidad "extendida" para ignorar todos los caracteres de espacio en blanco en el $regexpatrón a menos que se escape o se incluya en una clase de carácter. <br/>Además, ignora los caracteres intermedios e incluye un carácter hash / pound ( #) sin escape y la siguiente línea nueva, por lo que puede incluir comentarios en patrones complicados. Esto solo se aplica a los caracteres de datos; Es posible que los caracteres de espacio en blanco nunca aparezcan dentro de secuencias de caracteres especiales en un patrón.<br/>La x opción no afecta el manejo del carácter VT (es decir, el código 11). | Requiere $regexcon $optionssintaxis |
| `s`      | Permite que el carácter de punto (es decir .) coincida con todos los caracteres, incluidos los caracteres de nueva línea. Para ver un ejemplo, consulte Usar el .carácter de punto para hacer coincidir una nueva línea                                                                                                                                                                                                                                                                                                                                                                                              | Requiere $regexcon $optionssintaxis |

## Matriz

</br>

| Nombre       | Descripción                                                                                                           |
| ------------ | --------------------------------------------------------------------------------------------------------------------- |
| `$all`       | Coincide con matrices que contienen todos los elementos especificados en la consulta.                                 |
| `$elemMatch` | Selecciona documentos si el elemento del campo de matriz coincide con todas las $elemMatchcondiciones especificadas . |
| `$size`      | Selecciona documentos si el campo de matriz tiene un tamaño especificado.                                             |

</br>
</br>

# Update Operators

</br>

| Nombre         | Descripción                                                                                                                                                                                            |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `$currentDate` | Establece el valor de un campo en la fecha actual, ya sea como Fecha o Marca de tiempo.                                                                                                                |
| `$inc`         | Incrementa el valor del campo en la cantidad especificada.                                                                                                                                             |
| `$min`         | Solo actualiza el campo si el valor especificado es menor que el valor del campo existente.                                                                                                            |
| `$max`         | Solo actualiza el campo si el valor especificado es mayor que el valor del campo existente.                                                                                                            |
| `$mul`         | Multiplica el valor del campo por la cantidad especificada.                                                                                                                                            |
| `$rename`      | Cambia el nombre de un campo.                                                                                                                                                                          |
| `$set`         | Establece el valor de un campo en un documento.                                                                                                                                                        |
| `$setOnInsert` | Establece el valor de un campo si una actualización da como resultado la inserción de un documento. No tiene ningún efecto sobre las operaciones de actualización que modifican documentos existentes. |
| `$unset`       | Elimina el campo especificado de un documento.                                                                                                                                                         |

## Modifiers

</br>

| Nombre      | Descripción                                                                                                  |
| ----------- | ------------------------------------------------------------------------------------------------------------ |
| `$each `    | Modifica los operadores $pushy $addToSetpara agregar varios elementos para las actualizaciones de la matriz. |
| `$position` | Modifica el $pushoperador para especificar la posición en la matriz para agregar elementos.                  |
| `$slice`    | Modifica el $pushoperador para limitar el tamaño de las matrices actualizadas.                               |
| `$sort`     | Modifica el $pushoperador para reordenar los documentos almacenados en una matriz.                           |

## Array Operators

| Nombre            | Descripción                                                                                                                                                                        |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `$`               | Actúa como un marcador de posición para actualizar el primer elemento que coincide con la condición de la consulta.                                                                |
| `$[]`             | Actúa como un marcador de posición para actualizar todos los elementos de una matriz para los documentos que coinciden con la condición de la consulta.                            |
| `$[<`identifier>] | Actúa como un marcador de posición para actualizar todos los elementos que coinciden con la arrayFilterscondición de los documentos que coinciden con la condición de la consulta. |
| `$addToSet`       | Agrega elementos a una matriz solo si aún no existen en el conjunto.                                                                                                               |
| `$pop`            | Elimina el primer o último elemento de una matriz.                                                                                                                                 |
| `$pull`           | Elimina todos los elementos de la matriz que coinciden con una consulta específica.                                                                                                |
| `$push`           | Agrega un elemento a una matriz.                                                                                                                                                   |
| `$pullAll`        | Elimina todos los valores coincidentes de una matriz.                                                                                                                              |

# Agregation

<br/>

| Nombre   | Descripción                                                                                                       |
| -------- | ----------------------------------------------------------------------------------------------------------------- |
| `$count` | Pasa un documento a la siguiente etapa que contiene un recuento del número de documentos ingresados ​​a la etapa. |

```sql
-- <string>es el nombre del campo de salida que tiene el recuento como valor. <string> debe ser una cadena no vacía, no debe comenzar con $y no debe contener el .carácter.

{ $count: <string> }
```

| Nombre   | Descripción                                                                       |
| -------- | --------------------------------------------------------------------------------- |
| `$limit` | Limita el número de documentos que se pasan a la siguiente etapa de la pipeline . |

```sql
-- Structure
{ $limit: <positive integer> }
```

| Nombre   | Descripción                                                                                                                                  |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `$match` | Filtra los documentos para pasar solo los documentos que coinciden con las condiciones especificadas a la siguiente etapa de pipeline stage. |

```sql
-- Structure
{ $match: { <query> } }
```

```sql
-- Example:
db.articles.aggregate(
    [ { $match : { author : "dave" } } ]
);
```

```sql
db.articles.aggregate( [
  { $match: { $or: [ { score: { $gt: 70, $lt: 90 } }, { views: { $gte: 1000 } } ] } },
  { $group: { _id: null, count: { $sum: 1 } } }
] );
```

| Nombre  | Descripción                                                                                                                               |
| ------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `$skip` | Omite el número especificado de documentos que pasan a la etapa y pasa los documentos restantes a la siguiente etapa de la canalización . |

```sql
-- Structure
db.article.aggregate([
    { $skip : 5 }
]);
```

```sql
-- Example:
db.article.aggregate([
    { $skip : 5 }
]);
```

| Nombre  | Descripción                                                                                |
| ------- | ------------------------------------------------------------------------------------------ |
| `$sort` | Ordena todos los documentos de entrada y los devuelve a la canalización en orden ordenado. |

| Valor | Descripción         |
| ----- | ------------------- |
| `1`   | Orden ascendente.   |
| `-1`  | Orden descendiente. |
