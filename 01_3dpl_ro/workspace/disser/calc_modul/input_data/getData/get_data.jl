using DataFrames, XLSX
way_to_df = "./workspace/disser/calc_modul/input_data/getData/data.xlsx"

xf = XLSX.readxlsx(way_to_df)

df1 = DataFrame(XLSX.readtable(way_to_df, "1"))
df2a = DataFrame(XLSX.readtable(way_to_df, "2a"))
df2b = DataFrame(XLSX.readtable(way_to_df, "2b"))
df3 = DataFrame(XLSX.readtable(way_to_df, "3"))
