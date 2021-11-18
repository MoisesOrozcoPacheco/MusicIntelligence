data_ <- read.table(file = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\LIbrosafiles\\MFCC.csv", sep = ",", header = TRUE)
data_IA <- read.table(file = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\LIbrosafiles\\MFCC_IA.csv", sep = ",", header = TRUE)
data_SC <- read.table(file = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\LIbrosafiles\\S_C.csv", sep = ",", header = TRUE)
data_SC_IA <- read.table(file = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\LIbrosafiles\\S_C_IA.csv", sep = ",", header = TRUE)
data_SF <- read.table(file = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\LIbrosafiles\\S_F.csv", sep = ",", header = TRUE)
data_SF_IA <- read.table(file = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\LIbrosafiles\\S_F_IA.csv", sep = ",", header = TRUE)
data_ZCR <- read.table(file = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\LIbrosafiles\\Z_C_R.csv", sep = ",", header = TRUE)
data_ZCR_IA <- read.table(file = "C:\\Users\\zoar_\\OneDrive\\ED\\Escritorio\\LIbrosafiles\\z_c_R_IA.csv", sep = ",", header = TRUE)

data_mean <- 0 
data_mean_IA <- 0
mean_SC <- 0
mean_SC_IA <- 0
mean_SF <- 0
mean_SF_IA <- 0
mean_ZCR <- 0
mean_ZCR_IA <- 0

for (i in 1:dim(data_)[2])
{
    data_mean<-append(data_mean,mean(data_[[i]]))
    data_mean_IA <- append(data_mean_IA,mean(data_IA[[i]]))
    mean_SC <- append(mean_SC,mean(data_SC[[i]]))
    mean_SC_IA <- append(mean_SC_IA,mean(data_SC_IA[[i]]))
    mean_SF <- append(mean_SF,mean(data_SF[[i]]))
    mean_SF_IA <- append(mean_SF_IA,mean(data_SF_IA[[i]]))
    mean_ZCR <- append(mean_ZCR,mean(data_ZCR[[i]]))
    mean_ZCR_IA <- append(mean_ZCR_IA,mean(data_ZCR_IA[[i]]))
}
data_mean <- data_mean[-c(1,2)]
data_mean_IA <- data_mean_IA[-c(1,2)]
mean_SC <- mean_SC[-c(1,2)]
mean_SC_IA <- mean_SC_IA[-c(1,2)]
mean_SF <- mean_SF[-c(1,2)]
mean_SF_IA <- mean_SF_IA[-c(1,2)]
mean_ZCR <- mean_ZCR[-c(1,2)]
mean_ZCR_IA <- mean_ZCR_IA[-c(1,2)]

x11()

Conf2x4 = matrix(c(1:8),nrow=2, byrow =FALSE)

layout(Conf2x4)

hist(data_mean, breaks = 50,main="Musica no proveniente de IA", freq = F, col = "red" ,xlab = "MFCC")
lines(density(data_mean))
hist(data_mean_IA, breaks = 50, main="Musica proveniente de IA", freq = F, col = "blue" ,xlab = "MFCC")
lines(density(data_mean_IA))
hist(mean_SC, breaks = 50, main = "Musica no proveniente de IA", freq = F, col  ="red", xlab = "SC")
lines(density(mean_SC))
hist(mean_SC_IA, breaks =50, main = "Musica proveniente de IA", freq = F, col = "blue", xlab = "SC")
lines(density(mean_SC_IA))
hist(mean_SF, breaks = 50, main = "Musica no proveniente de IA", freq = F, col = "red", xlab = "SF")
lines(density(mean_SF))
hist(mean_SF_IA, breaks = 50, main = "Musica proveniente de IA", freq = F, col = "blue", xlab = "SF")
lines(density(mean_SF_IA))
hist(mean_ZCR, breaks = 50, main ="Musica no proveniente de IA", freq = F, col = "red", xlab = "ZCR")
lines(density(mean_ZCR))
hist(mean_ZCR_IA, breaks = 50, main = "Musica proveniente de IA", freq = F, col = "blue", xlab = "ZCR")
lines(density(mean_ZCR_IA))

mean_data <-cbind(data_mean, data_mean_IA, mean_SC, mean_SC_IA, mean_SF, mean_SF_IA, mean_ZCR, mean_ZCR_IA)

write.csv(x = mean_data, file = "C:/Users/zoar_/OneDrive/ED/Escritorio/LIbrosafiles/mean_FINAL.csv", row.names = FALSE)

