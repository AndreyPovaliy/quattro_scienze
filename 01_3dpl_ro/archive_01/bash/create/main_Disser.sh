cd ./workSpace
mkdir deconst
mkdir img
touch main_Disser.R
touch planDisser.txt
echo "source(\"./workSpace/data/data_script.R\")" >> main_Disser.R
echo "library(ggplot2)" >> main_Disser.R
echo "library(ggpie)" >> main_Disser.R



bash ../bash/create/deconst/TitleList.sh
bash ../bash/create/deconst/Intro.sh
bash ../bash/create/deconst/Chapter_1.sh
bash ../bash/create/deconst/Chapter_2.sh
bash ../bash/create/deconst/Chapter_3.sh
bash ../bash/create/deconst/Chapter_4.sh
bash ../bash/create/deconst/Chapter_5.sh
bash ../bash/create/deconst/Conclusion.sh










