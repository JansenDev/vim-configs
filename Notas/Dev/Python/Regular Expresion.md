# <center>Regular expresions</center>

## Functions

The re module offers a set of functions that allows us to search a string for a match:

| Function    | Description                                                       |
| ----------- | ----------------------------------------------------------------- |
| **findall** | Returns a list containing all matches                             |
| **search**  | Returns a Match object if there is a match anywhere in the string |
| **split**   | Returns a list where the string has been split at each match      |
| **sub**     | Replaces one or many matches with a string                        |

---

## Metacharacters

Metacharacters are characters with a special meaning:

| Character | Description                                                                | Example         |
| --------- | -------------------------------------------------------------------------- | --------------- |
| **[]**    | A set of characters "[a-m]"                                                | "[a-m]"         |
| **\\**    | Signals a special sequence (can also be used to escape special characters) | "\d"            |
| **.**     | Any character (except newline character)                                   | "he..o"         |
| **^**     | Starts with "^hello"                                                       | "^hello"        |
| **$**     | Ends with "world$"                                                         | "world$"        |
| **\***    | Zero or more occurrences                                                   | "aix\*"         |
| **+**     | One or more occurrences                                                    | "aix+"          |
| **?**     | Zero or One                                                                | "http(s)?"      |
| **{}**    | Exactly the specified number of occurrences                                | "al{2}"         |
| **\|**    | Either or                                                                  | "falls \|stays" |
| **()**    | Capture and group                                                          | -               |

---

## Metacharacteres repetition(advance)

??: 0 or 1, prefer 0.
+?: 1 or more, match as few times as possible.
\*?: 0 or more, match as few times as possible.
{n,}?: n or more, match as few times as possible.
{n,m}?: between n and m, , match as few times as possible, but at least n.

## Special Sequences

A special sequence is a \ followed by one of the characters in the list below, and has a special meaning:

| Character | Description                                                                                                                              | Example                          |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| **\A**    | Returns a match if the specified characters are at the beginning of the string                                                           | "\AThe"                          |
| **\b**    | Returns a match where the specified characters are at the beginning or at the end of a word                                              | \babc\b -> ab **abc** abcc babc  |
| **\B**    | Returns a match where the specified characters are present, but NOT at the beginning (or at the end) of a word                           | \Babc\B -> ab abc abcc b**abc**d |
| **\d**    | Returns a match where the string contains digits (numbers from 0-9)                                                                      | "\d"                             |
| **\D**    | Returns a match where the string DOES NOT contain digits                                                                                 | "\D"                             |
| **\s**    | Returns a match where the string contains a white space character                                                                        | "\s"                             |
| **\S**    | Returns a match where the string DOES NOT contain a white space character                                                                | "\S"                             |
| **\w**    | Returns a match where the string contains any word characters (characters from a to Z, digits from 0-9, and the underscore \_ character) | "\w"                             |
| **\W**    | Returns a match where the string DOES NOT contain any word characters                                                                    | "\W"                             |
| **\Z**    | Returns a match if the specified characters are at the end of the string                                                                 | "Spain\Z"                        |

---

## Special characters

- **\a**: _Bell._
- **\cX**: _Match a control-X character._
- **\e**: _Escape (\u001B)._
- **\f**: _Form feed (\u000C)._
- **\n**: _Line feed (\u000A)._
- **\r**: _Carriage return (\u000D)._
- **\t**: _Horizontal tabulation (\u0009)._

---

## Sets

A set is a set of characters inside a pair of square brackets [] with a special meaning:

| Set            | Description                                                                                                             |
| -------------- | ----------------------------------------------------------------------------------------------------------------------- |
| **[arn]**      | Returns a match where one of the specified characters (a, r, or n) are present                                          |
| **[a-n]**      | Returns a match for any lower case character, alphabetically between a and n                                            |
| **[^arn]**     | Returns a match for any character EXCEPT a, r, and n                                                                    |
| **[0123]**     | Returns a match where any of the specified digits (0, 1, 2, or 3) are present                                           |
| **[0-9]**      | Returns a match for any digit between 0 and 9                                                                           |
| **[0-5][0-9]** | Returns a match for any two-digit numbers from 00 and 59                                                                |
| **[a-zA-Z]**   | Returns a match for any character alphabetically between a and z, lower case OR upper case                              |
| **[+]**        | In sets, +, \*, \., \|, (), $,{} has no special meaning, so [+] means: return a match for any + character in the string |

# Lookahead and Lookbehind Zero-Length Assertions

Lookahead and lookbehind, collectively called “lookaround”, are zero-length assertions just like the start and end of line, and start and end of word anchors explained earlier in this tutorial. The difference is that lookaround actually matches characters, but then gives up the match, returning only the result: match or no match. That is why they are called “assertions”. They do not consume characters in the string, but only assert whether a match is possible or not. Lookaround allows you to create regular expressions that are impossible to create without them, or that would get very longwinded without them.

## Positive and Negative Lookahead

