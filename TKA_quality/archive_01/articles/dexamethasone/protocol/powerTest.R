library(pwr)
n <- pwr.2p.test(h=ES.h(.79, .49), sig.level=.05, power=.9,
            alternative="greater")[["n"]]
n_total <- round(n,0)+round(n*0.15,0)


# При средннем росте:
male_h2 <-  1.765  *1.765
female_h2 <-  1.653 * 1.653
x_h2 <- 4
BMI <- 40

# ИМТ= вес (кг) / рост (м)2

w <-  BMI*male_h2  
w <-  BMI*female_h2 
w <-  BMI*x_h2
w *0.3


BMI <- w/ h2