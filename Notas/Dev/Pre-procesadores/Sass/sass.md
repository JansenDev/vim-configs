# Sass

## No compile file sass

al agregar _ al inicio del nombre del archivo le dice al preprocesador que no
lo compile por que sera importado en algun otro achivo.

./_variables.scss
/._mixins.scss

```
@import "variables.scss";
@import "mixis.scss";

```
## Variables

```sass
$fuente1: 'open sans', san serif
$fuente2: 'open sans', san serif
$color-primary: #333333;
$form-selectors: "input.name", "input.address", "input.zip" !default;


.caja {
   color: $color-primary;
   font-family: $fuente2
  }


# Passing Arbitrary Arguments permalinkPassing Arbitrary Arguments

$form-selectors: "input.name", "input.address", "input.zip" !default;

@include order(150px, $form-selectors...);
```

## @import


```
@import "components/variables.scss";
@import "components/mixis.scss";

```

## @extend

```sass
%buttonTemplate{
  display: inline-block;
  margin : 1em ;
  padding: .5em 1.5em;
  }

.button{
   @extend %buttonTemplate;
  }

# Nos permite extender el contenido de una clase a nuestro codigo
  .button2{
    @extend .button; 
    }
```

## mixin


```
@mixin caja{
  # code
  }


.ubicacion{
  @include caja
  }
```

# Mixins with arguments

```
@mixin theme($propiedad, $propiedad2, $value, $value2){
  #{$propiedad}: $value;
  #{$propiedad2}: $value2;
}

p{
  @include theme(text-align, font-size, center, 1.2rem)
}
```

## Mixin woth parameters

```
@mixin rtl($property, $ltr-value, $rtl-value) {
  #{$property}: $ltr-value;

  [dir=rtl] & {
    #{$property}: $rtl-value;
  }
}
```
## Mixins With optional arguments

```
@mixin replace-text($image, $x: 50%, $y: 50%) {
  text-indent: -99999em;
  overflow: hidden;
  text-align: left;

  background: {
    image: $image;
    repeat: no-repeat;
    position: $x $y;
  }
}

.mail-icon {
  @include replace-text(url("/images/mail.svg"), 0);
}
```


## When a mixin is included, arguments can be passed by name in addition to passing them by their position in the argument list.

```
@mixin square($size, $radius: 0) {
  width: $size;
  height: $size;

  @if $radius != 0 {
    border-radius: $radius;
  }
}

.avatar {
  @include square(100px, $radius: 4px);
}
```


## Taking Arbitrary Arguments permalinkTaking Arbitrary Arguments

```
mixin order($height, $selectors...) {
  @for $i from 0 to length($selectors) {
    #{nth($selectors, $i + 1)} {
      position: absolute;
      height: $height;
      margin-top: $i * $height;
    }
  }
}

@include order(150px, "input.name", "input.address", "input.zip");

```



## Mixin Content blocks

```
@mixin hover {
  &:not([disabled]):hover {
    @content;
  }
}

.button {
  border: 1px solid black;
  @include hover {
    border-width: 2px;
  }
}
```

# Passing Arguments to Content Blocks

```
@mixin media($types...) {
  @each $type in $types {
    @media #{$type} {
      @content($type);
    }
  }
}

```

```
@include media(screen, print) using ($type) {
  h1 {
    font-size: 40px;
    @if $type == print {
      font-family: Calluna;
    }
  }
}
```

# function


```
@function get-opacity($color,$nivel){
  @return rgba($color,$nivel);
  }


.div{
  background-color: get-opacity($color-primario, .20);
  }
```

# if

```
@mixin square($size, $radius: 0) {
  width: $size;
  height: $size;

  @if $radius != 0 {
    border-radius: $radius;
  }
}

.avatar {
  @include square(100px, $radius: 4px);
}
```


# Loops

## each


```
@each $tag, $size in (h1:30px, h2: 25px, h3: 20px){
  #{ $tag }{
    font-size: $size;
    margin: 0
    }
  }
```


```
$sizes: 40px, 50px, 80px;

@each $size in $sizes {
  .icon-#{$size} {
    font-size: $size;
    height: $size;
    width: $size;
  }
}
```
##  Each with Maps

