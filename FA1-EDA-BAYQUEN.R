library(dplyr)

df  <- lattice::singer
df2 <- filter(df, voice.part == "Bass 2" | voice.part=="Tenor 1") %>% 
  mutate(voice.part = droplevels(voice.part))

Tenor <- filter(df, voice.part == "Tenor 1") %>%  pull(height)
Bass  <- filter(df, voice.part == "Bass 2")  %>%  pull(height)
qq.out <- qqplot(x=Tenor, y=Bass, plot.it=FALSE)
qq.out <- as.data.frame(qq.out)
names(qq.out) <- c("Tenor", "Bass") 

# Set the x and y limits
xylim <- range( c(qq.out$Tenor, qq.out$Bass) )

# Generate the QQ plot
ggplot(qq.out, aes( x= Tenor, y = Bass)) + 
  geom_point() + 
  geom_abline( intercept=0, slope=1) +
  coord_fixed(ratio = 1, xlim=xylim, ylim = xylim) 


qqplot(x=Tenor, y=Bass, asp=1)
abline( c(0,1))
  