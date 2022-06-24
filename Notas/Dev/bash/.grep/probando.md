# Probando comandos

# Grep basics

## Eliminar varios archivos buscados

```bash
$find . -type f -name "*.pdf" -print0 | xargs -0 rm -v
$find . -type f -name "*.pdf" -print0 | xargs -I {} -0 rm -v "{}"
$find . -type f -name "*.pdf" -exec rm -f {} \;
```

**options**
-print0 : Espacios en blanco no cuenta como final de linea
**(en la salida.)**

-0: Espacios en blanco no cuenta como final de linea
**(en la entrada.)**

## Copiar varios archivos buscados

```bash
$find . -type f -name ".*notesfor.*.pdf" | xargs -0 cp -t ./filesToCopy
```

# grep | grep -v

```bash
$grep smith tee.txt
```

The output would look like:

    May 20, 2008 Smith hi.txt
    June 21, 2008 Smith world.txt

```bash
$grep smith tee.txt | grep -v hi.txt
```

The following output would result:

    June 21, 2008 Smith world.txt

**Options:**

**_Match Control:_**

- `-v:` --invert-match - Ignora el PATTERN ingresado
- `-e`: pattern, regex
- `-f`: file - toma patters del archivo para buscar
- `-i`: --ignore-case
- `-w`: --word-regexp - busca la palabra exacta
- `-n`: --line-number - te muestra el numero de linea de los match
- `-x`: --line-regexp - match de lo buscado en toda una linea, si hay mas no coincide
- `-c`: --count - numero de coincidencias
- `-l`: --files-with-matches - busca coincidencia en algun archivo
- `-L`: --files-without-match - Lo contrario de `-l`, buscar archivos que no coincida con el pattern
- `-m NUM `: --max-count=NUM; limite de la salida<br>

**_Output line prefix control:_**

- `-H`: --with-filename, Muestra el nombre del archivo
- `-h`: --no-filename, No muestra el nombre del archivo
- `-T`: --initial-tab - agrega un taben cada impresion de linea
- `-Z`: --null - Prints an ASCII NUL (a zero byte) after each filename.
  This is useful when processing filenames that may contain
  special characters (such as carriage returns).

**_Context line control:_**

- `-A NUM`: --after-context=NUM - Ofrece un contexto para hacer coincidir líneas imprimiendo el NUM líneas que siguen a cada partido. Un separador de grupo (--) es colocados entre cada grupo de cerillas. En este caso, será imprima las siguientes tres líneas después de la línea correspondiente. Esto es útil al buscar a través del código fuente, por ejemplo.
- `-B NUM`: --before-context=NUM - Lo mismo que `-A` pero este imprimer las n lineas anteriores
- ` -C NUM`: -NUM, --context=NUM - La combinaciond de `-A` y `-B`

**_File and Directory Selection_**

- `--exclude=GLOB`: **grep --exclude=PATTERN path**

  Refines the list of input files by telling grep to ignore files
  whose names match the specified pattern. PATTERN can be
  an entire filename or can contain the typical “fileglobbing” wildcards the shell uses when matching files
  (_, ? and []). For instance, --exclude=_.exe will skip all
  files ending in .exe.

- `--exclude-from=FILE`
  **grep --exclude-from=FILE path**

  Similar to the --exclude option, except that it takes a list
  of patterns from a specified filename, which lists each pattern on a separate line. grep will ignore all files that match
  any lines in the list of patterns given.

- `--exclude-dir=DIR`: **grep --exclude-dir=DIR pattern path**

  Any directories in the path matching the pattern DIR will
  be excluded from recursive searches. In this case, the actual directory name (relative name or absolute path name)
  has to be included to be ignored. This option also must be
  used with the -r option or the -d recurse option in order
  to be relevant.

- `--include=GLOB` **grep --include=\*.log pattern filename**

  Limits searches to input files whose names match the
  given pattern (in this case, files ending in .log). This option
  36 | grep Pocket Reference
  is particularly useful when searching directories using the
  `-R` option. Files not matching the given pattern will be ignored. An entire filename can be specified, or can contain
  the typical “file-globbing” wildcards the shell uses when
  matching files (\*, ? and []).

- -R, -r, --recursive -
  **grep -R pattern path**
  **grep -r pattern path**

  Searches all files underneath each directory submitted as
  an input file to grep

- `-z`, --null-data
  **grep -z pattern**

  Input lines are treated as though each one ends with a zero
  byte, or the ASCII NUL character, instead of a newline.
  Similar to the `-Z` or `--null` options, except this option
  works with input, not output.

**_One final limitation of basic grep:_** the “extended” regular expressions metacharacters—`?, +, {, }, |, (, and )`—do not work
with basic grep. The functions provided by those characters
exist if you preface them with an escape. More on that in the
next section.

# Extended Regular Expressions (egrep

or grep -E)
grep -E and egrep are the same exact command. The commands
search files for patterns that have been interpreted as extended
regular expressions. An extended regular expression goes beyond just using the previously mentioned options; it uses additional metacharacters to create more complex and powerful
search strings. As far as command-line options, grep -E and
grep take the same ones—the

| Basic regular expressions | Extended regular expressions |
| :-----------------------: | :--------------------------: |
|        '\\(red\\)'        |           '(red)'            |
|       'a\\{1,3\\}'        |           'a{1,3}'           |
|      'behaviou\\?r'       |         'behaviou?r'         |
|       'pattern\\+ '       |          'pattern+'          |

# Fixed Strings (fgrep or grep -F)

In the following section, we discuss grep -F, or fgrep. fgrep is
known as fixed string or fast grep. It is known as “fast grep”
because of the great performance it has compared to grep and
egrep. It accomplishes this by dropping regular expressions altogether and looking for a defined string pattern. It is useful
for searching for specific static content in a precise manner,
similar to the way Google operates.

The command to evoke fgrep is:

    fgrep string_pattern filename

---

## Imprime las n siguientes lineas despues del match

```bash
$grep -A 3 "smith" hello.txt
```

**_output:_**

    smith
    1
    -
    xyz Hello, world!

## Buscar coincidencia con limite de n

```bash
$grep -m 5 "WARNING" *.txt
```

output:

    logs.txt:WARNING - tester
    logs.txt:WARNING - test2
    logs.txt:WARNING - A
    logs.txt:WARNING -MAS
    logs.txt:WARNING A

## Buscar en todos los archivos que coincidan con el pattern

```bash
$grep -l "WARNING" *.txt
```

output:

    logs.txt

## Buscar palabra exacta

```bash
$grep -w xyz hello.txt
```

output:

    xyz

---

## Buscar que haga match toda una linea

```bash
$grep -x "Hello, world!" hello.txt
```

output:

    Hello, world!

## tail -f | grep

There is a case to be made for piping commands when you wish
to search through content that is continually streaming. For
instance, if you want to monitor a logfile in real-time for specified content, she could use the following command:

Buscara en tiempo real la palabra WARNING

```bash
$tail -f logs.txt | grep WARNING
```

**Options:**

- -f: --follow[={name|descriptor}]<br>
  output appended data as the file grows
  an absent option argument means 'descriptor'

## Buscar palabras desde un archivo

```bash
$grep -f hi.txt hello.txt tee.txt
```


## Buscar palabra en todos los documentos

```bash
$grep -l palabra_a_buscar ./*

```
