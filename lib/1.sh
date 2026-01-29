#!/bin/bash

OUTPUT="project.txt"

# очищаем файл вывода
> "$OUTPUT"

# ищем все обычные файлы рекурсивно
find . -type f | while read -r file; do
    # проверяем, что файл текстовый
    if file "$file" | grep -q text; then
        echo "===== FILE: $file =====" >> "$OUTPUT"
        cat "$file" >> "$OUTPUT"
        echo -e "\n\n" >> "$OUTPUT"
    fi
done
