# ==============================================
# Ch.3 Data visualisation
# https://r4ds.had.co.nz/data-visualisation.html
# ==============================================


# -- load tidyverse -- 
library("tidyverse")

# -- ggplot template --
#ggplot(data = <DATA>) + 
# <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))


# ----------------------
# 3.2.4 Exercises
# ----------------------
# 1. Run ggplot(data = mpg). What do you see?
ggplot(data = mpg) # empty graph

# 2. How many rows are in mpg? How many columns?
?mpg # 234 rows and 11 variables

# 3. What does the drv variable describe? Read the help for ?mpg to find out.
?mpg # type of drive train

# 4. Make a scatterplot of hwy vs cyl.
ggplot(data = mpg) + 
   geom_point(mapping = aes(x = hwy, y = cyl))
  
# 5. What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv)) 
  # values for x and y in a scatterplot are best to be numerical
# ----------------------
# End of 3.2.4 Exercises
# ----------------------


# ----------------------
# 3.3.1 Exercises
# ----------------------
# 1. What's gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
  # color shouldn't be in aes() 
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# 2. Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?
?mpg
mpg
  # manufacturer, model, trans, drv, fl, class > categorical 
  # displ, year, cyl, cty, hwy > continuous   

# 3. Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ)) 
  # shape cannot be mapped to a continuous variable
  # size produces an unclear graph
  # color works fine

# 4. What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = hwy, size = hwy)) # works fine 

# 5. What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
?geom_point
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ, stroke = 1)) 
  # to modify the width of the border

# 6. What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? Note, you'll also need to specify x and y.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5)) 
  # treat mapping as an expression which is evaluated to either true or false
# ----------------------
# End of 3.3.1 Exercises
# ----------------------


# ----------------------
# 3.5.1 Exercises
# ----------------------
# 1. What happens if you facet on a continuous variable?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ displ, nrow = 3)
  # a new plot for each value

# 2. What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(drv ~ cyl)
  # since cyl is a continuous variable mapping is considering the values of its entire range, even if there is no value to meet it in drv

# 3. What plots does the following code make? What does . do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
  # control the orientation of the plots

# 4. Take the first faceted plot in this section: 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
  # What are the advantages to using faceting instead of the colour aesthetic?
    # produce separate plots which make it easier to comprehend 
  # What are the disadvantages?
    # number of plots can be large
  # How might the balance change if you had a larger dataset?
    # a large number of plots might be more confusing than simply using colors

# 5. Read ?facet_wrap. 
?facet_wrap
  # What does nrow do? What does ncol do? 
    # decide on number of rows and columns 
  # What other options control the layout of the individual panels? 
    # labeller, scales, strip
  # Why doesn't facet_grid() have nrow and ncol arguments?
?facet_grid # already decided by the number of elements in sets 'rows' and 'cols'

# 6. When using facet_grid() you should usually put the variable 
# with more unique levels in the columns. Why?
  # to indicate there should be no faceting on this dimension 
# ----------------------
# End of 3.5.1 Exercises
# ----------------------


# ----------------------
# 3.6.1 Exercises
# ----------------------
# 1. What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
  # line_geom, boxplot_geom, geom_histogram, line_geom

# 3. What does show.legend = FALSE do? What happens if you remove it?
  # removes the legend

# 4. What does the se argument to geom_smooth() do?
?geom_smooth
  # Display confidence interval around smooth?

# 5. Will these two graphs look different? Why/why not?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
  # graphs will look the same, same code, 2nd code has more redundancy 
# ----------------------
# End of 3.6.1 Exercises
# ----------------------