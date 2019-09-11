## Pre requisito:  intalar packages: gmodels
## Para isso va acesse Packages >> Install >> Em packages digite: gmodels e clique em "Install"
## Ou digite: install.packages("gmodels")

# importando o arquivo csv
wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)


# examina a estrutura do dataframe:
str(wbcd)


# retirando a identificação do dataframe

wbcd[-1]

# Tabela de diagnósticos: Verificar números:

table(wbcd$diagnosis)

# Recodificando diagnóstico como um fator

wbcd$diagnosis <- factor(wbcd$diagnosis,
                         levels = c("B","M"),
                         labels = c("Benign", "Malignant"))

# Fazendo uma proporção entre os diagnósticos
round(prop.table(table(wbcd$diagnosis))*100, digits = 1)


# Fazendo um sumário das medidas estatísticas de 3 características:
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])


# Criando função de normalização:
normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))  
}


# Normalizando o wbcd com a função lapply, aplica pra todos.
wbcd_n <- as.data.frame(lapply(wbcd[3:31], normalize))

# Criando dados de treino e teste.

wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

wbcd_train_labels <- wbcd[1:469, 2]
wbcd_test_labels <- wbcd[470:569, 2]

# Ativa-se a classe class e roda-se o algorítimo

library(class)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k = 21)

library(gmodels)

CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq = FALSE)

