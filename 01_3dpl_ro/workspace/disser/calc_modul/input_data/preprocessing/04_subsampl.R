# 1st stage
df1_ddh_y <- subset(df1, df1$damage_dominant_hand == "Да")
df1_ddh_n <- subset(df1, df1$damage_dominant_hand == "Нет")

df1_td_dorsal <- subset(df1, df1$damage_dominant_hand == "Дорсальная")
df1_td_palmar <- subset(df1, df1$damage_dominant_hand == "Ладонная")

df1_ta_manual <- subset(df1, df1$type_action == "Ручной")
df1_ta_mix <- subset(df1, df1$type_action == "Смешанный")



# 3rd stage
df3_ddh_y <- subset(df3, df3$damage_dominant_hand == "Да")
df3_ddh_n <- subset(df3, df3$damage_dominant_hand == "Нет")

df3_td_dorsal <- subset(df3, df3$type_deformation == "Дорсальная")
df3_td_palmar <- subset(df3, df3$type_deformation == "Ладонная")

df3_ta_manual <- subset(df3, df3$type_action == "Ручной")
df3_ta_mix <- subset(df3, df3$type_action == "Смешанный")

