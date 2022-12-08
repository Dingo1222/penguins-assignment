#plot ANCOVA graph
plot_figure <- function(penguins_clean){
  ggplot(data = penguins_clean, 
         aes(x = culmen_length_mm,
             y = culmen_depth_mm, 
             group = species)) +
    geom_point(aes(color = species),
               size = 2.5,
               alpha = 0.7) +
    geom_smooth(method = "lm", se = TRUE, aes(color=species)) +
    labs(title = "Penguin culmen sizes in different species",
         subtitle = "Culmen length and culmen depth for Adelie, Chinstrap, and Gentoo penguins",
         x = "Culmen length (mm)",
         y = "Culmen depth (mm)",
         color = "Species"
    ) +
    scale_color_manual(values = c("#15B9CB","#E58D09","#9B3CD1"), labels = c("Adelie", "Chinstrap", "Gentoo")) +
    theme(legend.position = c(0.9, 0.175),
          plot.title.position = "plot",
          plot.caption = element_text(hjust = 0.5, face= "italic"),
          plot.caption.position = "plot")
}

#save figure as .png
save_culmenplot_png <- function(penguins_clean, 
                                filename, width, height, res, scaling){
  agg_png(filename, width   =  width, 
          height  =  height, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  PenguinANCOVA <- plot_figure(penguins_clean)
  print(PenguinANCOVA)
  dev.off()
}

#save figure as .svg
save_culmenplot_svg <- function(penguins_clean, 
                                filename, width, height, scaling){
  svglite(filename, 
          width   = width, 
          height  = height, 
          scaling = scaling)
  PenguinANCOVA <- plot_figure(penguins_clean)
  print(PenguinANCOVA)
  dev.off()
}