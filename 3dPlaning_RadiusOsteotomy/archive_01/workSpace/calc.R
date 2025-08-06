source("./workSpace/data/data_script.R")


# df1 ---------------------------------------------------------------------
# в целом
escribir(paste("\n\n","Описание всей ретроспективной выборки","\n\n"))
calculate_function(dataframe1 = df1,list1 = list1,sample = "ретроспективная выборка", compairMain = 1)
# по доминирующей руке
escribir(paste("\n\n","Сравнение по повреждению доминирующей руки","\n\n"))
calculate_function(dataframe1 = df1,list1 = list1,sample = "ретроспективная выборка", compairMain = 2)
# по типу деформации
escribir(paste("\n\n","Сравнение по типу деформации","\n\n"))
calculate_function(dataframe1 = df1,list1 = list1,sample = "ретроспективная выборка", compairMain = 3)
# по типу активности
escribir(paste("\n\n","Сравнение по типу активности","\n\n"))
calculate_function(dataframe1 = df1,list1 = list1,sample = "ретроспективная выборка", compairMain = 4)

# df2a ---------------------------------------------------------------------
escribir(paste("\n\n","Биллатеральноые исследование","\n\n"))
calculate_function(dataframe1 = df2a,list1 = list2a,sample = "выборка здоровых людей", compairMain = 1)

# df2b ---------------------------------------------------------------------
escribir(paste("\n\n","Точность шаблона","\n\n"))
calculate_function(dataframe1 = df2b,list1 = list2b,sample = "проспективаная экспериментальная выборка", compairMain = 1)


# df3 ---------------------------------------------------------------------
escribir(paste("\n\n","Проспективное исследование","\n\n"))
calculate_function(dataframe1 = df3,list1 = list3,sample = "проспективаная клиническая выборка", compairMain = 1)

# по доминирующей руке
escribir(paste("\n\n","Сравнение по повреждению доминирующей руки","\n\n"))
df3_dominant <- subset(df3, df3$damage_dominant_hand == "Да") 
calculate_function(dataframe1 = df3_dominant,list1 = list3,sample = "выборка c повреждением доминирующей руки", compairMain = 1)
df3_nodominant <- subset(df3, df3$damage_dominant_hand == "Нет") 
calculate_function(dataframe1 = df3_nodominant,list1 = list3,sample = "выборка c повреждением недоминирующей руки", compairMain = 1)

# по типу деформации
escribir(paste("\n\n","Сравнение по типу деформации","\n\n"))
df3_dorsal <- subset(df3, df3$type_deformation == "Дорсальная") 
calculate_function(dataframe1 = df3_dorsal,list1 = list3,sample = "выборка c дорсальной деформацией", compairMain = 1)
df3_palmar <- subset(df3, df3$type_deformation == "Ладонная") 
calculate_function(dataframe1 = df3_palmar,list1 = list3,sample = "выборка c ладонной деформацией", compairMain = 1)


# по типу активности
escribir(paste("\n\n","Сравнение по типу активности","\n\n"))
df3_manual <- subset(df3, df3$type_action == "Ручной") 
calculate_function(dataframe1 = df3_manual,list1 = list3,sample = "выборка c ручным типом труда", compairMain = 1)
df3_nonmanual <- subset(df3, df3$type_action == "Смешанный") 
calculate_function(dataframe1 = df3_nonmanual,list1 = list3,sample = "выборка cо смешанным типом труда", compairMain = 1)

