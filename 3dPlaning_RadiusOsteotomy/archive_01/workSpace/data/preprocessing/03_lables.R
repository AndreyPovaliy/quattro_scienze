####1######
df1$group <- factor(df1$group, 
                     levels=c(1),
                     labels = c(
                       "1"="Ретроспективная группа"
                     ))	


df1$gender <- factor(df1$gender, 
                            levels=c(1, 2),
                            labels = c(
                              "1"="Женский",
                              "2"="Мужской"
                            ))	

df1$side<- factor(df1$side, 
                         levels=c(1, 2),
                         labels = c(
                           "1"="Левая",
                           "2"="Правая"
                         ))

df1$dominant_hand	<- factor(df1$dominant_hand, 
                                   levels=c(1, 2),
                                   labels = c(
                                     "1"="Левая",
                                     "2"="Правая"
                                   ))

df1$damage_dominant_hand	<- factor(df1$damage_dominant_hand, 
                                          levels=c(1, 2),
                                          labels = c(
                                            "1"="Да",
                                            "2"="Нет"
                                          ))

df1$type_deformation	<- factor(df1$type_deformation, 
                                      levels=c(1, 2),
                                      labels = c(
                                        "1"="Дорсальная",
                                        "2"="Ладонная"
                                      ))

df1$type_action  <- factor(df1$type_action, 
                                  levels=c(1, 2, 3),
                                  labels = c(
                                    "1"="Смешанный",
                                    "2"="Ручной",
                                    "3"= "Смешанный"
                                  ))


df1$ri_gr_d_0		<- factor(df1$ri_gr_d_0, 
                                levels=c(1, 2, 3),
                                labels = c(
                                  "1"="Меньше",
                                  "2"="Норма",
                                  "3"="Больше"
                                ))

df1$vt_gr_d_0		<- factor(df1$vt_gr_d_0, 
                                levels=c(1, 2, 3),
                                labels = c(
                                  "1"="Меньше",
                                  "2"="Норма",
                                  "3"="Больше"
                                ))

df1$rh_gr_d_0<- factor(df1$rh_gr_d_0, 
                              levels=c(1, 2,3 ),
                              labels = c(
                                "1"="Меньше",
                                "2"="Норма",
                                "3"="Больше"
                              ))


df1$ri_gr_n<- factor(df1$ri_gr_n, 
                            levels=c(1, 2, 3),
                            labels = c(
                              "1"="Меньше",
                              "2"="Норма",
                              "3"="Больше"
                            ))


df1$vt_gr_n<- factor(df1$vt_gr_n, 
                            levels=c(1, 2, 3),
                            labels = c(
                              "1"="Меньше",
                              "2"="Норма",
                              "3"="Больше"
                            ))


df1$rh_gr_n<- factor(df1$rh_gr_n, 
                            levels=c(1, 2, 3),
                            labels = c(
                              "1"="Меньше",
                              "2"="Норма",
                              "3"="Больше"
                            ))

df1$ri_gr_d_12<- factor(df1$ri_gr_d_12, 
                               levels=c(1, 2, 3),
                               labels = c(
                                 "1"="Меньше",
                                 "2"="Норма",
                                 "3"="Больше"
                               ))


df1$vt_gr_d_12<- factor(df1$vt_gr_d_12, 
                               levels=c(1, 2, 3),
                               labels = c(
                                 "1"="Меньше",
                                 "2"="Норма",
                                 "3"="Больше"
                               ))


df1$rh_gr_d_12<- factor(df1$rh_gr_d_12, 
                               levels=c(1, 2, 3),
                               labels = c(
                                 "1"="Меньше",
                                 "2"="Норма",
                                 "3"="Больше"
                               ))

####2a######

df2a$gender	<- factor(df2a$gender, 
                             levels=c(1, 2),
                             labels = c(
                               "1"="Женский",
                               "2"="Мужской"
                             ))	



df2a$type_action 	<- factor(df2a$type_action, 
                                   levels=c(1, 2),
                                   labels = c(
                                     "1"="Смешанный",
                                     "2"="Ручной"
                                   ))


df2a$side<- factor(df2a$side, 
                          levels=c(1, 2),
                          labels = c(
                            "1"="Левая",
                            "2"="Правая"
                          ))




####2b######
df2b$gender <- factor(df2b$gender, 
                           levels=c(1, 2),
                           labels = c(
                             "1"="Женский",
                             "2"="Мужской"
                           ))


df2b$stage<- factor(df2b$stage, 
                         levels=c(1, 2),
                         labels = c(
                           "1"="Виртуальное моделирование",
                           "2"="После операции"
                         ))






df2b$ri_grad	<- factor(df2b$ri_grad, 
                            levels=c(1, 2, 3),
                            labels = c(
                              "1"="Меньше",
                              "2"="Норма",
                              "3"="Больше"
                            ))


