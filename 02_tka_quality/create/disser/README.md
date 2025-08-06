# Общее описание

Настоящий модуль создан для того чтобы разворацивать структуру диссертационного исследования.

Техническая реализация выполнена на языке R, системное администрирование на языках BASH, Python.

## Структура:

-   Планирование проекта в файле (рабочий файл) [plan](./create_disser/plan.txt)
-   Сборка кода .R по плану в файле (не требует редактирования) [preFile](./create_disser/preFile.py) с помощью [buildScript](./create_disser/buildScript.sh) --\> [scriptProject.sh](./create_disser/scriptProject.sh)
- создание 1 кольца проекта (./create_disser/run_1.sh)
-   удаление прокта [del.sh](./create_disser/del.sh)
