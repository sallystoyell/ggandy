# ggandy
A ggplot2 geom for adding Andy. Cloned from ggbernie (https://github.com/R-CoderDotCom/ggbernie) and modified.

## Installation
```r
# install.packages("remotes")
remotes::install_github("sallystoyell/ggandy@main")
```

## Andy 
```r
ggplot(mtcars) +
  geom_andy(aes(mpg, wt), andy = "andy")
```
<p align="center">
 <img src="https://github.com/sallystoyell/images/blob/main/example1_ggandy">
</p>


## Andy Emoji 

```r
ggplot(mtcars) +
  geom_andy(aes(mpg, wt), andy = "emoji")
```

<p align="center">
 <img src="https://github.com/sallystoyell/images/blob/main/example2_ggandy">
</p>
