# it's important to write path in bash script from projectroot, в R script from home directory

mkdir ./workSpace/protocol/str
touch ./workSpace/protocol/str/main_protocol.R
mkdir ./workSpace/protocol/str/deconst
mkdir ./workSpace/protocol/str/deconst/text

# path of function escribir(), it's necessary to import
echo "FileName <- \"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/text_protocol.txt\"">> ./workSpace/protocol/str/main_protocol.R


# this code block may to use with replace "01_Общая_информация" to "user_name"
echo "# 01_Общая_информация ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/01_Общая_информация.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/01_Общая_информация.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/01_Общая_информация.txt\")" >> ./workSpace/protocol/str/deconst/01_Общая_информация.R
touch ./workSpace/protocol/str/deconst/text/01_Общая_информация.txt
echo "\"#\" 01_Общая_информация" >> ./workSpace/protocol/str/deconst/text/01_Общая_информация.txt

# point of end of copy block

echo "# 02_Обоснование_исследования ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/02_Обоснование_исследования.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/02_Обоснование_исследования.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/02_Обоснование_исследования.txt\")" >> ./workSpace/protocol/str/deconst/02_Обоснование_исследования.R
touch ./workSpace/protocol/str/deconst/text/02_Обоснование_исследования.txt
echo "\"#\" 02_Обоснование_исследования" >> ./workSpace/protocol/str/deconst/text/02_Обоснование_исследования.txt



echo "## 02_1_Актуальность_исследования ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/02_1_Актуальность_исследования.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/02_1_Актуальность_исследования.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/02_1_Актуальность_исследования.txt\")" >> ./workSpace/protocol/str/deconst/02_1_Актуальность_исследования.R
touch ./workSpace/protocol/str/deconst/text/02_1_Актуальность_исследования.txt
echo "\"##\" 02_1_Актуальность_исследования" >> ./workSpace/protocol/str/deconst/text/02_1_Актуальность_исследования.txt



echo "## 02_2_Степень_разработанности_проблемы ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/02_2_Степень_разработанности_проблемы.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/02_2_Степень_разработанности_проблемы.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/02_2_Степень_разработанности_проблемы.txt\")" >> ./workSpace/protocol/str/deconst/02_2_Степень_разработанности_проблемы.R
touch ./workSpace/protocol/str/deconst/text/02_2_Степень_разработанности_проблемы.txt
echo "\"##\" 02_2_Степень_разработанности_проблемы" >> ./workSpace/protocol/str/deconst/text/02_2_Степень_разработанности_проблемы.txt



echo "# 03_Цель_исследования ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/03_Цель_исследования.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/03_Цель_исследования.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/03_Цель_исследования.txt\")" >> ./workSpace/protocol/str/deconst/03_Цель_исследования.R
touch ./workSpace/protocol/str/deconst/text/03_Цель_исследования.txt
echo "\"#\" 03_Цель_исследования" >> ./workSpace/protocol/str/deconst/text/03_Цель_исследования.txt



echo "# 04_Задачи_исследования ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/04_Задачи_исследования.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/04_Задачи_исследования.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/04_Задачи_исследования.txt\")" >> ./workSpace/protocol/str/deconst/04_Задачи_исследования.R
touch ./workSpace/protocol/str/deconst/text/04_Задачи_исследования.txt
echo "\"#\" 04_Задачи_исследования" >> ./workSpace/protocol/str/deconst/text/04_Задачи_исследования.txt



echo "# 05_Дизайн_диссертационного_исследования ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/05_Дизайн_диссертационного_исследования.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/05_Дизайн_диссертационного_исследования.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/05_Дизайн_диссертационного_исследования.txt\")" >> ./workSpace/protocol/str/deconst/05_Дизайн_диссертационного_исследования.R
touch ./workSpace/protocol/str/deconst/text/05_Дизайн_диссертационного_исследования.txt
echo "\"#\" 05_Дизайн_диссертационного_исследования" >> ./workSpace/protocol/str/deconst/text/05_Дизайн_диссертационного_исследования.txt



