# <center> Python Notes</center>

## Index

1. [List Comprehension](#indice1)

2. [Ternari Operator](#indice2)

<br>
<br>

<div id="indice1" />

# 1. List Comprehension

<br>

## The Syntax

```python 
newlist = [expression for item in iterable if condition == True] 

```
With no if statement:
```python 
newlist = [expression for item in iterable] 
```

The return value is a new list, leaving the old list unchanged.

<br>

## Condition

The condition is like a filter that only accepts the items that valuate to `True` .

### Example:

```python
fruits = ["apple", "banana", "cherry", "kiwi", "mango"]
newlist = []

for x in fruits:
  if "a" in x:
    newlist.append(x)

print(newlist)
```

With list comprehension you can do all that with only one line of code:

```python
fruits = ["apple", "banana", "cherry", "kiwi", "mango"]

newlist = [x for x in fruits if "a" in x]

print(newlist)
```

Only accept items that are not "apple":

```python
newlist = [x for x in fruits if x != "apple"]
```

<br>

## Iterable

The iterable can be any iterable object, like a list, tuple, set etc.

### Example

You can use the `range()` function to create an iterable:

```python
newlist = [x for x in range(10)]
```

Accept only numbers lower than 5:

```python
newlist = [x for x in range(10) if x < 5]
```

<br>

## Expression

The expression is the current item in the iteration, but it is also the outcome, which you can manipulate before it ends up like a list item in the new list:

### Example

Set the values in the new list to upper case:

```python
newlist = [x.upper() for x in fruits]
```

You can set the outcome to whatever you like:  

Set all values in the new list to 'hello':

```python
newlist = ['hello' for x in fruits]
```

The expression can also contain conditions, not like a filter, but as a way to manipulate the outcome:

### Example

Return "orange" instead of "banana":

```python
newlist = [x if x != "banana" else "orange" for x in fruits]
```

The *expression* in the example above says:

*"Return the item if it is not banana, if it is banana return orange".*

## More Examples Lists Comprehension

### Example 1

You create the outer collection temps with a `dictionary comprehension` . The expression is a `key-value` pair, which contains yet another comprehension. This code will quickly generate a list of data for each city in `cities` .

```python
>>> cities = ['Austin', 'Tacoma', 'Topeka', 'Sacramento', 'Charlotte']
>>> temps = {city: [0 for _ in range(7)] for city in cities}
>>> temps
{
    'Austin': [0, 0, 0, 0, 0, 0, 0],
    'Tacoma': [0, 0, 0, 0, 0, 0, 0],
    'Topeka': [0, 0, 0, 0, 0, 0, 0],
    'Sacramento': [0, 0, 0, 0, 0, 0, 0],
    'Charlotte': [0, 0, 0, 0, 0, 0, 0]
}
```

### Example 2

The outer list comprehension `[... for _ in range(6)]` creates six rows, while the inner list comprehension `[i for i in range(5)]` fills each of these rows with values.

```python
>>> matrix = [[i for i in range(5)] for _ in range(6)]
>>> matrix
[
    [0, 1, 2, 3, 4],
    [0, 1, 2, 3, 4],
    [0, 1, 2, 3, 4],
    [0, 1, 2, 3, 4],
    [0, 1, 2, 3, 4],
    [0, 1, 2, 3, 4]
]
```

### Example 3

The outer list comprehension `[... for _ in range(6)]` creates six rows, while the inner list comprehension `[i for i in range(5)]` fills each of these rows with values.

So far, the purpose of each nested comprehension is pretty intuitive. However, there are other situations, such as flattening nested lists, where the logic arguably makes your code more confusing. Take this example, which uses a nested list comprehension to flatten a matrix:

```python
matrix = [
...     [0, 0, 0],
...     [1, 1, 1],
...     [2, 2, 2],
... ]
>>> flat = [num for row in matrix for num in row]
>>> flat
[0, 0, 0, 1, 1, 1, 2, 2, 2]
```

The code to flatten the matrix is concise, but it may not be so intuitive to understand how it works. On the other hand, if you were to use for loops to flatten the same matrix, then your code will be much more straightforward:

```python
>>> matrix = [
...     [0, 0, 0],
...     [1, 1, 1],
...     [2, 2, 2],
... ]
>>> flat = []
>>> for row in matrix:
...     for num in row:
...         flat.append(num)
...
>>> flat
[0, 0, 0, 1, 1, 1, 2, 2, 2]
```

<br>
<br>


<div id="indice2" />

# 2. Ternary Operators

Los operadores ternarios son más conocidos en Python como expresiones condicionales. Estos operadores evalúan si una expresión es verdadera o no. Se añadieron a Python en la versión 2.4.

## Syntax

```python
condition_if_true if condition else condition_if_false
```

### Example

```python
es_bonito = True
estado = "Es bonito" if es_bonito else "No es bonito"
```

Otra forma un tanto extraña y no demasiado usada es la siguiente:

## Syntax

```python
(if_test_is_false, if_test_is_true)[condition]
```

```python
es_bonito = True
apariencia = ("Feo", "Bonito")[es_bonito]
print("El gato es ", apariencia)
# Salida: El gato es bonito
```

## Otras formas ternarias 

En Python existe también una forma acortada del operador ternario normal que hemos visto antes. Esta sintaxis fue introducida en Python 2.5, por lo que puede ser usada de ahí en adelante.

```python
>>> True or "Valor"
True
>>>
>>> False or "Valor"
'Some'
```

```python
>>> salida = None
>>> msg = salida or "No se devolvió nada"
>>> print(msg)
No se devolvió nada
```
