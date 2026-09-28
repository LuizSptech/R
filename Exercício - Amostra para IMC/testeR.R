data('iris')


boxplot(iris$Petal.Length[iris$Species == "virginica"],
    iris$Petal.Length[iris$Species == "setosa"],
    iris$Petal.Length[iris$Species == "versicolor"])



plot(iris$Sepal.Length,iris$Sepal.Width)
  