echo "## 05_1_Общая_структура_исследования ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/05_1_Общая_структура_исследования.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/05_1_Общая_структура_исследования.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/05_1_Общая_структура_исследования.txt\")" >> ./workSpace/protocol/str/deconst/05_1_Общая_структура_исследования.R
touch ./workSpace/protocol/str/deconst/text/05_1_Общая_структура_исследования.txt
echo "\"##\" 05_1_Общая_структура_исследования" >> ./workSpace/protocol/str/deconst/text/05_1_Общая_структура_исследования.txt



echo "# 05_2_Первый_этап_исследования_ретроспективный ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/05_2_Первый_этап_исследования_ретроспективный.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/05_2_Первый_этап_исследования_ретроспективный.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/05_2_Первый_этап_исследования_ретроспективный.txt\")" >> ./workSpace/protocol/str/deconst/05_2_Первый_этап_исследования_ретроспективный.R
touch ./workSpace/protocol/str/deconst/text/05_2_Первый_этап_исследования_ретроспективный.txt
echo "\"#\" 05_2_Первый_этап_исследования_ретроспективный" >> ./workSpace/protocol/str/deconst/text/05_2_Первый_этап_исследования_ретроспективный.txt



echo "## 05_3_Описание_второго_этапа_исследования_экспериментальный ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/05_3_Описание_второго_этапа_исследования_экспериментальный.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/05_3_Описание_второго_этапа_исследования_экспериментальный.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/05_3_Описание_второго_этапа_исследования_экспериментальный.txt\")" >> ./workSpace/protocol/str/deconst/05_3_Описание_второго_этапа_исследования_экспериментальный.R
touch ./workSpace/protocol/str/deconst/text/05_3_Описание_второго_этапа_исследования_экспериментальный.txt
echo "\"##\" 05_3_Описание_второго_этапа_исследования_экспериментальный" >> ./workSpace/protocol/str/deconst/text/05_3_Описание_второго_этапа_исследования_экспериментальный.txt



echo "### 05_3_1_Первая_часть_второго_этапа_исследования ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/05_3_1_Первая_часть_второго_этапа_исследования.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/05_3_1_Первая_часть_второго_этапа_исследования.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/05_3_1_Первая_часть_второго_этапа_исследования.txt\")" >> ./workSpace/protocol/str/deconst/05_3_1_Первая_часть_второго_этапа_исследования.R
touch ./workSpace/protocol/str/deconst/text/05_3_1_Первая_часть_второго_этапа_исследования.txt
echo "\"###\" 05_3_1_Первая_часть_второго_этапа_исследования" >> ./workSpace/protocol/str/deconst/text/05_3_1_Первая_часть_второго_этапа_исследования.txt



echo "### 05_3_2_Вторая_часть_второго_этапа_исследования ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/05_3_2_Вторая_часть_второго_этапа_исследования.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/05_3_2_Вторая_часть_второго_этапа_исследования.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/05_3_2_Вторая_часть_второго_этапа_исследования.txt\")" >> ./workSpace/protocol/str/deconst/05_3_2_Вторая_часть_второго_этапа_исследования.R
touch ./workSpace/protocol/str/deconst/text/05_3_2_Вторая_часть_второго_этапа_исследования.txt
echo "\"###\" 05_3_2_Вторая_часть_второго_этапа_исследования" >> ./workSpace/protocol/str/deconst/text/05_3_2_Вторая_часть_второго_этапа_исследования.txt



echo "### 05_4_Описание_третьего_этапа_исследования_проспективное_клиническое_исследование ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/05_4_Описание_третьего_этапа_исследования_проспективное_клиническое_исследование.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/05_4_Описание_третьего_этапа_исследования_проспективное_клиническое_исследование.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/05_4_Описание_третьего_этапа_исследования_проспективное_клиническое_исследование.txt\")" >> ./workSpace/protocol/str/deconst/05_4_Описание_третьего_этапа_исследования_проспективное_клиническое_исследование.R
touch ./workSpace/protocol/str/deconst/text/05_4_Описание_третьего_этапа_исследования_проспективное_клиническое_исследование.txt
echo "\"###\" 05_4_Описание_третьего_этапа_исследования_проспективное_клиническое_исследование" >> ./workSpace/protocol/str/deconst/text/05_4_Описание_третьего_этапа_исследования_проспективное_клиническое_исследование.txt



