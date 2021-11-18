data <- read.table(file = "C:\\Users\\zoar_\\OneDrive - UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO\\IMAC\\TolouseTest.csv", sep = ",", header = TRUE)
dataAux <- data
a <- 0
for (i in 1:dim(data)[1])
{
  if (data$n.filas.respondidas[i]==0)
  {
    aux <- data[i,1]
    dataAux <- dataAux[dataAux$ï..No.!=aux,]
  }
}

dataIA  <- dataAux
dataNoIA <- dataAux
View(dataAux)

a <- 0
for (i in 1:dim(dataAux)[1])
{
  aux <- dataAux[i,1]
  if (dataAux$Test.tipo[i]=='2')
  {
    dataIA <- dataIA[dataIA$ï..No.!=aux,]
  }
  else
  {
    dataNoIA <- dataNoIA[dataNoIA$ï..No.!=aux,]
  }
}

write.csv(x = dataIA, file ="C:/Users/zoar_/OneDrive/ED/Escritorio/LIbrosafiles/dataIA.csv", row.names = FALSE)
write.csv(x = dataNoIA, file = "C:/Users/zoar_/OneDrive/ED/Escritorio/LIbrosafiles/dataNoIA.csv", row.names = FALSE)

x11()

Conf3x3 = matrix(c(1:6),nrow=2, byrow =FALSE)

layout(Conf3x3)

hist(dataIA$IGAP,main ="Proveniente de IA", xlab ="IGAP", col = "red", freq = F)
lines(density(dataIA$IGAP), col = "black", lwd =2)

hist(dataNoIA$IGAP,main = "No proveniente de IA", xlab = "IGAP", col = "blue", freq  = F)
lines(density(dataNoIA$IGAP), col = "black", lwd =2)

hist(dataIA$CC, main = "Proveniente de IA", xlab ="CC", col = "red", freq = F)
lines(density(dataIA$CC), col = "black", lwd =2)

hist(dataNoIA$CC,main ="No proveniente de IA", xlab ="CC", col = "blue", freq = F)
lines(density(dataNoIA$CC), col = "black", lwd =2)

hist(dataIA$ICI, main = "Proveniente de IA", xlab = "ICI", col = "red" , freq =F)
lines(density(dataIA$ICI), col = "black", lwd =2)

hist(dataNoIA$ICI, main= "No proveniente de IA", xlab ="ICI", col = "blue", freq=F)
lines(density(dataNoIA$ICI), col = "black", lwd =2)


