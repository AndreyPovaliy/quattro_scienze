# source --------------------------------------------------------------


# Расчет категориальных показателей ---------------------------------------------
# RetroStage --------------------------------------------------------------

namesCol_catReatro_2 <- colnames(dfRadRetro[sapply(dfRadRetro, is.factor)])
dfRadRetro_cat_col_b <-  namesCol_catReatro_2[1:12]

dfRadRetro_cat_before  <- dfRadRetro[dfRadRetro_cat_col_b]

# по повреждению доминирующей руки
dfRadRetroDdomH_Y_cat_before  <- dfRadRetroDdomH_Y[dfRadRetro_cat_col_b]
dfRadRetroDdomH_N_cat_before  <- dfRadRetroDdomH_N[dfRadRetro_cat_col_b]


dfRadRetroTypeDef_P_cat_before   <- dfRadRetroTypeDef_P[dfRadRetro_cat_col_b]
dfRadRetroTypeDef_D_cat_before   <- dfRadRetroTypeDef_D[dfRadRetro_cat_col_b]


dfRadRetroTypeAct_H_cat_before   <- dfRadRetroTypeAct_H[dfRadRetro_cat_col_b]
dfRadRetroTypeAct_B_cat_before   <- dfRadRetroTypeAct_B[dfRadRetro_cat_col_b]
dfRadRetroTypeAct_RT_cat_before   <- dfRadRetroTypeAct_RT[dfRadRetro_cat_col_b]


# BillatStage --------------------------------------------------------------

namesCol_cat_dfRadBillat_2 <- colnames(dfRadBillat[sapply(dfRadBillat, is.factor)])
dfRadBillat_cat_col_b <-  namesCol_cat_dfRadBillat_2[1:2]

dfRadBillat_cat_before  <- dfRadBillat[1:34,dfRadBillat_cat_col_b]

dfRadBillat_H_cat_before   <- dfRadBillat_H[1:34,dfRadBillat_cat_col_b]
dfRadBillat_B_cat_before   <- dfRadBillat_B[1:34,dfRadBillat_cat_col_b]


# TemplStage --------------------------------------------------------------
namesCol_catdfRadProt1_2 <- colnames(dfRadProt1[sapply(dfRadProt1, is.factor)])
dfRadProt1_cat_col_b <-  namesCol_catdfRadProt1_2[c(1,3:6)]

dfRadProt1_cat_before  <- dfRadProt1[dfRadProt1_cat_col_b]


# ProspectStage --------------------------------------------------------------

namesCol_catdfRad <- colnames(dfRad[sapply(dfRad, is.factor)])
dfRad_cat_col_b <-  namesCol_catdfRad[c(2:13)]
dfRad_cat_col_b <- c(dfRad_cat_col_b,"group")
dfRad_cat_before  <- dfRad[dfRad_cat_col_b]


namesCol_catGr1 <- colnames(gr1[sapply(gr1, is.factor)])
Gr1_cat_col_b <-  namesCol_catGr1[2:13]
Gr1_cat_before  <- gr1[Gr1_cat_col_b]

namesCol_catGr2 <- colnames(gr2[sapply(gr2, is.factor)])
Gr2_cat_col_b <-  namesCol_catGr2[2:13]
Gr2_cat_before  <- gr2[Gr1_cat_col_b]
