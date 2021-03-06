
###########
# Old Map
###########
library(qtl)
library(ggplot2)
library(cowplot)

setwd("/Users/Cody_2/git.repos/brassica_genetic_map_paper/input")
brassica_traits <- read.cross("csvsr", genfile ="old_map_rqtl.csv", 
	                       phefile="Brock_2010_pheno.csv", genotypes=c("0","2"))
head(brassica_traits)
class(brassica_traits)[1] <- "riself"
brassica_traits <- jittermap(brassica_traits)
brassica_traits
oldmap <- est.map(brassica_traits,verbose=T,error.prob=.01)

pairs(jitter( as.matrix(brassica_traits$pheno) ), cex=0.6, las=1)

plot.map(brassica_traits,oldmap) #some compression in this brassica_traits set
brassica_traits

brassica_traits <- replace.map(brassica_traits,oldmap) #use old map
plot(brassica_traits) 
brassica_traits
plot.map(brassica_traits)

#change the names of the chromosomes
old_map <- pull.map(brassica_traits)
str(brassica_traits)
names(brassica_traits$geno) <- paste(c("A01", "A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A10"))
names(brassica_traits$geno)

summaryMap(brassica_traits)
#         n.mar length ave.spacing max.spacing
# 1          28   53.7         2.0        12.6
# 2          32   93.1         3.0        18.7
# 3          37  115.1         3.2        22.4
# 4          15   66.7         4.8        19.4
# 5          13   75.3         6.3        27.5
# 6          28   92.0         3.4        31.7
# 7          21   63.2         3.2        15.9
# 8           8   35.8         5.1        16.7
# 9          29   67.0         2.4         9.9
# 10         14   56.5         4.3        16.4
# overall   225  718.5         3.3        31.7

###########
# old Map
###########
setwd("/Users/Cody_2/git.repos/brassica_genetic_map/output")
brassica_newmap <- read.cross("csvsr", genfile ="snp_map_rqtl_Mbp_ref1.5_cross_output_gen.csv", 
                           phefile="snp_map_rqtl_Mbp_ref1.5_cross_output_phe.csv", 
                           genotypes=c("AA","BB"), 
                           na.strings=c("NA","-"))
head(brassica_newmap)
class(brassica_newmap)[1] <- "riself"
brassica_newmap <- jittermap(brassica_newmap)
brassica_newmap


#############
#############
# plot maps
#############
#############
old <- scanone(brassica_traits, pheno.col = 1, method = "imp")
old
old2 <- old
head(old2)
old2$len <- 1
old2$xold  <- 1
old2$pos
str(old2)
old_map_plot <- ggplot(old2, aes(len, pos, ymin = 0, ymax = 40)) + facet_grid(. ~ chr)
old_map_plot <- old_map_plot + geom_segment(aes(x = len - 5, y = pos, xend = len + 5, yend = pos))
old_map_plot <- old_map_plot + geom_segment(aes(x = len, y = 0, xend = len, yend = pos))
old_map_plot <- old_map_plot + scale_y_reverse()
old_map_plot <- old_map_plot + theme(panel.background = element_blank(), axis.text.x = element_blank(),
                             axis.line = element_blank(), panel.grid.major = element_blank(), 
                             panel.grid.minor = element_blank(), axis.ticks.x = element_blank(), 
                             axis.title.x = element_blank())
old_map_plot <- old_map_plot + ylab("Genetic Position (cM)") + ggtitle("")
old_map_plot

setwd("/Users/Cody_2/git.repos/brassica_genetic_map/output")
ggsave("old_genetic_map.pdf", old_map_plot)

new <- scanone(brassica_newmap, pheno.col = 2)
new2 <- new
head(new2)
new2$len <- 1
new2$xnew <- 1
new2$pos
str(new2)
new_map_plot <- ggplot(new2, aes(len, pos, ymin = 0, ymax = 40)) + facet_grid(. ~ chr)
new_map_plot <- new_map_plot + geom_segment(aes(x = len - 5, y = pos, xend = len + 5, yend = pos))
new_map_plot <- new_map_plot + geom_segment(aes(x = len, y = 0, xend = len, yend = pos))
new_map_plot <- new_map_plot + scale_y_reverse()
new_map_plot <- new_map_plot + theme(panel.background = element_blank(), axis.text.x = element_blank(),
                             axis.line = element_blank(), panel.grid.major = element_blank(), 
                             panel.grid.minor = element_blank(), axis.ticks.x = element_blank(), 
                             axis.title.x = element_blank())
new_map_plot <- new_map_plot + ylab("Genetic Position (cM)") + ggtitle("")
new_map_plot

setwd("/Users/Cody_2/git.repos/brassica_genetic_map/output")
ggsave("new_genetic_map.pdf", new_map_plot)


