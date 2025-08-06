# Load the package
library(bib2df)
library(tidyverse)
library(ggplot2)

# modificators ------------------------------------------------------------
pages <- 40
actual_year <- 2015




# Specify the path to your BibTeX file
bib_file_path <- "workspace/disser/str/deconst/02_Глава1/draft/references.bib"

# Parse the BibTeX file into a tibble
bib_dataframe <- bib2df(bib_file_path)
bib_dataframe$is_rus <- ifelse(bib_dataframe$LANGID == "ru", 1,0)
bib_dataframe$is_ge <- ifelse(bib_dataframe$LANGID == "de", 1,0)
bib_dataframe$BIBTEXKEY[is.na(bib_dataframe$LANGID)]
bib_dataframe$ACTUAL <- ifelse(bib_dataframe$YEAR >actual_year, 1,0)
print(paste("Процент актуальных источников: ", round(sum(bib_dataframe$ACTUAL)/nrow(bib_dataframe)*100,2), "%.",
            "Всего: ", nrow(bib_dataframe),
            "На немецком: ",sum(bib_dataframe$is_ge),
            "Русскоязычные: ",sum(bib_dataframe$is_rus)
            ))


bib_dataframe %>% 
  ggplot(aes(x = YEAR, fill = as.factor(ACTUAL)))+
  geom_density()

file_content <- readLines("workspace/disser/str/deconst/02_Глава1/draft/draft_ch1.Rmd", warn = FALSE)

combined_text <- paste(file_content, collapse = "")

# Подсчитываем количество символов
num_characters <- nchar(combined_text)

# Выводим результат
print(paste("Количество страниц:", num_characters/2000))
print(paste("Осталось до полного объема:", round((1 - num_characters/2000/pages)*100,2),"%"))