df2b$vt_grad<- factor(df2b$vt_grad, 
                           levels=c(1, 2, 3),
                           labels = c(
                             "1"="Меньше",
                             "2"="Норма",
                             "3"="Больше"
                           ))



df2b$rh_grad<- factor(df2b$rh_grad, 
                           levels=c(1, 2, 3),
                           labels = c(
                             "1"="Меньше",
                             "2"="Норма",
                             "3"="Больше"
                           ))


df2b$side <- factor(df2b$side, 
                         levels=c(1, 2),
                         labels = c(
                           "1"="Левая",
                           "2"="Правая"
                         ))


df2b$dominant_hand<- factor(df2b$dominant_hand, 
                                 levels=c(1, 2),
                                 labels = c(
                                   "1"="Левая",
                                   "2"="Правая"
                                 ))


df2b$damage_dominant_hand<- factor(df2b$damage_dominant_hand, 
                                        levels=c(1, 2),
                                        labels = c(
                                          "1"="Да",
                                          "2"="Нет"
                                        ))


df2b$type_deformation<- factor(df2b$type_deformation, 
                                    levels=c(1, 2),
                                    labels = c(
                                      "1"="Дорсальная",
                                      "2"="Ладонная"
                                    ))




####3######
df3$group <- factor(df3$group, 
                      levels=c(1, 2),
                      labels = c(
                        "1"="Контрольная группа",
                        "2"="Протокол 3d"
                      ))


df3$gender <- factor(df3$gender, 
                       levels=c(1, 2),
                       labels = c(
                         "1"="Женский",
                         "2"="Мужской"
                       ))

df3$side <- factor(df3$side, 
                     levels=c(1, 2),
                     labels = c(
                       "1"="Левая",
                       "2"="Правая"
                     ))

df3$dominant_hand<- factor(df3$dominant_hand, 
                             levels=c(1, 2),
                             labels = c(
                               "1"="Левая",
                               "2"="Правая"
                             ))

df3$damage_dominant_hand<- factor(df3$damage_dominant_hand, 
                                    levels=c(1, 2),
                                    labels = c(
                                      "1"="Да",
                                      "2"="Нет"
                                    ))

df3$type_deformation<- factor(df3$type_deformation, 
                                levels=c(1, 2),
                                labels = c(
                                  "1"="Дорсальная",
                                  "2"="Ладонная"
                                ))

df3$type_action<- factor(df3$type_action, 
                           levels=c(1, 2),
                           labels = c(
                             "1"="Смешанный",
                             "2"="Ручной"
                           ))



df3$ri_gr_d0		<- factor(df3$ri_gr_d0, 
                          levels=c(1, 2, 3),
                          labels = c(
                            "1"="Меньше",
                            "2"="Норма",
                            "3"="Больше"
                          ))

df3$vt_gr_d0		<- factor(df3$vt_gr_d0, 
                          levels=c(1, 2, 3),
                          labels = c(
                            "1"="Меньше",
                            "2"="Норма",
                            "3"="Больше"
                          ))

df3$rh_gr_d0<- factor(df3$rh_gr_d0, 
                        levels=c(1, 2,3 ),
                        labels = c(
                          "1"="Меньше",
                          "2"="Норма",
                          "3"="Больше"
                        ))


df3$ri_gr_n<- factor(df3$ri_gr_n, 
                       levels=c(1, 2, 3),
                       labels = c(
                         "1"="Меньше",
                         "2"="Норма",
                         "3"="Больше"
                       ))


df3$vt_gr_n<- factor(df3$vt_gr_n, 
                       levels=c(1, 2, 3),
                       labels = c(
                         "1"="Меньше",
                         "2"="Норма",
                         "3"="Больше"
                       ))


df3$rh_gr_n<- factor(df3$rh_gr_n, 
                       levels=c(1, 2, 3),
                       labels = c(
                         "1"="Меньше",
                         "2"="Норма",
                         "3"="Больше"
                       ))


df3$vas_3<- factor(df3$vas_3, 
                     levels=c(1, 2, 3, 4,5),
                     labels = c(
                       "1"="1 балл",
                       "2"="2 балла",
                       "3"="3 балла",
                       "4"="4 балла",
                       "5"="5 баллов"
                     ))


df3$ri_gr_d_12<- factor(df3$ri_gr_d_12, 
                          levels=c(1, 2, 3),
                          labels = c(
                            "1"="Меньше",
                            "2"="Норма",
                            "3"="Больше"
                          ))


df3$vt_gr_d_12<- factor(df3$vt_gr_d_12, 
                          levels=c(1, 2, 3),
                          labels = c(
                            "1"="Меньше",
                            "2"="Норма",
                            "3"="Больше"
                          ))


df3$rh_gr_d_12<- factor(df3$rh_gr_d_12, 
                          levels=c(1, 2, 3),
                          labels = c(
                            "1"="Меньше",
                            "2"="Норма",
                            "3"="Больше"
                          ))

