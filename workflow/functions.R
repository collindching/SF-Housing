plotTheme <- function() {
    theme(
        text = element_text(color="black"),
        plot.title = element_text(size=16,color="black",hjust=0),
        plot.subtitle = element_text(size=10,face="italic"),
        axis.ticks = element_blank(),
        panel.background = element_blank(),
        panel.grid.major = element_line("grey80",size=.1),
        panel.grid.minor = element_blank(),
        strip.background = element_rect(fill="grey80",color="white"),
        strip.text = element_text(size=10),
        axis.title = element_text(size=8),
        axis.text = element_text(size=8),
        axis.title.x = element_text(hjust=.95,face="bold"),
        axis.title.y = element_text(hjust=.95,face="bold"),
        plot.background = element_blank(),
        legend.background = element_blank(),
        legend.title = element_text(color="black",size=11),
        legend.text = element_text(color="black",size=9))
}

mapTheme <- function() {
    theme(
        text = element_text( color = "black"),
        plot.title = element_text(size = 18,colour = "black",hjust=0),
        plot.subtitle=element_text(face="italic"),
        axis.ticks = element_blank(),
        panel.background = element_blank(),
        strip.text = element_text(size=12),
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        strip.background = element_rect(fill = "grey80", color = "white"),
        plot.background = element_blank(),
        legend.background = element_blank(),
        legend.title = element_text(colour = "black",size=11),
        legend.text = element_text(colour = "black",size=9),
        legend.key.width=unit(5.5,"mm"),
        legend.key.height=unit(5.5,"mm"))
}