echo "# 06_Лечение ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/06_Лечение.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/06_Лечение.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/06_Лечение.txt\")" >> ./workSpace/protocol/str/deconst/06_Лечение.R
touch ./workSpace/protocol/str/deconst/text/06_Лечение.txt
echo "\"#\" 06_Лечение" >> ./workSpace/protocol/str/deconst/text/06_Лечение.txt

echo "# 07_Оценка_безопасности ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/07_Оценка_безопасности.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/07_Оценка_безопасности.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/07_Оценка_безопасности.txt\")" >> ./workSpace/protocol/str/deconst/07_Оценка_безопасности.R
touch ./workSpace/protocol/str/deconst/text/07_Оценка_безопасности.txt
echo "\"#\" 07_Оценка_безопасности" >> ./workSpace/protocol/str/deconst/text/07_Оценка_безопасности.txt


echo "# 08_Методы_сбора_и_обработки_данных ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/08_Методы_сбора_и_обработки_данных.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/08_Методы_сбора_и_обработки_данных.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/08_Методы_сбора_и_обработки_данных.txt\")" >> ./workSpace/protocol/str/deconst/08_Методы_сбора_и_обработки_данных.R
touch ./workSpace/protocol/str/deconst/text/08_Методы_сбора_и_обработки_данных.txt
echo "\"#\" 08_Методы_сбора_и_обработки_данных" >> ./workSpace/protocol/str/deconst/text/08_Методы_сбора_и_обработки_данных.txt

echo "# 09_Прямой_доступ_к_первичным_данным_документации ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/09_Прямой_доступ_к_первичным_данным_документации.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/09_Прямой_доступ_к_первичным_данным_документации.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/09_Прямой_доступ_к_первичным_данным_документации.txt\")" >> ./workSpace/protocol/str/deconst/09_Прямой_доступ_к_первичным_данным_документации.R
touch ./workSpace/protocol/str/deconst/text/09_Прямой_доступ_к_первичным_данным_документации.txt
echo "\"#\" 09_Прямой_доступ_к_первичным_данным_документации" >> ./workSpace/protocol/str/deconst/text/09_Прямой_доступ_к_первичным_данным_документации.txt


echo "# 10_Контроль_качества_и_обеспечение_качества ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/10_Контроль_качества_и_обеспечение_качества.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/10_Контроль_качества_и_обеспечение_качества.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/10_Контроль_качества_и_обеспечение_качества.txt\")" >> ./workSpace/protocol/str/deconst/10_Контроль_качества_и_обеспечение_качества.R
touch ./workSpace/protocol/str/deconst/text/10_Контроль_качества_и_обеспечение_качества.txt
echo "\"#\" 10_Контроль_качества_и_обеспечение_качества" >> ./workSpace/protocol/str/deconst/text/10_Контроль_качества_и_обеспечение_качества.txt

echo "# 11_Этика ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/11_Этика.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/11_Этика.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/11_Этика.txt\")" >> ./workSpace/protocol/str/deconst/11_Этика.R
touch ./workSpace/protocol/str/deconst/text/11_Этика.txt
echo "\"#\" 11_Этика" >> ./workSpace/protocol/str/deconst/text/11_Этика.txt


echo "# 12_Соблюдение_правил_работы_с_персональными_данными ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/12_Соблюдение_правил_работы_с_персональными_данными.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/12_Соблюдение_правил_работы_с_персональными_данными.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/12_Соблюдение_правил_работы_с_персональными_данными.txt\")" >> ./workSpace/protocol/str/deconst/12_Соблюдение_правил_работы_с_персональными_данными.R
touch ./workSpace/protocol/str/deconst/text/12_Соблюдение_правил_работы_с_персональными_данными.txt
echo "\"#\" 12_Соблюдение_правил_работы_с_персональными_данными" >> ./workSpace/protocol/str/deconst/text/12_Соблюдение_правил_работы_с_персональными_данными.txt



