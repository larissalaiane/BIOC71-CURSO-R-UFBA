data("rivers")
rivers
str(rivers)
class(rivers)
mean<-mean(rivers)
sum(rivers>=591.1844)
prop.mm <- sum(rivers<=591.1844)/length(rivers)
quantil.75 <- quantile(rivers, probs=0.75)
medias <- array(c(mean(rivers), mean(rivers, trim=0.25), median(rivers)))
medias


