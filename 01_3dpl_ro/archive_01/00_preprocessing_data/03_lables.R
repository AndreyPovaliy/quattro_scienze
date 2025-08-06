####1######
dfRadRetro$gender <- factor(dfRadRetro$gender, 
                            levels=c(1, 2),
                            labels = c(
                              "1"="Женский",
                              "2"="Мужской"
                            ))	

dfRadRetro$side<- factor(dfRadRetro$side, 
                         levels=c(1, 2),
                         labels = c(
                           "1"="Левая",
                           "2"="Правая"
                         ))

dfRadRetro$dominant_hand	<- factor(dfRadRetro$dominant_hand, 
                                   levels=c(1, 2),
                                   labels = c(
                                     "1"="Левая",
                                     "2"="Правая"
                                   ))

dfRadRetro$damage_dominant_hand	<- factor(dfRadRetro$damage_dominant_hand, 
                                          levels=c(1, 2),
                                          labels = c(
                                            "1"="Да",
                                            "2"="Нет"
                                          ))

dfRadRetro$type_deformation	<- factor(dfRadRetro$type_deformation, 
                                      levels=c(1, 2),
                                      labels = c(
                                        "1"="Дорсальная",
                                        "2"="Ладонная"
                                      ))

dfRadRetro$type_action  <- factor(dfRadRetro$type_action, 
                                  levels=c(1, 2, 3),
                                  labels = c(
                                    "1"="Смешанный",
                                    "2"="Ручной",
                                    "3"= "Пенсионер"
                                  ))


dfRadRetro$ri_gr_d_0		<- factor(dfRadRetro$ri_gr_d_0, 
                         levels=c(1, 2, 3),
                         labels = c(
                           "1"="Меньше",
                           "2"="Норма",
                           "3"="Больше"
                         ))

dfRadRetro$vt_gr_d_0		<- factor(dfRadRetro$vt_gr_d_0, 
                         levels=c(1, 2, 3),
                         labels = c(
                           "1"="Меньше",
                           "2"="Норма",
                           "3"="Больше"
                         ))

dfRadRetro$rh_gr_d_0<- factor(dfRadRetro$rh_gr_d_0, 
                       levels=c(1, 2,3 ),
                       labels = c(
                         "1"="Меньше",
                         "2"="Норма",
                         "3"="Больше"
                       ))


dfRadRetro$ri_gr_n<- factor(dfRadRetro$ri_gr_n, 
                levels=c(1, 2, 3),
                labels = c(
                  "1"="Меньше",
                  "2"="Норма",
                  "3"="Больше"
                ))


dfRadRetro$vt_gr_n<- factor(dfRadRetro$vt_gr_n, 
                levels=c(1, 2, 3),
                labels = c(
                  "1"="Меньше",
                  "2"="Норма",
                  "3"="Больше"
                ))


dfRadRetro$rh_gr_n<- factor(dfRadRetro$rh_gr_n, 
                levels=c(1, 2, 3),
                labels = c(
                  "1"="Меньше",
                  "2"="Норма",
                  "3"="Больше"
                ))

dfRadRetro$ri_gr_d_12<- factor(dfRadRetro$ri_gr_d_12, 
                           levels=c(1, 2, 3),
                           labels = c(
                             "1"="Меньше",
                             "2"="Норма",
                             "3"="Больше"
                           ))


dfRadRetro$vt_gr_d_12<- factor(dfRadRetro$vt_gr_d_12, 
                           levels=c(1, 2, 3),
                           labels = c(
                             "1"="Меньше",
                             "2"="Норма",
                             "3"="Больше"
                           ))


dfRadRetro$rh_gr_d_12<- factor(dfRadRetro$rh_gr_d_12, 
                           levels=c(1, 2, 3),
                           labels = c(
                             "1"="Меньше",
                             "2"="Норма",
                             "3"="Больше"
                           ))

####2a######

dfRadBillat$gender	<- factor(dfRadBillat$gender, 
                             levels=c(1, 2),
                             labels = c(
                               "1"="Женский",
                               "2"="Мужской"
                             ))	



dfRadBillat$type_action 	<- factor(dfRadBillat$type_action, 
                                   levels=c(1, 2),
                                   labels = c(
                                     "1"="Смешанный",
                                     "2"="Ручной"
                                   ))


dfRadBillat$side<- factor(dfRadBillat$side, 
                          levels=c(1, 2),
                          labels = c(
                            "1"="Левая",
                            "2"="Правая"
                          ))




####2b######
dfRadProt$gender <- factor(dfRadProt$gender, 
                       levels=c(1, 2),
                       labels = c(
                         "1"="Женский",
                         "2"="Мужской"
                       ))


dfRadProt$stage<- factor(dfRadProt$stage, 
                         levels=c(1, 2),
                         labels = c(
                           "1"="Виртуальное моделирование",
                           "2"="После операции"
                         ))






dfRadProt$ri_grad	<- factor(dfRadProt$ri_grad, 
                          levels=c(1, 2, 3),
                          labels = c(
                            "1"="Меньше",
                            "2"="Норма",
                            "3"="Больше"
                          ))


