mkdir ./workspace/article
mkdir ./workspace/article/str
touch ./workspace/article/str/main_article.R
mkdir ./workspace/article/str/deconst
mkdir ./workspace/article/str/deconst/text_article


echo "FileName <- \"./workspace/article/str/text_article.txt\"">> ./workspace/article/str/main_article.R


echo "# 01_Аннотация ------------------------------------------------------------" >> ./workspace/article/str/main_article.R
echo "source(\"./workspace/article/str/deconst/01_Аннотация.R\")

" >> ./workspace/article/str/main_article.R
touch ./workspace/article/str/deconst/01_Аннотация.R
echo "escribir_rT(\"./workspace/article/str/deconst/text_article/01_Аннотация.txt\")" >> ./workspace/article/str/deconst/01_Аннотация.R
touch ./workspace/article/str/deconst/text_article/01_Аннотация.txt
echo "# 01_Аннотация" >> ./workspace/article/str/deconst/text_article/01_Аннотация.txt


echo "# 02_Введение ------------------------------------------------------------" >> ./workspace/article/str/main_article.R
echo "source(\"./workspace/article/str/deconst/02_Введение.R\")

" >> ./workspace/article/str/main_article.R
touch ./workspace/article/str/deconst/02_Введение.R
echo "escribir_rT(\"./workspace/article/str/deconst/text_article/02_Введение.txt\")" >> ./workspace/article/str/deconst/02_Введение.R
touch ./workspace/article/str/deconst/text_article/02_Введение.txt
echo "# 02_Введение" >> ./workspace/article/str/deconst/text_article/02_Введение.txt


echo "# 03_Цель ------------------------------------------------------------" >> ./workspace/article/str/main_article.R
echo "source(\"./workspace/article/str/deconst/03_Цель.R\")

" >> ./workspace/article/str/main_article.R
touch ./workspace/article/str/deconst/03_Цель.R
echo "escribir_rT(\"./workspace/article/str/deconst/text_article/03_Цель.txt\")" >> ./workspace/article/str/deconst/03_Цель.R
touch ./workspace/article/str/deconst/text_article/03_Цель.txt
echo "# 03_Цель" >> ./workspace/article/str/deconst/text_article/03_Цель.txt


echo "# 04_Материалы_и_методы ------------------------------------------------------------" >> ./workspace/article/str/main_article.R
echo "source(\"./workspace/article/str/deconst/04_Материалы_и_методы.R\")

" >> ./workspace/article/str/main_article.R
touch ./workspace/article/str/deconst/04_Материалы_и_методы.R
echo "escribir_rT(\"./workspace/article/str/deconst/text_article/04_Материалы_и_методы.txt\")" >> ./workspace/article/str/deconst/04_Материалы_и_методы.R
touch ./workspace/article/str/deconst/text_article/04_Материалы_и_методы.txt
echo "# 04_Материалы_и_методы" >> ./workspace/article/str/deconst/text_article/04_Материалы_и_методы.txt


echo "# 05_Результаты ------------------------------------------------------------" >> ./workspace/article/str/main_article.R
echo "source(\"./workspace/article/str/deconst/05_Результаты.R\")

" >> ./workspace/article/str/main_article.R
touch ./workspace/article/str/deconst/05_Результаты.R
echo "escribir_rT(\"./workspace/article/str/deconst/text_article/05_Результаты.txt\")" >> ./workspace/article/str/deconst/05_Результаты.R
touch ./workspace/article/str/deconst/text_article/05_Результаты.txt
echo "# 05_Результаты" >> ./workspace/article/str/deconst/text_article/05_Результаты.txt


echo "# 06_Выводы ------------------------------------------------------------" >> ./workspace/article/str/main_article.R
echo "source(\"./workspace/article/str/deconst/06_Выводы.R\")

" >> ./workspace/article/str/main_article.R
touch ./workspace/article/str/deconst/06_Выводы.R
echo "escribir_rT(\"./workspace/article/str/deconst/text_article/06_Выводы.txt\")" >> ./workspace/article/str/deconst/06_Выводы.R
touch ./workspace/article/str/deconst/text_article/06_Выводы.txt
echo "# 06_Выводы" >> ./workspace/article/str/deconst/text_article/06_Выводы.txt


