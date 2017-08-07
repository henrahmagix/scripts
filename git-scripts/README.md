# git-scripts

```shell
cd /path/to/repo
init-git-scripts
```

This will create a tag in Things named after the folder you're in (under the `Work` tag), then setup scripts to get and add todos to that tag.

Alternatively, pass the tag name you want:
```shell
init-git-scripts my-tag-name
```

## Requirements

- Add `.scripts` to global gitignore

## Usage

```shell
init-git-scripts my-project
```

### add-todo
```shell
add-todo "Todo one"
add-todo "Todo two"
```

Todo names must be one quoted argument. Any arguments after the first will be ignored.

### get-todos

```shell
get-todos
```
Result:
```
Todos for my-project:
- Todo one
- Todo two
```