```
$icons: ("eye": "\f112", "start": "\f12e", "stop": "\f12f");

@each $name, $glyph in $icons {
  .icon-#{$name}:before {
    display: inline-block;
    font-family: "Icon Font";
    content: $glyph;
  }
}


```


## for


```
mixin order($height, $selectors...) {
  @for $i from 0 to length($selectors) {
    #{nth($selectors, $i + 1)} {
      position: absolute;
      height: $height;
      margin-top: $i * $height;
    }
  }
}

@include order(150px, "input.name", "input.address", "input.zip");
```

## Taking Arbitrary Keyword Arguments

Arg$form-selectors: "input.name", "input.address", "input.zip" !default;ument lists can also be used to take arbitrary keyword arguments. The meta.keywords() function takes an argument list and returns any extra keywords that were passed to the mixin as a map from argument names (not including $) to those arguments’ values.


```
@use "sass:meta";

@mixin syntax-colors($args...) {
  @debug meta.keywords($args);
  // (string: #080, comment: #800, variable: #60b)

  @each $name, $color in meta.keywords($args) {
    pre span.stx-#{$name} {
      color: $color;
    }
  }
}

@include syntax-colors(
  $string: #080,
  $comment: #800,
  $variable: #60b,
)
```


# Indented Mixin Syntax

The indented syntax has a special syntax for defining and using mixins, in addition to the standard @mixin and @include. Mixins are defined using the character =, and they’re included using +. Although this syntax is terser, it’s also harder to understand at a glance and users are encouraged to avoid it.

**No se recomienda usar los mixins indentador por que es mas dificil de leer**

```
=reset-list
  margin: 0
  padding: 0
  list-style: none


=horizontal-list
  +reset-list

  li
    display: inline-block
    margin:
      left: -2px
      right: 2em

nav ul
  +horizontal-list
```

```
nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
}
nav ul li {
  display: inline-block;
  margin-left: -2px;
  margin-right: 2em;
}
```


# Interpolation

```
@mixin corner-icon($name, $top-or-bottom, $left-or-right) {
  .icon-#{$name} {
    background-image: url("/icons/#{$name}.svg");
    position: absolute;
    #{$top-or-bottom}: 0;
    #{$left-or-right}: 0;
  }
}

@include corner-icon("mail", top, left);
```

```
.icon-mail {
  background-image: url("/icons/mail.svg");
  position: absolute;
  top: 0;
  left: 0;
}
```

## In SassScript permalinkIn SassScript


```
@mixin inline-animation($duration) {
  $name: inline-#{unique-id()};

  @keyframes #{$name} {
    @content;
  }

  animation-name: $name;
  animation-duration: $duration;
  animation-iteration-count: infinite;
}

.pulse {
  @include inline-animation(2s) {
    from { background-color: yellow }
    to { background-color: red }
  }
}
```

```
# OUTPUT:

.pulse {
  animation-name: inline-uh3sj30l1;
  animation-duration: 2s;
  animation-iteration-count: infinite;
}
@keyframes inline-uh3sj30l1 {
  from {
    background-color: yellow;
  }
  to {
    background-color: red;
  }
}

```

## Quoted Strings

In most cases, interpolation injects the exact same text that would be used if the expression were used as a property value. But there is one exception: the quotation marks around quoted strings are removed (even if those quoted strings are in lists). This makes it possible to write quoted strings that contain syntax that’s not allowed in SassScript (like selectors) and interpolate them into style rules.


```
.example {
  unquoted: #{"string"};
}


# OUTPUT

.example {
  unquoted: string;
}
```














# Practicar su uso 

## Create media querys  with mixins

```
@mixin media($types...) {
  @each $type in $types {
    @media #{$type} {
      @content($type);
    }
  }
}

@include media(screen, print) using ($type) {
  h1 {
    font-size: 40px;
    @if $type == print {
      font-family: Calluna;
    }
  }
}
```


```
# Output
@media screen {
  h1 {
    font-size: 40px;
  }
}
@media print {
  h1 {
    font-size: 40px;
    font-family: Calluna;
  }
}
```