#############
#############
# plot flowering
#############
#############
old_flr_perm <- scanone(brassica_traits, pheno.col = 2, method = "imp", n.perm = 10000)
old_flr_perm_95 <- summary(old_flr_perm)[1] #keep 95%
summary(old_flr_perm)
# LOD thresholds (10000 permutations)
#      lod
# 5%  2.70
# 10% 2.37
oldmapplotflr <- scanone(brassica_traits, pheno.col = 2, method = "imp", chr = "A10")
plot(oldmapplotflr)
peak2 <- 9
oldplot_flr <- ggplot(oldmapplotflr)
oldplot_flr <- oldplot_flr +  theme_bw() + scale_y_continuous(limits=c(0, 13)) + 
                        geom_line(aes(x = pos, y = lod), size = 2) +
                        geom_hline(yintercept = 2.66, color = "red", size = 1) +
                        geom_segment(aes(x = pos, xend = pos), y = (peak2 * -0.02), yend = (peak2 * -0.05)) +
                        theme(text = element_text(size = 20)) +
                        xlab("Genetic Distance (cM)") +
                        ylab("LOD Score") 
oldplot_flr


# new map
new_flr_perm <- scanone(brassica_newmap, pheno.col = 2, method = "imp", n.perm = 10000)
new_flr_perm_95 <- summary(new_flr_perm)[1] #keep 95%
summary(new_flr_perm)
# LOD thresholds (10000 permutations)
#      lod
# 5%  2.89
# 10% 2.56

newmapplotflr <- scanone(brassica_newmap, pheno.col = 2, method = "imp", chr = "A10")
plot(newmapplotflr)
peak2 <- 9
newplot_flr <- ggplot(newmapplotflr)
newplot_flr <- newplot_flr +  theme_bw() + scale_y_continuous(limits=c(0, 13)) + 
                        geom_line(aes(x = pos, y = lod), size = 2) +
                        geom_hline(yintercept = 2.87, color = "red", size = 1) +
                        geom_segment(aes(x = pos, xend = pos), y = (peak2 * -0.02), yend = (peak2 * -0.05)) +
                        theme(text = element_text(size = 20)) +
                        xlab("Genetic Distance (cM)") +
                        ylab("LOD Score") 
newplot_flr


setwd("/Users/Cody_2/git.repos/brassica_genetic_map_paper/output")
figure_X <- plot_grid(old_map_plot, new_map_plot, oldplot_flr, newplot_flr, labels=c("A", "B", "C", "D"))
figure_X
?ggsave
ggsave("genetic-map-qtl-figure.png", figure_X, height = 10, width = 15)
ggsave("genetic_map_qtl_figure.pdf", figure_X, height = 10, width = 15)

# draft <- ggdraw(newplot_flr) + draw_plot_label("", size = 14) + 
#   draw_text("DRAFT!", angle = 45, size = 100, alpha = .2)
# draft
# ggsave("draft_figure.pdf", draft)


#############
#############
# supplemental data
#############
#############


#############
#############
# plot leaf length for supplemental data
#############
#############
oldleaf <- scanone(brassica_traits, pheno.col = 1, method = "imp")
plot(oldleaf)

peak <- 7
oldmapplotleaf <- ggplot(oldleaf)
oldmapplotleaf <- oldmapplotleaf +  theme_bw() + scale_y_continuous(limits=c(0, 7.5)) + 
                        geom_line(aes(x = pos, y = lod), size = 2) +
                        geom_hline(yintercept = 2.44, color = "red", size = 1) +
                        geom_segment(aes(x = pos, xend = pos), y = (peak * -0.02), yend = (peak * -0.05)) +
                        theme(text = element_text(size = 20)) +
                        xlab("Genetic Position (cM)") +
                        ylab("LOD Score") 
oldmapplotleaf

newmapplotleaf_perm <- scanone(brassica_newmap, pheno.col = 1, method = "imp") 
summary(so.perm2)
# so.perm295 <- summary(so.perm2)[1] #keep 95%
# # LOD thresholds (1000 permutations)
# #      lod
# # 5%  3.23
# # 10% 2.81

newmapplotleaf <- scanone(brassica_newmap, pheno.col = 1, method = "imp", chr = "A06")
plot(newmapplotleaf)

peak2 <- 7
newplot_leaf <- ggplot(newmapplotleaf)
newplot_leaf <- newplot_leaf +  theme_bw() + scale_y_continuous(limits=c(0, 7.5)) + 
                        geom_line(aes(x = pos, y = lod), size = 2) +
                        geom_hline(yintercept = 3.08, color = "red", size = 1) +
                        geom_segment(aes(x = pos, xend = pos), y = (peak * -0.02), yend = (peak * -0.05)) +
                        theme(text = element_text(size = 20)) +
                        xlab("Genetic Distance (cM)") +
                        ylab("LOD Score") 
newplot_leaf
ggsave("leaf_length_figure.pdf", newplot_map, height = 10, width = 15)

leaf_cim <- cim(brassica_newmap, pheno.col = 1)
leaf_cim
plot(leaf_cim)
plot(leaf_cim, chr = "A06")
plot(leaf_cim, chr = "A10")


flr_cim <- cim(brassica_newmap, pheno.col = 2)
flr_cim
plot(flr_cim)
plot(flr_cim, chr = "A03")
plot(flr_cim, chr = "A07")
plot(flr_cim, chr = "A10")
