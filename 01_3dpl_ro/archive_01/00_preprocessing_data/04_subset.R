
# Ch3 ---------------------------------------------------------------------
dfRadRetroDdomH_Y <- subset(dfRadRetro, damage_dominant_hand == DdomH_Y)
dfRadRetroDdomH_N <- subset(dfRadRetro, damage_dominant_hand == DdomH_N)

dfRadRetroTypeDef_P <- subset(dfRadRetro, type_deformation == TypeDef_P)
dfRadRetroTypeDef_D <- subset(dfRadRetro, type_deformation == TypeDef_D)


dfRadRetroTypeAct_H <- subset(dfRadRetro, type_action == TypeAct_H)
dfRadRetroTypeAct_B <- subset(dfRadRetro, type_action == TypeAct_B)
dfRadRetroTypeAct_RT <- subset(dfRadRetro, type_action == TypeAct_RT)


# Ch4 ---------------------------------------------------------------------
dfRadBillat_B <-  subset(dfRadBillat, type_action == TypeAct_B)
dfRadBillat_H <-  subset(dfRadBillat, type_action == TypeAct_H)

dfRadBillatLeft <-  subset(dfRadBillat, side == Side4aLeft)
dfRadBillat_B_Left <-  subset(dfRadBillat_B, side == Side4aLeft)
dfRadBillat_H_Left <-  subset(dfRadBillat_H, side == Side4aLeft)

dfRadBillatRight <-  subset(dfRadBillat, side == Side4aRight)
dfRadBillat_B_Right  <-  subset(dfRadBillat_B, side == Side4aRight)
dfRadBillat_H_Right  <-  subset(dfRadBillat_H, side == Side4aRight)

dfRadProt1 <-  subset(dfRadProt, stage == Stage4b)

# Ch5 ---------------------------------------------------------------------
gr1<- subset(dfRad, group == Control)
gr2<- subset(dfRad, group == Protocol_3d)

domYes<- subset(dfRad, damage_dominant_hand == DdomH_Y)
gr1_domYes<- subset(domYes, group == Control)
gr2_domYes<- subset(domYes, group == Protocol_3d)

domNo<- subset(dfRad, damage_dominant_hand == DdomH_N)
gr1_domNo<- subset(domNo, group == Control)
gr2_domNo<- subset(domNo, group == Protocol_3d)

defDors<- subset(dfRad, type_deformation == TypeDef_D)
gr1_defDors<- subset(defDors, group == Control)
gr2_defDors<- subset(defDors, group == Protocol_3d)

defPalm<- subset(dfRad, type_deformation == TypeDef_P)
gr1_defPalm<- subset(defPalm, group == Control)
gr2_defPalm<- subset(defPalm, group == Protocol_3d)

defHand<- subset(dfRad, type_action == TypeAct_H)
gr1_defHand<- subset(defHand, group == Control)
gr2_defHand<- subset(defHand, group == Protocol_3d)

defBrain<- subset(dfRad, type_action == TypeAct_B)
gr1_defBrain<- subset(defBrain, group == Control)
gr2_defBrain<- subset(defBrain, group == Protocol_3d)

defRT<- subset(dfRad, type_action == TypeAct_RT)
gr1_defRT<- subset(defRT, group == Control)
gr2_defRT<- subset(defRT, group == Protocol_3d)
