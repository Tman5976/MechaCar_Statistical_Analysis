library(dplyr)

cars <- read.csv(file="MechaCar_mpg.csv")

lm1 <- lm(mpg ~ AWD + ground_clearance + spoiler_angle + 
            vehicle_weight + vehicle_length, data = cars)

lm1

summary(lm1)

coils <- read.csv(file="Suspension_Coil.csv")

psi_summary <- coils %>% summarize(Mean_PSI=mean(PSI),
                                   Median_PSI=median(PSI),
                                   Variance_PSI=var(PSI),
                                   SD_PSI=sd(PSI))
psi_summary

lot_summary <- coils %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean_PSI=mean(PSI),
            Median_PSI=median(PSI),
            Variance_PSI=var(PSI),
            SD_PSI=sd(PSI))
lot_summary

t.test(coils$PSI,mu=1500)

Lot1 <- subset(coils, Manufacturing_Lot=="Lot1")
Lot2 <- subset(coils, Manufacturing_Lot=="Lot2")
Lot3 <- subset(coils, Manufacturing_Lot=="Lot3")

t.test(Lot1$PSI,mu=1500)
t.test(Lot2$PSI,mu=1500)
t.test(Lot3$PSI,mu=1500)