dfRadProt$vt_grad<- factor(dfRadProt$vt_grad, 
                          levels=c(1, 2, 3),
                          labels = c(
                            "1"="Меньше",
                            "2"="Норма",
                            "3"="Больше"
                          ))



dfRadProt$rh_grad<- factor(dfRadProt$rh_grad, 
                         levels=c(1, 2, 3),
                         labels = c(
                           "1"="Меньше",
                           "2"="Норма",
                           "3"="Больше"
                         ))


dfRadProt$side <- factor(dfRadProt$side, 
                     levels=c(1, 2),
                     labels = c(
                       "1"="Левая",
                       "2"="Правая"
                     ))


dfRadProt$dominant_hand<- factor(dfRadProt$dominant_hand, 
                             levels=c(1, 2),
                             labels = c(
                               "1"="Левая",
                               "2"="Правая"
                             ))


dfRadProt$damage_dominant_hand<- factor(dfRadProt$damage_dominant_hand, 
                                    levels=c(1, 2),
                                    labels = c(
                                      "1"="Да",
                                      "2"="Нет"
                                    ))


dfRadProt$type_deformation<- factor(dfRadProt$type_deformation, 
                                levels=c(1, 2),
                                labels = c(
                                  "1"="Дорсальная",
                                  "2"="Ладонная"
                                ))




####3######
dfRad$group <- factor(dfRad$group, 
                      levels=c(1, 2),
                      labels = c(
                        "1"="Контрольная группа",
                        "2"="Протокол 3d"
                      ))


dfRad$gender <- factor(dfRad$gender, 
                       levels=c(1, 2),
                       labels = c(
                         "1"="Женский",
                         "2"="Мужской"
                       ))

dfRad$side <- factor(dfRad$side, 
                     levels=c(1, 2),
                     labels = c(
                       "1"="Левая",
                       "2"="Правая"
                     ))

dfRad$dominant_hand<- factor(dfRad$dominant_hand, 
                             levels=c(1, 2),
                             labels = c(
                               "1"="Левая",
                               "2"="Правая"
                             ))

dfRad$damage_dominant_hand<- factor(dfRad$damage_dominant_hand, 
                                    levels=c(1, 2),
                                    labels = c(
                                      "1"="Да",
                                      "2"="Нет"
                                    ))

dfRad$type_deformation<- factor(dfRad$type_deformation, 
                                levels=c(1, 2),
                                labels = c(
                                  "1"="Дорсальная",
                                  "2"="Ладонная"
                                ))

dfRad$type_action<- factor(dfRad$type_action, 
                           levels=c(1, 2),
                           labels = c(
                             "1"="Смешанный",
                             "2"="Ручной"
                           ))



dfRad$ri_gr_d0		<- factor(dfRad$ri_gr_d0, 
                         levels=c(1, 2, 3),
                         labels = c(
                           "1"="Меньше",
                           "2"="Норма",
                           "3"="Больше"
                         ))

dfRad$vt_gr_d0		<- factor(dfRad$vt_gr_d0, 
                         levels=c(1, 2, 3),
                         labels = c(
                           "1"="Меньше",
                           "2"="Норма",
                           "3"="Больше"
                         ))

dfRad$rh_gr_d0<- factor(dfRad$rh_gr_d0, 
                       levels=c(1, 2,3 ),
                       labels = c(
                         "1"="Меньше",
                         "2"="Норма",
                         "3"="Больше"
                       ))


dfRad$ri_gr_n<- factor(dfRad$ri_gr_n, 
                levels=c(1, 2, 3),
                labels = c(
                  "1"="Меньше",
                  "2"="Норма",
                  "3"="Больше"
                ))


dfRad$vt_gr_n<- factor(dfRad$vt_gr_n, 
                levels=c(1, 2, 3),
                labels = c(
                  "1"="Меньше",
                  "2"="Норма",
                  "3"="Больше"
                ))


dfRad$rh_gr_n<- factor(dfRad$rh_gr_n, 
                levels=c(1, 2, 3),
                labels = c(
                  "1"="Меньше",
                  "2"="Норма",
                  "3"="Больше"
                ))


dfRad$vas_3<- factor(dfRad$vas_3, 
              levels=c(1, 2, 3, 4,5),
              labels = c(
                "1"="1 балл",
                "2"="2 балла",
                "3"="3 балла",
                "4"="4 балла",
                "5"="5 баллов"
              ))


dfRad$ri_gr_d_12<- factor(dfRad$ri_gr_d_12, 
                  levels=c(1, 2, 3),
                  labels = c(
                    "1"="Меньше",
                    "2"="Норма",
                    "3"="Больше"
                  ))


dfRad$vt_gr_d_12<- factor(dfRad$vt_gr_d_12, 
                  levels=c(1, 2, 3),
                  labels = c(
                    "1"="Меньше",
                    "2"="Норма",
                    "3"="Больше"
                  ))


dfRad$rh_gr_d_12<- factor(dfRad$rh_gr_d_12, 
                  levels=c(1, 2, 3),
                  labels = c(
                    "1"="Меньше",
                    "2"="Норма",
                    "3"="Больше"
                  ))

