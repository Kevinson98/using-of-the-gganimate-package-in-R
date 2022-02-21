data()
library(gapminder)
library(ggplot2)
library(gganimate)
library(gifski)
theme_set(theme_bw())
View(gapminder)
list.files()
gg<-ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, color=country))+
  geom_point(alpha=0.7)+
  scale_colour_manual(values = country_colors)+
  scale_size(range = c(2,15))+
  scale_x_log10()+
  facet_wrap(~continent)+
  theme(legend.position = "none")+
  theme(axis.text = element_text(size = 20),
        axis.title = element_text(size=22,face = "bold"),
        strip.text = element_text(size = 20))
gg

gg2<-gg+labs(title = "Year:{frame_time}",x= "GDP OF THE CAPITAL", y="LIFE EXPECTANCY")+
  transition_time(year)+
  theme(plot.title = element_text(size = 25,face = "bold"))
gg2
animate(gg2,nframes = 10, renderer = gifski_renderer("gg2.gif"),height=700,width=1000)
