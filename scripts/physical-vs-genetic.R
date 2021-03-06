###########
# compare physical vs. genetic position
###########
library(qtl)
library(plyr)
library(ggplot2)
setwd("/Users/Cody_2/git.repos/brassica_genetic_map_paper/output")
b_map_red <- read.cross("csvsr", genfile ="snp_map_rqtl_Mbp_ref1.5_cross_output_gen.csv", 
	                       phefile="snp_map_rqtl_Mbp_ref1.5_cross_output_phe.csv", 
	                       genotypes=c("AA","BB"), 
	                       na.strings=c("NA","-"))
class(b_map_red)[1] <- "riself"
b_map_red <- jittermap(b_map_red)
b_map_red

#reformat for plotting in ggplot
v2.3_map <- pull.map(b_map_red, as.table=TRUE)
v2.3_map
v2.3_map$markernames <- rownames(v2.3_map)
rownames(v2.3_map) <- NULL
head(v2.3_map)

# split marker names
v2.3_map_description <- ldply(strsplit(as.character(v2.3_map$markernames),split="x"))
head(v2.3_map_description)
v2.3_map$genomic_pos <- v2.3_map_description[,2]

head(v2.3_map)
str(v2.3_map)
plot(v2.3_map$pos, v2.3_map$genomic_pos)

v2.3_map$genomic_pos <- as.numeric(v2.3_map$genomic_pos)
v2.3_map$genomic_pos <- (v2.3_map$genomic_pos)/1000000


all_chr_plot <- ggplot(v2.3_map, aes(x=pos, y=genomic_pos)) 
all_chr_plot <- all_chr_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
all_chr_plot <- all_chr_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
all_chr_plot

#plot genomic and genetic Position of each marker against one another
setwd("/Users/Cody_2/git.repos/brassica_genetic_map_paper/output")
v2.3_A01 <- subset(v2.3_map, chr == "A01")
plot(v2.3_A01$pos, v2.3_A01$genomic_pos)

head(v2.3_A01)
str(v2.3_A01)
# A01
v2.3_A01$genomic_pos <- as.numeric(v2.3_A01$genomic_pos)
A01_plot <- ggplot(v2.3_A01, aes(x=pos, y=genomic_pos)) 
A01_plot <- A01_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A01_plot <- A01_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A01_plot
ggsave("A01_genetic_vs_physical_v2.3.pdf")

# A02
v2.3_A02 <- subset(v2.3_map, chr == "A02")
plot(v2.3_A02$pos, v2.3_A02$genomic_pos)

head(v2.3_A02)
str(v2.3_A02)

v2.3_A02$genomic_pos <- as.numeric(v2.3_A02$genomic_pos)
A02_plot <- ggplot(v2.3_A02, aes(x=pos, y=genomic_pos)) 
A02_plot <- A02_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A02_plot <- A02_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A02_plot
ggsave("A02_genetic_vs_physical_v2.3.pdf")

# A03
v2.3_A03 <- subset(v2.3_map, chr == "A03")
plot(v2.3_A03$pos, v2.3_A03$genomic_pos)

head(v2.3_A03)
str(v2.3_A03)

v2.3_A03$genomic_pos <- as.numeric(v2.3_A03$genomic_pos)
A03_plot <- ggplot(v2.3_A03, aes(x=pos, y=genomic_pos)) 
A03_plot <- A03_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A03_plot <- A03_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A03_plot
ggsave("A03_genetic_vs_physical_v2.3.pdf")

# A04
v2.3_A04 <- subset(v2.3_map, chr == "A04")
plot(v2.3_A04$pos, v2.3_A04$genomic_pos)

head(v2.3_A04)
str(v2.3_A04)

v2.3_A04$genomic_pos <- as.numeric(v2.3_A04$genomic_pos)
A04_plot <- ggplot(v2.3_A04, aes(x=pos, y=genomic_pos)) 
A04_plot <- A04_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A04_plot <- A04_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A04_plot
ggsave("A04_genetic_vs_physical_v2.3.pdf")

# A05
v2.3_A05 <- subset(v2.3_map, chr == "A05")
plot(v2.3_A05$pos, v2.3_A05$genomic_pos)

head(v2.3_A05)
str(v2.3_A05)

v2.3_A05$genomic_pos <- as.numeric(v2.3_A05$genomic_pos)
A05_plot <- ggplot(v2.3_A05, aes(x=pos, y=genomic_pos)) 
A05_plot <- A05_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A05_plot <- A05_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A05_plot
ggsave("A05_genetic_vs_physical_v2.3.pdf")

# A06
v2.3_A06 <- subset(v2.3_map, chr == "A06")
plot(v2.3_A06$pos, v2.3_A06$genomic_pos)

