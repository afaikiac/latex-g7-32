# $\LaTeX$ шаблон

Данный шаблон разработан для оформления отчетов о НИР, расчетно-пояснительных записок к курсовым и дипломным работам в соответствии с ГОСТ 7.32-2017 и демонстрирует возможности стиля [G7-32](https://github.com/afaikiac/latex-g7-32/tree/G7-32).

## Структура

```palin
latex-g7-32
├── res 
│       изображения, исходные файлы для листингов, библиография
├── lib
│       пакеты и макросы LaTeX
├── lib/G7-32/tex 
│       LaTeX-файлы стилей и классов для стандарта GOST 7.32
├── lib/GOST/bibtex/bst/gost
│       стили библиографии для оформления по GOST
├── tex 
│       исходные файлы LaTeX
├── .latexmkrc
│       конфигурация для утилиты latexmk, которая задает
│       переменные среды и определяет настройки сборки документа
└── main.tex 
        основной файл LaTeX, который включает
        структуру документа и вызовы других файлов
```

## Сборка

### Overleaf

1. Скачайте [архив](https://github.com/afaikiac/latex-g7-32/releases/latest/download/latex-g7-32-overleaf.zip) и импортируйте его как новый проект в Overleaf. Подробнее: [how to upload a project](https://www.overleaf.com/learn/how-to/Uploading_a_project).

2. Для использования XeLaTeX вместо pdfLaTeX в проекте измените компилятор на `XeLaTeX`. Подробнее: [changing compiler](https://www.overleaf.com/learn/how-to/Changing_compiler).

### Docker

**Важно** не забыть о сабмодулях в директории `./lib`.

```bash
git clone --recurse-submodules https://github.com/afaikiac/latex-g7-32.git
```

```bash
cd latex-g7-32
```

```bash
IMAGE="ghcr.io/afaikiac/latex-g7-32:overleaf"
```

```bash
WORKDIR="/doc"
```

```bash
# XeLaTeX
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":"$WORKDIR" "$IMAGE" latexmk -pdfxe
```

```bash
# pdfLaTeX
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":"$WORKDIR" "$IMAGE" latexmk -pdf
```

### GitHub Action

1. Создайте новый репозиторий `Use this template -> Create a new repository`.

2. Измените разрешения для `GITHUB_TOKEN` на **read and write**. Подробнее: [setting the permissions of the `GITHUB_TOKEN` for your repository](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#setting-the-permissions-of-the-github_token-for-your-repository).

3. Сделайте коммит в основную ветку.

Поздравляем! Создается новый `Draft` релиз с PDF во вложениях.

## Полезное

- [Mануал](https://manpages.debian.org/testing/latexmk/latexmk.1.en.html) по `latexmk`.

- Можно использовать свободный аналог Times New Roman — [PT Astra Serif](http://astralinux.ru/information/fonts-astra/font-ptastra-serif-ver1003.zip) и [PT Astra Sans](http://astralinux.ru/information/fonts-astra/font-ptastrasans-ttf-ver1002.zip). Подробнее: [опции класса документа](https://github.com/afaikiac/latex-g7-32/tree/G7-32#%D0%BE%D0%BF%D1%86%D0%B8%D0%B8-%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%B0-%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D0%B0).

- Кратко о различиях XeLaTeX и pdfLaTeX: [other compilers](https://www.overleaf.com/learn/latex/Choosing_a_LaTeX_Compiler#Other_compilers).
