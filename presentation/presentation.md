Presentation for Automobile catalog filter
========================================================
author: Peter Štrauch   
date: ne 31.7.2016, 01:35:09 CEST
transition: rotate 


The goal of this presentation
========================================================
- This is part of the course project for "Developing Data Products" course. 

- The presentation describes the shiny application "Automobile catalog filter".



The Application
========================================================
Application **Automobile catalog filter** is based on 'mtcars' database, part of [datasets](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html) package.

The application allows to *filter cars by parameters (hp, cyl)* and to check correlation between weight and miles/gallon.

You can adjust *horsepower range* and *number of cylinders* using control panel located on the left side. The result is shown in the main panel (on the right side of the page), which include two tabs with *plot* and *data*. Also filtered dataset can be downloaded using *download button*.


Filtering data
========================================================
The application is based on interactive filter; filtered data is shown in the table and plot. Example of table is below:



```r
arrange(filter(data, hp >= 100,hp <= 200, cyl == 4|cyl == 6), name)
```

```
            name  mpg cyl  disp  hp    wt
1   Ferrari Dino 19.7   6 145.0 175 2.770
2 Hornet 4 Drive 21.4   6 258.0 110 3.215
3   Lotus Europa 30.4   4  95.1 113 1.513
4      Mazda RX4 21.0   6 160.0 110 2.620
5  Mazda RX4 Wag 21.0   6 160.0 110 2.875
6       Merc 280 19.2   6 167.6 123 3.440
7      Merc 280C 17.8   6 167.6 123 3.440
8        Valiant 18.1   6 225.0 105 3.460
9     Volvo 142E 21.4   4 121.0 109 2.780
```


References
========================================================
Source code for the project is available on the [GitHub](https://github.com/pstrauch89/DevelopingDataProducts).

The presentation for the project can be found on the [RPubs](http://rpubs.com/Frankie/DevelopingDataProduct).