echo "# 13_Финансирование_и_страхование ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/13_Финансирование_и_страхование.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/13_Финансирование_и_страхование.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/13_Финансирование_и_страхование.txt\")" >> ./workSpace/protocol/str/deconst/13_Финансирование_и_страхование.R
touch ./workSpace/protocol/str/deconst/text/13_Финансирование_и_страхование.txt
echo "\"#\" 13_Финансирование_и_страхование" >> ./workSpace/protocol/str/deconst/text/13_Финансирование_и_страхование.txt



echo "# 14_Ожидаемые_результаты ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/14_Ожидаемые_результаты.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/14_Ожидаемые_результаты.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/14_Ожидаемые_результаты.txt\")" >> ./workSpace/protocol/str/deconst/14_Ожидаемые_результаты.R
touch ./workSpace/protocol/str/deconst/text/14_Ожидаемые_результаты.txt
echo "\"#\" 14_Ожидаемые_результаты" >> ./workSpace/protocol/str/deconst/text/14_Ожидаемые_результаты.txt



echo "# 15_Возможная_область_применения_результатов_диссертационной_работы ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/15_Возможная_область_применения_результатов_диссертационной_работы.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/15_Возможная_область_применения_результатов_диссертационной_работы.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/15_Возможная_область_применения_результатов_диссертационной_работы.txt\")" >> ./workSpace/protocol/str/deconst/15_Возможная_область_применения_результатов_диссертационной_работы.R
touch ./workSpace/protocol/str/deconst/text/15_Возможная_область_применения_результатов_диссертационной_работы.txt
echo "\"#\" 15_Возможная_область_применения_результатов_диссертационной_работы" >> ./workSpace/protocol/str/deconst/text/15_Возможная_область_применения_результатов_диссертационной_работы.txt



echo "# 16_Планируемая_апробация_результатов ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/16_Планируемая_апробация_результатов.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/16_Планируемая_апробация_результатов.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/16_Планируемая_апробация_результатов.txt\")" >> ./workSpace/protocol/str/deconst/16_Планируемая_апробация_результатов.R
touch ./workSpace/protocol/str/deconst/text/16_Планируемая_апробация_результатов.txt
echo "\"#\" 16_Планируемая_апробация_результатов" >> ./workSpace/protocol/str/deconst/text/16_Планируемая_апробация_результатов.txt



echo "# 17_Практическая_значимость ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/17_Практическая_значимость.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/17_Практическая_значимость.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/17_Практическая_значимость.txt\")" >> ./workSpace/protocol/str/deconst/17_Практическая_значимость.R
touch ./workSpace/protocol/str/deconst/text/17_Практическая_значимость.txt
echo "\"#\" 17_Практическая_значимость" >> ./workSpace/protocol/str/deconst/text/17_Практическая_значимость.txt



echo "# 18_Охраноспособность ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/18_Охраноспособность.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/18_Охраноспособность.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/18_Охраноспособность.txt\")" >> ./workSpace/protocol/str/deconst/18_Охраноспособность.R
touch ./workSpace/protocol/str/deconst/text/18_Охраноспособность.txt
echo "\"#\" 18_Охраноспособность" >> ./workSpace/protocol/str/deconst/text/18_Охраноспособность.txt



echo "# 19_Список_используемой_литературы ------------------------------------------------------------" >> ./workSpace/protocol/str/main_protocol.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/19_Список_используемой_литературы.R\")" >> ./workSpace/protocol/str/main_protocol.R
touch ./workSpace/protocol/str/deconst/19_Список_используемой_литературы.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/workSpace/protocol/str/deconst/text/19_Список_используемой_литературы.txt\")" >> ./workSpace/protocol/str/deconst/19_Список_используемой_литературы.R
touch ./workSpace/protocol/str/deconst/text/19_Список_используемой_литературы.txt
echo "\"#\" 19_Список_используемой_литературы" >> ./workSpace/protocol/str/deconst/text/19_Список_используемой_литературы.txt