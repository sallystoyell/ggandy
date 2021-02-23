# ggbernie
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
 <img src="https://user-images.githubusercontent.com/67192157/105496237-80897b00-5cbd-11eb-996a-b77e89011b31.png">
</p>


## Andy Emoji 

```r
ggplot(mtcars) +
  geom_bernie(aes(mpg, wt), andy = "emoji")
```

<p align="center">
 <img src="https://user-images.githubusercontent.com/67192157/105496133-5cc63500-5cbd-11eb-8343-aae625f2ca21.png">
</p>
