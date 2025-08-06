cd /Users/andreypovaliy/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/
touch main_RadiusRetro.R


echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/00_preprocessing_data/05_script.R\")" >> main_RadiusRetro.R
echo "library(ggplot2)" >> main_RadiusRetro.R
echo "library(ggpie)" >> main_RadiusRetro.R
echo "library(caret)" >> main_RadiusRetro.R
echo "library(pROC)" >> main_RadiusRetro.R


echo "FileName <- \"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/textRadiusRetro.txt\"" >> main_RadiusRetro.R

echo "# 01_Аннотация ------------------------------------------------------------" >> main_RadiusRetro.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/01_Аннотация.R\")" >> main_RadiusRetro.R

echo "# 02_Введение ------------------------------------------------------------" >> main_RadiusRetro.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/02_Введение.R\")" >> main_RadiusRetro.R

echo "# 03_Цель ------------------------------------------------------------" >> main_RadiusRetro.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/03_Цель.R\")" >> main_RadiusRetro.R

echo "# 04_Материалы ------------------------------------------------------------" >> main_RadiusRetro.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/04_Материалы.R\")" >> main_RadiusRetro.R

echo "# 05_Результаты ------------------------------------------------------------" >> main_RadiusRetro.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/05_Результаты.R\")" >> main_RadiusRetro.R

echo "# 06_Дисскуссия ------------------------------------------------------------" >> main_RadiusRetro.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/06_Дисскуссия.R\")" >> main_RadiusRetro.R

echo "# 07_Выводы ------------------------------------------------------------" >> main_RadiusRetro.R
echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/07_Выводы.R\")" >> main_RadiusRetro.R

echo "source(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/00_preprocessing_data//05_script.R\")" >> main_RadiusRetro.R

mkdir deconst
cd /Users/andreypovaliy/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group//deconst/

mkdir text;
touch 01_Аннотация.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/text/01_Аннотация.txt\")" >> 01_Аннотация.R

touch 02_Введение.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/text/02_Введение.txt\")" >> 02_Введение.R

touch 03_Цель.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/text/03_Цель.txt\")" >> 03_Цель.R

touch 04_Материалы.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/text/04_Материалы.txt\")" >> 04_Материалы.R

touch 05_Результаты.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/text/05_Результаты.txt\")" >> 05_Результаты.R

touch 06_Дисскуссия.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/text/06_Дисскуссия.txt\")" >> 06_Дисскуссия.R

touch 07_Выводы.R
echo "escribir_rT(\"~/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/text/07_Выводы.txt\")" >> 07_Выводы.R


cd /Users/andreypovaliy/Documents/Science/3dPlaning_RadiusOsteotomy/text_work/articles/Retro_group/deconst/text/
touch 01_Аннотация.txt
touch 02_Введение.txt
touch 03_Цель.txt
touch 04_Материалы.txt
touch 05_Результаты.txt
touch 06_Дисскуссия.txt
touch 07_Выводы.txt