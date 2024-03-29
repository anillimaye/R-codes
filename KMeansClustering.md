### Code
### this code uses the factoextra package to demonstrate how one can perform K means clustering using the iris dataset

#first load the library
library (factoextra)

#load the data
```
> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
> 
```
#We initially do not want the species column to be there in the table. Here we will cluster the data and see if the clusters identify with the species. To see how many different species you can do the following

Species <- iris$Species
table(Species)
```
> Species <- iris$Species
> table(Species)
Species
    setosa versicolor  virginica 
        50         50         50 
> 
```
#Remove the Species column and make a new table called data
```
> data <- iris[1:4]
> head(data)
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1          5.1         3.5          1.4         0.2
2          4.9         3.0          1.4         0.2
3          4.7         3.2          1.3         0.2
4          4.6         3.1          1.5         0.2
5          5.0         3.6          1.4         0.2
6          5.4         3.9          1.7         0.4
> scaleddata <- scale(data)
> head(scaleddata)
     Sepal.Length Sepal.Width Petal.Length Petal.Width
[1,]   -0.8976739  1.01560199    -1.335752   -1.311052
[2,]   -1.1392005 -0.13153881    -1.335752   -1.311052
[3,]   -1.3807271  0.32731751    -1.392399   -1.311052
[4,]   -1.5014904  0.09788935    -1.279104   -1.311052
[5,]   -1.0184372  1.24503015    -1.335752   -1.311052
[6,]   -0.5353840  1.93331463    -1.165809   -1.048667
> 
```
#One can look at the distances using the dist function
distances <- dist(scaleddata)

#Determine the value of K by generating the Elbow plot with the following command
```
>fviz_nbclust(scaleddata, kmeans, method="wss")+labs(subtitle="Elbow Plot")
```
![Elbow Plot](./ElbowPlot.png)

Now we perform the K means clustering
```
> kmeans_output <- kmeans(scaleddata, centers=3, nstart=100)
> kmeans_output
K-means clustering with 3 clusters of sizes 50, 53, 47

Cluster means:
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1  -1.01119138  0.85041372   -1.3006301  -1.2507035
2  -0.05005221 -0.88042696    0.3465767   0.2805873
3   1.13217737  0.08812645    0.9928284   1.0141287

Clustering vector:
  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 [41] 1 1 1 1 1 1 1 1 1 1 3 3 3 2 2 2 3 2 2 2 2 2 2 2 2 3 2 2 2 2 3 2 2 2 2 3 3 3 2 2
 [81] 2 2 2 2 2 3 3 2 2 2 2 2 2 2 2 2 2 2 2 2 3 2 3 3 3 3 2 3 3 3 3 3 3 2 2 3 3 3 3 2
[121] 3 2 3 2 3 3 2 3 3 3 3 3 3 2 2 3 3 3 2 3 3 3 2 3 3 3 2 3 3 2

Within cluster sum of squares by cluster:
[1] 47.35062 44.08754 47.45019
 (between_SS / total_SS =  76.7 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
[6] "betweenss"    "size"         "iter"         "ifault"      
> 
```
centers=3 in the above code stands for the fact that we have chosen to use the value of K = 3, and hence we expect three clusters as evident from the next part of the output. It turns out that the cluster sizes are 50, 53 and 47. This can be also noted in the Clustering vector shown in the above output, with 1, 2, or 3 entered for each of the samples. Note there are a total of 150 samples. The clustering vector showes that the sample number 121 is assigned to cluster 3, sample 81 is assigned in cluster 2 and so on. This clustering vector will be needed when we visualize the clusters. The clustering vector can be called by kmeans_output$cluster
