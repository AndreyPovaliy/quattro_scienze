source("./workspace/disser/calc_modul/input_data/data_script.R")
# run 1st stage
calculate_function_2group(df1, list1, "общая выборка", 2)
calculate_function_2group(df1, list1, "общая выборка", 3)
calculate_function_2group(df1, list1, "общая выборка", 4)

# run 2nd A stage
calculate_function_2group(df2a, list2a, "общая выборка", 1)

# run 2nd B stage
calculate_function_2group(df2b, list2b, "общая выборка", 1)

# run 3d stage
calculate_function_2group(df3, list3, "общая выборка", 1)

calculate_function_2group(df3_ddh_y, list3, "выборка повреждения доминирующей руки", 1)
calculate_function_2group(df3_ddh_n, list3, "выборка повреждения недоминирующей руки", 1)

calculate_function_2group(df3_td_dorsal, list3, "дорсальной деформации", 1)
calculate_function_2group(df3_td_palmar, list3, "ладонной деформации", 1)

calculate_function_2group(df3_ta_manual, list3, "ручного труда", 1)
calculate_function_2group(df3_ta_mix, list3, "смешанного труда", 1)




         