head(v2.3_A06)
str(v2.3_A06)

v2.3_A06$genomic_pos <- as.numeric(v2.3_A06$genomic_pos)
A06_plot <- ggplot(v2.3_A06, aes(x=pos, y=genomic_pos)) 
A06_plot <- A06_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A06_plot <- A06_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A06_plot
ggsave("A06_genetic_vs_physical_v2.3.pdf")

# A07
v2.3_A07 <- subset(v2.3_map, chr == "A07")
plot(v2.3_A07$pos, v2.3_A07$genomic_pos)

head(v2.3_A07)
str(v2.3_A07)

v2.3_A07$genomic_pos <- as.numeric(v2.3_A07$genomic_pos)
A07_plot <- ggplot(v2.3_A07, aes(x=pos, y=genomic_pos)) 
A07_plot <- A07_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A07_plot <- A07_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A07_plot
ggsave("A07_genetic_vs_physical_v2.3.pdf")

# A08
v2.3_A08 <- subset(v2.3_map, chr == "A08")
plot(v2.3_A08$pos, v2.3_A08$genomic_pos)

head(v2.3_A08)
str(v2.3_A08)

v2.3_A08$genomic_pos <- as.numeric(v2.3_A08$genomic_pos)
A08_plot <- ggplot(v2.3_A08, aes(x=pos, y=genomic_pos)) 
A08_plot <- A08_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A08_plot <- A08_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A08_plot
ggsave("A08_genetic_vs_physical_v2.3.pdf")

# A09
v2.3_A09 <- subset(v2.3_map, chr == "A09")
plot(v2.3_A09$pos, v2.3_A09$genomic_pos)

head(v2.3_A09)
str(v2.3_A09)

v2.3_A09$genomic_pos <- as.numeric(v2.3_A09$genomic_pos)
A09_plot <- ggplot(v2.3_A09, aes(x=pos, y=genomic_pos)) 
A09_plot <- A09_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A09_plot <- A09_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A09_plot
ggsave("A09_genetic_vs_physical_v2.3.pdf")

# A10
v2.3_A10 <- subset(v2.3_map, chr == "A10")
plot(v2.3_A10$pos, v2.3_A10$genomic_pos)

head(v2.3_A10)
str(v2.3_A10)

v2.3_A10$genomic_pos <- as.numeric(v2.3_A10$genomic_pos)
A10_plot <- ggplot(v2.3_A10, aes(x=pos, y=genomic_pos)) 
A10_plot <- A10_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
A10_plot <- A10_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
A10_plot
ggsave("A10_genetic_vs_physical_v2.3.pdf")

# splines
# head(v2.3_A03)
# ?smooth.spline
# A03_smooth <- smooth.spline(v2.3_A03$pos, v2.3_A03$genomic_pos)
# plot(A03_smooth)
plot(v2.3_A03$pos ~ v2.3_A03$genomic_pos)
lines(predict(A03_smooth ), col='red', lwd=2)

lines(A03_smooth, col = "blue")
lines(smooth.spline(v2.3_A03$pos, v2.3_A03$genomic_pos, df = 1), lty = 2, col = "red")
str(A03_smooth)

plot(A03_smooth$fit$coef)# end
?lines
out <- plot.formula(A03_smooth)
out

x <- 1:10
y <- c(2,4,6,8,7,12,14,16,18,20)
lo <- loess(y~x)
plot(x,y)
lines(predict(lo), col='red', lwd=2)
predict(lo)
lo
?geom_smooth
?loess
A03_smooth <- smooth.spline(v2.3_A03$pos ~ v2.3_A03$genomic_pos)
plot(v2.3_A03$pos, v2.3_A03$genomic_pos)
lines(A03_smooth, col='red', lwd=2)

str(A03_smooth)
cars.lo <- loess(dist ~ speed, cars)
predict(cars.lo, data.frame(speed = seq(5, 30, 1)), se = TRUE)
# A03_smooth <- loess(v2.3_A03$pos, v2.3_A03$genomic_pos)
# v2.3_A03$smooth <- predict(A03_smooth)
# v2.3_A03$genomic_pos <- as.numeric(v2.3_A03$genomic_pos)
# A03_plot <- ggplot(v2.3_A03, aes(x=pos, y=genomic_pos)) 
# A03_plot <- A03_plot + geom_point(shape=1) + facet_grid(chr ~ . ) 
# A03_plot <- A03_plot + xlab("Genetic Position (cM)") + ylab("Physical Position (Mbp)")
# A03_plot <- A03_plot + geom_smooth(method = "loess")
# A03_plot
# ggsave("A10_genetic_vs_physical_v2.3.pdf")
#end
