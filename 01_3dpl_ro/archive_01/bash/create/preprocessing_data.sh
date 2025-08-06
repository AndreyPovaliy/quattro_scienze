mkdir ./workSpace/data
mkdir ./workSpace/data/preprocessing

touch workSpace/data/data_script.R
touch workSpace/data/preprocessing/01_link.R
echo "WayToData <- \"./workSpace/data/getData/data.xlsx\"" >> workSpace/data/preprocessing/01_link.R
echo "Sheet <- \"Sheet 1\"" >> workSpace/data/preprocessing/01_link.R
echo "FileName <- \"./workSpace/text_Disser.txt\"" >>workSpace/data/preprocessing/01_link.R
touch workSpace/data/preprocessing/02_samples.R
echo "library(ggplot2)" >> workSpace/data/preprocessing/02_samples.R
echo "library(openxlsx)" >> workSpace/data/preprocessing/02_samples.R
echo "df<- read.xlsx(xlsxFile = WayToData, sheet = Sheet)">> workSpace/data/preprocessing/02_samples.R
touch workSpace/data/preprocessing/03_lables.R
touch workSpace/data/preprocessing/04_subsampl.R
mkdir workSpace/data/preprocessing/func;


cp -r ./bash/func/ workSpace/data/preprocessing/func/


echo "source(\"./workSpace/data/preprocessing/01_link.R\")" >> workSpace/data/data_script.R
echo "source(\"./workSpace/data/preprocessing/02_samples.R\")" >> workSpace/data/data_script.R
echo "source(\"./workSpace/data/preprocessing/03_lables.R\")" >> workSpace/data/data_script.R
echo "source(\"./workSpace/data/preprocessing/04_subsampl.R\")" >> workSpace/data/data_script.R
echo "source(\"./workSpace/data/preprocessing/func/func.R\")" >> workSpace/data/data_script.R
echo "source(\"./workSpace/data/preprocessing/func/plot.R\")" >> workSpace/data/data_script.R


mkdir workSpace/data/getData


touch workSpace/data/getData/01_modeling.R
touch workSpace/data/getData/02_cheaking_model.R
touch workSpace/data/getData/03_func_model.R