Negative lookahead is indispensable if you want to match something not followed by something else. When explaining character classes, this tutorial explained why you cannot use a negated character class to match a q not followed by a u. Negative lookahead provides the solution: q(?!u). The negative lookahead construct is the pair of parentheses, with the opening parenthesis followed by a question mark and an exclamation point. Inside the lookahead, we have the trivial regex u.

Positive lookahead works just the same. q(?=u) matches a q that is followed by a u, without making the u part of the match. The positive lookahead construct is a pair of parentheses, with the opening parenthesis followed by a question mark and an equals sign.

You can use any regular expression inside the lookahead (but not lookbehind, as explained below). Any valid regular expression can be used inside the lookahead. If it contains capturing groups then those groups will capture as normal and backreferences to them will work normally, even outside the lookahead. (The only exception is Tcl, which treats all groups inside lookahead as non-capturing.) The lookahead itself is not a capturing group. It is not included in the count towards numbering the backreferences. If you want to store the match of the regex inside a lookahead, you have to put capturing parentheses around the regex inside the lookahead, like this: (?=(regex)). The other way around will not work, because the lookahead will already have discarded the regex match by the time the capturing group is to store its match.

```python
## Regex NegativeLookahead (Mirada hacia adelante Negativa)

/q(?!u)/g
# text
que
nqelele
#Match Result
match q de nqelele
# Match la q que no tenga una u como seguiente palabra
```

```python
## Regex Positive Lookahead (Mirada hacia adelante Positiva)

/q(?=u)/g
# text
que
nqelele
#Match Result
match q de que
#Match la q que tenga una u como siguiente palabra
```

```python
## Regex Negativa Lookbehind (Mirada hacia atras Negativa)

/(?<!a)b/g
# ext
cab
cabt
bed
bedt
#Match Result
match b de bed
match b de bedt
# Match la b que no tenga una a como palabra anterior
```

```python
## Regex Positiva Lookbehind (Mirada hacia atras Positiva)

/(?<=a)b/g
# text
cab
cabt
bed
bedt
#Match Result
match b de cab
match b de cabt
# Match la b que no tenga una a como palabra anterior
```

- **(?:)** -> non-capturing group - the regex inside the parenthesis must be matched but does not create the capturing group
  _Nota: Coincide pero no lo captura(no lo marca pero hace coincidencia)_

---

## Expresion Regular que no captura un grupo

```python

/(q)(?:u)(it)/g
# text
quit
quite
#match Result
q it
q ite
# Coincide con quit pero no agrupa la u por ello solo retorna q  and   uite.
```

```python

# Considere el siguiente texto:

http://stackoverflow.com/
http://stackoverflow.com/questions/tagged/regex

# Ahora, si aplico la expresión regular a continuación sobre ella ...

(https?|ftp)://([^/\r\n]+)(/[^\r\n]*)?

# ... obtendría el siguiente resultado:

Match "http://stackoverflow.com/"
     Group 1: "http"
     Group 2: "stackoverflow.com"
     Group 3: "/"

Match "http://stackoverflow.com/questions/tagged/regex"
     Group 1: "https"
     Group 2: "stackoverflow.com"
     Group 3: "/questions/tagged/regex"

# Pero no me importa el protocolo, solo quiero el host y la ruta de la URL. Entonces, cambio la expresión regular para incluir el grupo que no captura (?:).

(?:https?|ftp)://([^/\r\n]+)(/[^\r\n]*)?
# Ahora, mi resultado se ve así:

Match "http://stackoverflow.com/"
     Group 1: "stackoverflow.com"
     Group 2: "/"

Match "/programming/tagged/regex"
     Group 1: "stackoverflow.com"
     Group 2: "/questions/tagged/regex"
# ¿Ver? El primer grupo no ha sido capturado. El analizador lo usa para hacer coincidir el texto, pero lo ignora más tarde, en el resultado final.

```


---

## Back-references

Using \1 it matches the same text that was matched by the first capturing group

```python
([abc])\1
# texto
aabcde
abcdbb
aabcc
aabbbcc
# result
aa
bb
aa cc
aa bb cc
# \1 Toma el valor de la coincidencia del primer "grupo" \1 sera a, b o c igual al primer match
```

```python
([a-c])x\1x\1
#text
 axaxahrs
 bxbxbgsa
 cxcxcsrs

 #Match Result
# axaxa
# bxbxb
# cxcxc
# \1 se toma el valor de laprimera coincidencia en este caso a, b o c. axa-x-a , bxb-x-b, cxc-x-c
```

---

We can use \2 (\3, \4, etc.) to identify the same text that was matched by the second (third, fourth, etc.) capturing group

```python
([abc])([de])\2\1

# text
adda abceec
aeea aaaaaa
adda abceec
add bee bdd cee
adda beeb

 #Match Result
adda ceec
aeea
adda ceec
adda beeb

# \2 toma el valor de la segunda coincidencia([de]) y \1 la primera coincidencia ([abc])
```

---
