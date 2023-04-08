# Шаблон LaTeX для оформления отчетов о НИР, расчётно-пояснительной записки к курсовым и дипломным работам

## Опции класса документа

### XeLaTeX

1. `astra` (по умолчанию) — свободные шрифты Astra Sans, Astra Serif, Liberation Mono.
2. `times` — шрифты Times New Roman, Arial, Courier New. Необходимо, чтобы у вас был подписан лицензионный договор с правообладателем шрифтов — компанией Monotype Imaging Inc.
3. `cm` — шрифты CMU, которые обычно включены в TeX Live.

### PdfLaTeX

1. `times` (по умолчанию) — шрифты из пакета cyrtimes: Nimbus Roman и Nimbus Sans.
2. `pscyr` — шрифты из пакета pscyr: Antiqua PSCyr, Textbook PSCyr, ERKurier PSCyr.
3. `cm` — шрифты CM, которые обычно включены в TeX Live.

Если какой-то шрифт не найден, то вместо него будет использоваться соответствующий шрифт CM.

Эти опции нужно задавать в `\documentclass`, например так: 

```latex
\documentclass[utf8x, times, 14pt]{G7-32}
```

## Структура шаблона

```palin
latex-g7-32
├── G7-32 
│         LaTeX-файлы стилей и классов для стандарта GOST 7.32
├── GOST 
│         стили библиографии для оформления по GOST
├── inc 
│         изображения и исходные файлы, используемые в документе
├── lib
│         пакеты и макросы LaTeX, используемые в документе
├── tex 
│         исходные файлы LaTeX для документа
├── .latexmkrc
│         конфигурация для утилиты latexmk, которая задает
│         переменные среды и определяет настройки сборки документа
└── main.tex 
          основной файл LaTeX для документа, который включает
          структуру документа и вызовы других файлов
```

## Сборка шаблона

```bash
git clone --recurse-submodules https://github.com/afaikiac/latex-g7-32.git
```

### Overleaf

[How to upload a project](https://www.overleaf.com/learn/how-to/Uploading_a_project)

### Docker

```bash
IMAGE="afaikiac/latex-g7-32:overleaf"
```

```bash
docker pull $IMAGE
```

```bash
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/doc "$IMAGE" latexmk main
```

### Локально

#### Шрифты

Для отчета можно использовать свободный аналог шрифтов Times New Roman — PT Astra.

- [PT Astra Serif](http://astralinux.ru/information/fonts-astra/font-ptastra-serif-ver1003.zip)
- [PT Astra Sans](http://astralinux.ru/information/fonts-astra/font-ptastrasans-ttf-ver1002.zip)

##### Установка на Linux

1. Скопируйте шрифты в `$HOME/.fonts/`.
2. Выполните команду `fc-cache -f -v`.

##### Установка на Windows

1. Скопируйте шрифты в каталог `C:\Windows\Fonts`.
2. Выполните команду `fc-cache -f -v`.

#### Зависимости

...
