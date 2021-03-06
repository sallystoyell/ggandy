#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Key andy
#'
#' @param data,params,size key stuff
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
draw_key_andy <-  function(data, params, size) {

  filename <- system.file(paste0(data$andy, ".png"), package = "ggandy", mustWork = TRUE)
  # print(filename)
  img <- as.raster(png::readPNG(filename))
  aspect <- dim(img)[1]/dim(img)[2]
  # rasterGrob
  grid::rasterGrob(image         = img)
}

# andyGrob
andyGrob <- function(x, y, size, andy = "andy", geom_key = list(andy = "andy.png",
                                                                emoji = "emoji.png")) {

  filename <- system.file(geom_key[[unique(andy)]], package = "ggandy", mustWork = TRUE)
  img <- as.raster(png::readPNG(filename))

  # rasterGrob
  grid::rasterGrob(x             = x,
                   y             = y,
                   image         = img,
                   # only set height so that the width scales proportionally and so that the icon
                   # stays the same size regardless of the dimensions of the plot
                   height        = size * ggplot2::unit(20, "mm"))
}

# Geomandy
Geomandy <- ggplot2::ggproto(`_class` = "Geomandy",
                               `_inherit` = ggplot2::Geom,
                               required_aes = c("x", "y"),
                               non_missing_aes = c("size", "andy"),
                               default_aes = ggplot2::aes(size = 1, andy = "andy", shape  = 19,
                                                          colour = "black",   fill   = NA,
                                                          alpha  = NA,
                                                          stroke =  0.5,
                                                          scale = 5,
                                                          image_filename = "andy"),

                               draw_panel = function(data, panel_scales, coord, na.rm = FALSE) {
                                 coords <- coord$transform(data, panel_scales)
                                 ggplot2:::ggname(prefix = "geom_andy",
                                                  grob = andyGrob(x = coords$x,
                                                                    y = coords$y,
                                                                    size = coords$size,
                                                                    andy = coords$andy))
                               },

                               draw_key = draw_key_andy)

#' @title andy layer
#' @description The geom is used to add andy to plots. See ?ggplot2::geom_points for more info.
#' @inheritParams ggplot2::geom_point
#' @examples
#'
#' # install.packages("ggplot2")
#'library(ggplot2)
#'
#' ggplot(mtcars) +
#'  geom_andy(aes(mpg, wt), andy = "andy") +
#'  theme_bw()
#'
#' ggplot(mtcars) +
#'  geom_andy(aes(mpg, wt), andy = "emoji") +
#'  theme_bw()
#'
#' @importFrom grDevices as.raster
#' @export
geom_andy <- function(mapping = NULL,
                        data = NULL,
                        stat = "identity",
                        position = "identity",
                        ...,
                        na.rm = FALSE,
                        show.legend = NA,
                        inherit.aes = TRUE) {

  ggplot2::layer(data = data,
                 mapping = mapping,
                 stat = stat,
                 geom = Geomandy,
                 position = position,
                 show.legend = show.legend,
                 inherit.aes = inherit.aes,
                 params = list(na.rm = na.rm, ...))
}




