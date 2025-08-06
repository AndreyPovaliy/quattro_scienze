library(readr)
library(tidyverse)
library(openxlsx)
library(lubridate)

# df3 <- read_csv("Deksametazon.csv")
# codes3 <- read_csv("codes_3.csv")
# 
# 
# # names_cals <- data.frame(native = colnames(df3))
# # write.xlsx(names_cals, "names_cals.xlsx")
# names_cals <- read.xlsx("names_cals.xlsx")
# colnames(df3) <- names_cals$en
# 
# df3 <- inner_join(df3, codes3,by=c("code"="code"))

# write.xlsx(df3, "df3_ext.xlsx")

library(readxl)
df3_ext <- read_excel("df3_ext.xlsx")

df3_ext <- df3_ext %>% 
  mutate(gender = as.factor(if_else(gender == 1 ,"мужской","женский")),
         group = as.factor(if_else(group == 1 ,"Группа А","Группа Б")),
         cat_scale_grade0 = as.factor(case_when(
           cat_scale_grade0 == 1 ~ "Есть",
           cat_scale_grade0 == 0 ~ "Нет")),
         cat_scale_grade2 = as.factor(case_when(
           cat_scale_grade2 == 1 ~ "Есть",
           cat_scale_grade2 == 0 ~ "Нет")),
         cat_scale_grade3w = as.factor(case_when(
           cat_scale_grade3w== 1 ~ "Есть",
           cat_scale_grade3w == 0 ~ "Нет"))
  )
df3_ext_cat <- df3_ext %>% 
  filter(cat_scale_grade2 == "Есть")
# calc --------------------------------------------------------------------


df3_ext$cat_scale_grade0
df3_ext %>% 
  group_by(group) %>% 
  summarise(
    mean = mean(vas0),
    sd = sd(vas0)
  )



ggplot(df3_ext_cat, aes(vas24, fill = as.factor(group))) +
  geom_density(alpha = 0.5)+
  labs(
    title = "Распределние по уровню ВАШ боли при поступлении",
    x = "баллы",
    y = "плотность",
    fill = "группа"
  )

t.test(df3_ext_cat$vas6~df3_ext_cat$group)

ggplot(df3_ext, aes(group, fill = as.factor(cat_scale_grade2))) +
  geom_bar()+
  labs(
    title = "Распределние по анкетированию катострофизации боли",
    x = "баллы",
    y = "грыппы",
    fill = "катострофизация"
  )


df3_ext %>% 
  group_by(group) %>% 
  summarise(
    table = table(cat_scale2)
  )

chisq.test(df3_ext_cat$painkillers_3,df3_ext_cat$group)



# результаты --------------------------------------------------------------
# боль
chisq.test(df3_ext$painkillers_1,df3_ext$group)
chisq.test(df3_ext$painkillers_2,df3_ext$group)
chisq.test(df3_ext$painkillers_3,df3_ext$group)


chisq.test(df3_ext_cat$painkillers_1,df3_ext_cat$group)
chisq.test(df3_ext_cat$painkillers_2,df3_ext_cat$group)
chisq.test(df3_ext_cat$painkillers_3,df3_ext_cat$group)


t.test(df3_ext$vas6~df3_ext$group)

t.test(df3_ext$vas36~df3_ext$group)
t.test(df3_ext$vas_3_week~df3_ext$group)

t.test(df3_ext_cat$vas6~df3_ext_cat$group)
t.test(df3_ext_cat$vas12~df3_ext_cat$group)
t.test(df3_ext_cat$vas24~df3_ext_cat$group)
t.test(df3_ext_cat$vas36~df3_ext_cat$group)
t.test(df3_ext_cat$vas_3_week~df3_ext_cat$group)

chisq.test(df3_ext$quadriceps_test1,df3_ext$group)
chisq.test(df3_ext$quadriceps_test2,df3_ext$group)
chisq.test(df3_ext$quadriceps_test3,df3_ext$group)


# безопасность
glimpse(df3_ext)

t.test(df3_ext$glucosae6~df3_ext$group)
t.test(df3_ext$glucosae12~df3_ext$group)

t.test(df3_ext$crb12~df3_ext$group)
t.test(df3_ext$crb24~df3_ext$group)

chisq.test(df3_ext$dindo_clavien,df3_ext$group)



drug_list %>% 
  group_by(day) %>% 
  summarise(
    n=n()
  )

drug_1 <- drug_list[drug_list$day == 1,]
drug_2 <- drug_list[drug_list$day == 2,]
drug_3 <- drug_list[drug_list$day == 3,]

chisq.test(drug_3$is_opic,drug_3$group)

table(df3_ext$cat_scale2)

chisq.test(df3_ext$cat_scale_grade2,df3_ext$group)


# visul res ---------------------------------------------------------------
ggplot(df3_ext, aes(group, vas12, fill = as.factor(group))) +
  geom_boxplot()+
  labs(
    title = "ВАШ 12 часов",
    subtitle = "p-value = 0.01715",
    x = "группы",
    y = "баллы",
    fill = "группы"
  )

ggplot(df3_ext, aes(group, vas24, fill = as.factor(group))) +
  geom_boxplot()+
  labs(
    title = "ВАШ 24 часа",
    subtitle = "p-value = 0.006577",
    x = "группы",
    y = "баллы",
    fill = "группы"
  )

df3_ext$cat_scale_grade3w
ggplot(df3_ext, aes(group, fill = as.factor(cat_scale_grade3w))) +
  geom_bar()+
  labs(
    title = "Распределние по анкетированию катострофизации боли",
    x = "баллы",
    y = "грыппы",
    fill = "катострофизация"
  )

t.test(df3_ext$vas12~df3_ext$group)
t.test(df3_ext$vas24~df3_ext$group)

chisq.test(df3_ext$cat_scale_grade3w,df3_ext$group)


t.test(df3_ext$glucosae6~df3_ext$group)
ggplot(df3_ext, aes(group, glucosae6, fill = as.factor(group))) +
  geom_boxplot()+
  labs(
    title = "Глюкоза на 6 часов",
    subtitle = "p-value = 0.09425",
    x = "группы",
    y = "ммоль/л",
    fill = "группы"
  )
t.test(df3_ext$glucosae24~df3_ext$group)
ggplot(df3_ext, aes(group, glucosae24, fill = as.factor(group))) +
  geom_boxplot()+
  labs(
    title = "Глюкоза на 24 часа",
    subtitle = "p-value = 0.5092",
    x = "группы",
    y = "ммоль/л",
    fill = "группы"
  )

t.test(df3_ext$crb12~df3_ext$group)
ggplot(df3_ext, aes(group, crb12, fill = as.factor(group))) +
  geom_boxplot()+
  labs(
    title = "Уровень СРБ на 12 часов",
    subtitle = "p-value = 0.9778",
    x = "группы",
    y = "мг/л",
    fill = "группы"
  )
t.test(df3_ext$crb24~df3_ext$group)
ggplot(df3_ext, aes(group, crb24, fill = as.factor(group))) +
  geom_boxplot()+
  labs(
    title = "Уровень СРБ на 24 часа",
    subtitle = "p-value = 0.2136",
    x = "группы",
    y = "мг/л",
    fill = "группы"
  )
