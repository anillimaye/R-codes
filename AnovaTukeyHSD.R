Data <- read.table(file.choose(), header=TRUE, sep="\t")
Data
summary(Data)
boxplot(Data)
Stacked_Data <- stack(Data)
Stacked_Data
Anova_result <- aov(values~ind, data=Stacked_Data)
summary(Anova_result)
TukeyHSD(Anova_result)