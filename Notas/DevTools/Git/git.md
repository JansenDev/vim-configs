# Git
## Start
```bash
git init
git status
git add <FILES|.>
git commit [-m]
git commit --amend [-m]
git log [--oneline][--graph]
```
```bash
[-m]: Message
[--oneline]:Short logs
[--graph]: Graph
```


# Branch
## Nueva Rama

```bash
git checkout -b <name>
```

## Cambiar Rama

```bash
git checkout  <name>
```

## Ver Lista de Ramas

```bash
git branch
```
---
<br>

#
## Quitar cambios de 'Stage'
```bash
git restore
```

#
## FUNCTION
Crea una function(alias) en git para cambiar email y nombre a todos los commits hechos
```bash
git config --global alias.change-commits '!'"f() { VAR=\$1; OLD=\$2; NEW=\$3; shift 3;
git filter-branch --env-filter \"if [[ \\\"\$\`echo \$VAR\`\\\" = '\$OLD' ]]; then export \$VAR='\$NEW'; fi\" \$@; }; f"
```