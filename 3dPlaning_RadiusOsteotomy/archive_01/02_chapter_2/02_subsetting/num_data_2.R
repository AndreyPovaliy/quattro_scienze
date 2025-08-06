# source --------------------------------------------------------------


# Расчет числовых показателей ---------------------------------------------

# RetroStage --------------------------------------------------------------


colnames(dfRadRetro[sapply(dfRadRetro, is.numeric)])
dfRadRetro_num_col <- c(
  "years",
  "age",
  "bmi",
  "ri_mes_d_0",
  "vt_mes_d_0",
  "rh_mes_d_0",
  "ri_mes_n",
  "vt_mes_n",
  "rh_mes_n")

dfRadRetro_num_desc <-c(
  "время с момента опреации ",
  "возраст ", 
  "ИМТ ",
  "НЛК поврежденной руки ",
  "ЛН поврежденной руки",
  "ЛВ поврежденной руки",
  "НЛК неповрежденной руки ",
  "ЛН неповрежденной руки",
  "ЛВ неповрежденной руки")

dfRadRetro_num_mes <-c(
  " лет",
  " лет", 
  " кг/м2",
  " градусов",
  " градусов",
  " градусов",
  " градусов",
  " градусов",
  " градусов")

dfRadRetro_names <- data.frame(dfRadRetro_num_col,dfRadRetro_num_desc,dfRadRetro_num_mes)

# общая
dfRadRetro_num_before  <- dfRadRetro[dfRadRetro_names$dfRadRetro_num_col]

# по повреждению доминирующей руки
dfRadRetroDdomH_Y_num_before  <- dfRadRetroDdomH_Y[dfRadRetro_names$dfRadRetro_num_col]
dfRadRetroDdomH_N_num_before  <- dfRadRetroDdomH_N[dfRadRetro_names$dfRadRetro_num_col]


dfRadRetroTypeDef_P_num_before   <- dfRadRetroTypeDef_P[dfRadRetro_names$dfRadRetro_num_col]
dfRadRetroTypeDef_D_num_before   <- dfRadRetroTypeDef_D[dfRadRetro_names$dfRadRetro_num_col]


dfRadRetroTypeAct_H_num_before   <- dfRadRetroTypeAct_H[dfRadRetro_names$dfRadRetro_num_col]
dfRadRetroTypeAct_B_num_before   <- dfRadRetroTypeAct_B[dfRadRetro_names$dfRadRetro_num_col]
dfRadRetroTypeAct_RT_num_before   <- dfRadRetroTypeAct_RT[dfRadRetro_names$dfRadRetro_num_col]


# BillatStage --------------------------------------------------------------
namesCol_numdfRadBillat_2 <- colnames(dfRadBillat[sapply(dfRadBillat, is.numeric)])
dfRadBillat_num_col_b <-  namesCol_numdfRadBillat_2[1:2]

dfRadBillat_num_before  <- dfRadBillat[1:34,dfRadBillat_num_col_b]

dfRadBillat_H_num_before   <- dfRadBillat_H[1:34,dfRadBillat_num_col_b]
dfRadBillat_B_num_before   <- dfRadBillat_B[1:34,dfRadBillat_num_col_b]


# TemplStage --------------------------------------------------------------
namesCol_numdfRadProt1_2 <- colnames(dfRadProt1[sapply(dfRadProt1, is.numeric)])
dfRadProt1_num_col_b <-  namesCol_numdfRadProt1_2[1:2]

dfRadProt1_num_before  <- dfRadProt1[dfRadProt1_num_col_b]


# ProspectStage --------------------------------------------------------------
namesCol_numdfRad <- colnames(dfRad[sapply(dfRad, is.numeric)])
dfRad_num_col_b <-  namesCol_numdfRad[2:12]
dfRad_num_col_b <- c(dfRad_num_col_b,"group")
dfRad_num_before  <- dfRad[dfRad_num_col_b]


namesCol_numGr1 <- colnames(gr1[sapply(gr1, is.numeric)])
Gr1_num_col_b <-  namesCol_numGr1[2:12]
Gr1_num_before  <- gr1[Gr1_num_col_b]

namesCol_numGr2 <- colnames(gr2[sapply(gr2, is.numeric)])
Gr2_num_col_b <-  namesCol_numGr2[2:12]
Gr2_num_before  <- gr2[Gr1_num_col_b]

