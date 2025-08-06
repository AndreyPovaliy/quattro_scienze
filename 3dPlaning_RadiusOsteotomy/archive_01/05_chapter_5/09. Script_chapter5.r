####Глава 5####
escribir(print(paste("В этой главе буду представлены результаты клинического исследования. Были исследованы результаты лечения, полученных с февраля 2017 г. по апрель 2020 года, ",length(dfRad$name)," пациентов (",data.frame(table(dfRad$Gender))[2,2]," мужчин, ",data.frame(table(dfRad$Gender))[1,2]," женщина), ",length(dfRad$name)," разных верхних конечностей. 
В этой выборке представлены ",data.frame(table(dfRad$Side))[2,2]," правых верхних конечностей и ",data.frame(table(dfRad$Side))[1,2]," левых, для ",data.frame(table(dfRad$Damage_dominant_hand))[1,2]," из которых поврежденная рука была доминирующей.
У всех пациентов заболевание проявлялась болью в запястье, деформацией и ограничением объема движений. Диагноз посттравматической деформации дистального метаэпифиза лучевой кости устанавливался на основании полного сбора анамнеза и данных рентгенологического исследования лучезапястного сустава в прямой и боковой проекциях. Все пациенты перенесли внесуставной перелом, первоначально была выполнена закрытая ручная репозиция отломков с последующей гипсовой иммобилизацией в среднем на 6-8 недель. Хирургическое лечение этим пациентам ранее  не проводилось. Среднее время между событием травмы и установкой диагноза посттравматической деформации составило 7±2,45 месяцев (от 4 до 12 месяцев).")))






TextPvalue(pvalueQualitative(dfRad$DASH12,dfRad$Group),"По анкетированию DASH" )
TextPvalue(pvalueQualitative(dfRad$SF_16_РН_12,dfRad$Group),"По анкетированию SF-16 физический компонент" )
TextPvalue(pvalueQualitative(dfRad$SF_16_MН_12,dfRad$Group),"По анкетированию SF-16 психологический компонент" )
TextPvalue(pvalueQualitative(dfRad$Minutes_1,dfRad$Group),"По времени длительности операции" )
TextPvalue(pvalueQualitative(dfRad$Rg_quantity  ,dfRad$Group),"По количеству снимков" )
TextPvalue(pvalueQualitative(dfRad$Rg_time,dfRad$Group),"По сумарной длительности рентгенологического излучения" )
TextPvalue(pvalueQualitative(dfRad$Rg_zV,dfRad$Group),"По лучевой нагрузке" )
TextPvalue(pvalueQualitative(dfRad$Flex_Ext_12,dfRad$Group),"По функции сгибания-разгибания в лучезапястном на 12 месяц" )
TextPvalue(pvalueQualitative(dfRad$Diviation,dfRad$Group),"По функции дивиации в лучезапястном на 12 месяц" )
TextPvalue(pvalueQualitative(dfRad$pron_sup_12 ,dfRad$Group),"По функции пронации-супинации в лучезапястном на 12 месяц" )    
TextPvalue(pvalueQualitative(dfRad$Grip_strength_12,dfRad$Group),"По силе захвата на 12 месяц" )
TextPvalue(pvalueQualitative(dfRad$VAS3,dfRad$Group),"По оценке ВАШ на 3й день после опрерации" )
TextPvalue(pvalueQualitative(dfRad$Ri_MesD12,dfRad$Group),"По абсолютной оценке лучевого наклона" )
TextPvalue(pvalueQualitative(dfRad$Vt_MesD12,dfRad$Group),"По абсолютной оценке ладонного наклона" )
TextPvalue(pvalueQualitative(dfRad$Rh_MesD12 ,dfRad$Group),"По абсолютной оценке лучелучевого индекса" )        
TextPvalue(pvalueQualitative(dfRad$Ri_GrD12,dfRad$Group),"По градационной оценке лучевого наклона" )
TextPvalue(pvalueQualitative(dfRad$Vt_GrD12,dfRad$Group),"По градационной оценке ладонного наклона" )
TextPvalue(pvalueQualitative(dfRad$Rh_GrD12  ,dfRad$Group),"По градационной оценке лучелучевого индекса" )          
