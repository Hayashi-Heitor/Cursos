# instalação de pacotes
install.packages("haven")
install.packages("openxlsx")
install.packages("dplyr")

# necessário chamar a biblioteca para utilização
library(haven)
library(openxlsx)

# diretório de trabalho
getwd() # informa o diretório atual
choose.dir() # navega nas pastas do computador por janela
setwd(choose.dir())

#Importar arquivos csv
banco_teste <- read.csv("Banco_teste_t.csv", sep = ";")
                                          #padrão: sep=","
head(banco_teste)

#Importar arquivo excel, biblioteca openxlsx
banco_teste_excel <- read.xlsx("Banco_teste_t.xlsx")
head(banco_teste_excel)

#IMportar arquivo sav, biblioteca haven
banco_teste_sav <- read.sav("Banco_teste_t.sav")
head(banco_teste_sav)
