<div class="container-fluid main-container">

<div id="header" class="fluid-row">

AIRBNB - PARIS
==============

#### Saifuddin Mohammad

#### 5/12/2020

</div>

<div id="analysis-of-data-based-on-statistics-for-airbnb---paris"
class="section level1">

Analysis of data based on statistics for AirBnB - Paris
=======================================================

We load the given data into R studio:

    data <- load("C:\\Users\\verce\\Downloads\\AirBnB.Rdata")

    head(data) 

    ## [1] "L" "R"

    #View(data)

There is a lot of data so we will be looking at the row names to get an
idea of what’s in there.

It is also helpful to know the dimensions of this data:

    typeof(L)

    ## [1] "list"

    typeof(R) 

    ## [1] "list"

    dim(L)

    ## [1] 52725    95

    dim(R)

    ## [1] 663599      2

    head(colnames(L))

    ## [1] "id"           "listing_url"  "scrape_id"    "last_scraped" "name"        
    ## [6] "summary"

    colnames(R)

    ## [1] "listing_id" "date"

The data contains several attributes for a housing company - AirBnB.

In the first instance the data may look organized but looking closer we
realise that we have to clean this data.

    class(L)

    ## [1] "data.frame"

    class(R)

    ## [1] "data.frame"

    knitr::kable(head(L), caption = "Table with Kable")

|       id | listing\_url                                                                                          |  scrape\_id | last\_scraped | name                                      | summary                                                                                                                                                                                                                                                      | space                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | experiences\_offered | neighborhood\_overview | notes | transit | access | interaction | house\_rules | thumbnail\_url                                                                                                                                                                                                        | medium\_url                                                                                                                                                                                                             | picture\_url                                                                                                                                                                                                          | xl\_picture\_url                                                                                                                                                                                                          | host\_id | host\_url                                                                                                       | host\_name | host\_since | host\_location                   | host\_about                                                               | host\_response\_time | host\_response\_rate | host\_acceptance\_rate | host\_is\_superhost | host\_thumbnail\_url                                                                                                                                                                                                                    | host\_picture\_url                                                                                                                                                                                                                            | host\_neighbourhood | host\_listings\_count | host\_total\_listings\_count | host\_verifications                      | host\_has\_profile\_pic | host\_identity\_verified | street                                                  | neighbourhood   | neighbourhood\_cleansed | neighbourhood\_group\_cleansed | city  | state          | zipcode | market | smart\_location | country\_code | country | latitude | longitude | is\_location\_exact | property\_type | room\_type      | accommodates | bathrooms | bedrooms | beds | bed\_type | amenities                                                                                                                                                     | square\_feet | price   | weekly\_price | monthly\_price | security\_deposit | cleaning\_fee | guests\_included | extra\_people | minimum\_nights | maximum\_nights | calendar\_updated | has\_availability | availability\_30 | availability\_60 | availability\_90 | availability\_365 | calendar\_last\_scraped | number\_of\_reviews | first\_review | last\_review | review\_scores\_rating | review\_scores\_accuracy | review\_scores\_cleanliness | review\_scores\_checkin | review\_scores\_communication | review\_scores\_location | review\_scores\_value | requires\_license | license | jurisdiction\_names | instant\_bookable | cancellation\_policy | require\_guest\_profile\_picture | require\_guest\_phone\_verification | calculated\_host\_listings\_count | reviews\_per\_month |
|---------:|:------------------------------------------------------------------------------------------------------|------------:|:--------------|:------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------|:-----------------------|:------|:--------|:-------|:------------|:-------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------:|:----------------------------------------------------------------------------------------------------------------|:-----------|:------------|:---------------------------------|:--------------------------------------------------------------------------|:---------------------|:---------------------|:-----------------------|:--------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------|----------------------:|-----------------------------:|:-----------------------------------------|:------------------------|:-------------------------|:--------------------------------------------------------|:----------------|:------------------------|:-------------------------------|:------|:---------------|:--------|:-------|:----------------|:--------------|:--------|---------:|----------:|:--------------------|:---------------|:----------------|-------------:|----------:|---------:|-----:|:----------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------:|:--------|:--------------|:---------------|:------------------|:--------------|-----------------:|:--------------|----------------:|----------------:|:------------------|:------------------|-----------------:|-----------------:|-----------------:|------------------:|:------------------------|--------------------:|:--------------|:-------------|-----------------------:|-------------------------:|----------------------------:|------------------------:|------------------------------:|-------------------------:|----------------------:|:------------------|:--------|:--------------------|:------------------|:---------------------|:---------------------------------|:------------------------------------|----------------------------------:|--------------------:|
|  4867396 | <a href="https://www.airbnb.com/rooms/4867396" class="uri">https://www.airbnb.com/rooms/4867396</a>   | 2.01607e+13 | 2016-07-03    | Appartement 60m2 Rue Legendre 75017       | Au 2Ã¨me Ã©tage d’un bel immeuble joli 2 piÃ¨ces meublÃ© comprenant: une grande piÃ¨ce Ã  vivre lumineuse, une chambre, une cuisine, salle de douche et WC sÃ©parÃ©. Appartement trÃ¨s calme et lumineux. A proximitÃ© de nombreux commerces et transports.  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Au 2Ã¨me Ã©tage d’un bel immeuble joli 2 piÃ¨ces meublÃ© comprenant: une grande piÃ¨ce Ã  vivre lumineuse, une chambre, une cuisine, salle de douche et WC sÃ©parÃ©. Appartement trÃ¨s calme et lumineux. A proximitÃ© de nombreux commerces et transports.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | none                 |                        |       |         |        |             |              |                                                                                                                                                                                                                       |                                                                                                                                                                                                                         | <a href="https://a1.muscache.com/im/pictures/61090424/02c8a8bb_original.jpg?aki_policy=large" class="uri">https://a1.muscache.com/im/pictures/61090424/02c8a8bb_original.jpg?aki_policy=large</a>                     |                                                                                                                                                                                                                           |  9703910 | <a href="https://www.airbnb.com/users/show/9703910" class="uri">https://www.airbnb.com/users/show/9703910</a>   | Matthieu   | 2013-10-29  | Nantes, Pays de la Loire, France |                                                                           | N/A                  | N/A                  | N/A                    | f                   | <a href="https://a0.muscache.com/im/users/9703910/profile_pic/1383073563/original.jpg?aki_policy=profile_small" class="uri">https://a0.muscache.com/im/users/9703910/profile_pic/1383073563/original.jpg?aki_policy=profile_small</a>   | <a href="https://a0.muscache.com/im/users/9703910/profile_pic/1383073563/original.jpg?aki_policy=profile_x_medium" class="uri">https://a0.muscache.com/im/users/9703910/profile_pic/1383073563/original.jpg?aki_policy=profile_x_medium</a>   | Batignolles         |                     1 |                            1 | \[‘email’, ‘phone’, ‘reviews’\]          | t                       | f                        | Rue Legendre, Paris, ÃŽle-de-France 75017, France       | Batignolles     | Batignolles-Monceau     | NA                             | Paris | ÃŽle-de-France | 75017   | Paris  | Paris, France   | FR            | France  | 48.88880 |  2.320466 | t                   | Apartment      | Entire home/apt |            2 |         1 |        1 |    1 | Real Bed  | {TV,“Cable TV”,Internet,“Wireless Internet”,Kitchen,Heating,Washer,Dryer,Essentials}                                                                          |           NA | $60.00  | $388.00       |                | $200.00           | $20.00        |                1 | $0.00         |               1 |            1125 | 5 months ago      | NA                |                0 |                0 |                0 |                 0 | 2016-07-03              |                   1 | 2015-05-19    | 2015-05-19   |                    100 |                       10 |                          10 |                      10 |                            10 |                       10 |                    10 | f                 |         | Paris               | f                 | flexible             | f                                | f                                   |                                 1 |                0.07 |
|  7704653 | <a href="https://www.airbnb.com/rooms/7704653" class="uri">https://www.airbnb.com/rooms/7704653</a>   | 2.01607e+13 | 2016-07-04    | Appart au pied de l’arc de triomphe       | Nous proposons cette appartement situÃ© en plein coeur de Paris, au pied de l’arc de triomphe. CommerÃ§ants, mÃ©tro, cinÃ©ma, vous trouverez Ã  proximitÃ© tout ce qu’il faut pour passer quelques jours Ã  Paris en amoureux, entre copains ou en famille ! | L’appartement est composÃ© de : - une grande chambre (environ 15m2) avec un lit simple et d’un matelas d’appoint - une salle de bain avec douche, lave linge/sÃ¨che linge - un autre chambre (environ 10m2) avec un lit double (lit gigogne) et une salle de bain dans la chambre (douche) - un grand salon avec une cuisine ouverte (environ 35 m2) - wc sÃ©parÃ© Le cuisine est tout Ã©quipÃ© : machine nespresso, cocotte-minute, mixeur, lave vaisselle… L’appartement est trÃ¨s lumineux puisqu’il donne sur une avenue large mais calme. Vous trouverez Ã  proximitÃ© plein de commercants, de bar pour sortir, de restaurants, des cinÃ©mas, des musÃ©es. Vous serez au coeur de la ville ! N’hÃ©sitez pas Ã  nous contacter pour plus d’information, de photos… | Nous proposons cette appartement situÃ© en plein coeur de Paris, au pied de l’arc de triomphe. CommerÃ§ants, mÃ©tro, cinÃ©ma, vous trouverez Ã  proximitÃ© tout ce qu’il faut pour passer quelques jours Ã  Paris en amoureux, entre copains ou en famille ! L’appartement est composÃ© de : - une grande chambre (environ 15m2) avec un lit simple et d’un matelas d’appoint - une salle de bain avec douche, lave linge/sÃ¨che linge - un autre chambre (environ 10m2) avec un lit double (lit gigogne) et une salle de bain dans la chambre (douche) - un grand salon avec une cuisine ouverte (environ 35 m2) - wc sÃ©parÃ© Le cuisine est tout Ã©quipÃ© : machine nespresso, cocotte-minute, mixeur, lave vaisselle… L’appartement est trÃ¨s lumineux puisqu’il donne sur une avenue large mais calme. Vous trouverez Ã  proximitÃ© plein de commercants, de bar pour sortir, de restaurants, des cinÃ©mas, des musÃ©es. Vous serez au coeur de la ville ! N’hÃ©sitez pas Ã  nous contacter pour plus d’information, de photos… | none                 |                        |       |         |        |             |              | <a href="https://a1.muscache.com/im/pictures/97911969/ef37b496_original.jpg?aki_policy=small" class="uri">https://a1.muscache.com/im/pictures/97911969/ef37b496_original.jpg?aki_policy=small</a>                     | <a href="https://a1.muscache.com/im/pictures/97911969/ef37b496_original.jpg?aki_policy=medium" class="uri">https://a1.muscache.com/im/pictures/97911969/ef37b496_original.jpg?aki_policy=medium</a>                     | <a href="https://a1.muscache.com/im/pictures/97911969/ef37b496_original.jpg?aki_policy=large" class="uri">https://a1.muscache.com/im/pictures/97911969/ef37b496_original.jpg?aki_policy=large</a>                     | <a href="https://a1.muscache.com/im/pictures/97911969/ef37b496_original.jpg?aki_policy=x_large" class="uri">https://a1.muscache.com/im/pictures/97911969/ef37b496_original.jpg?aki_policy=x_large</a>                     | 35777602 | <a href="https://www.airbnb.com/users/show/35777602" class="uri">https://www.airbnb.com/users/show/35777602</a> | Claire     | 2015-06-14  | Paris, ÃŽle-de-France, France    |                                                                           | N/A                  | N/A                  | N/A                    | f                   | <a href="https://a1.muscache.com/im/users/35777602/profile_pic/1438688930/original.jpg?aki_policy=profile_small" class="uri">https://a1.muscache.com/im/users/35777602/profile_pic/1438688930/original.jpg?aki_policy=profile_small</a> | <a href="https://a1.muscache.com/im/users/35777602/profile_pic/1438688930/original.jpg?aki_policy=profile_x_medium" class="uri">https://a1.muscache.com/im/users/35777602/profile_pic/1438688930/original.jpg?aki_policy=profile_x_medium</a> | Champs-ElysÃ©es     |                     1 |                            1 | \[‘email’, ‘phone’, ‘reviews’\]          | t                       | f                        | Avenue Mac-Mahon, Paris, ÃŽle-de-France 75017, France   | Champs-ElysÃ©es | Batignolles-Monceau     | NA                             | Paris | ÃŽle-de-France | 75017   | Paris  | Paris, France   | FR            | France  | 48.87664 |  2.293724 | t                   | Apartment      | Entire home/apt |            4 |         2 |        2 |    3 | Real Bed  | {“Wireless Internet”,Kitchen,“Elevator in Building”,“Buzzer/Wireless Intercom”,Washer,Dryer,Essentials}                                                       |           NA | $200.00 |               |                |                   |               |                1 | $0.00         |               1 |            1125 | 11 months ago     | NA                |                0 |                0 |                0 |                 0 | 2016-07-04              |                   0 |               |              |                     NA |                       NA |                          NA |                      NA |                            NA |                       NA |                    NA | f                 |         | Paris               | f                 | flexible             | f                                | f                                   |                                 1 |                  NA |
|  2725029 | <a href="https://www.airbnb.com/rooms/2725029" class="uri">https://www.airbnb.com/rooms/2725029</a>   | 2.01607e+13 | 2016-07-04    | Nice appartment in Batignolles            | Located in the very charming Batignolles, this cozy and bright two-room appartment will perfectly suit your stay in Paris.                                                                                                                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Located in the very charming Batignolles, this cozy and bright two-room appartment will perfectly suit your stay in Paris.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | none                 |                        |       |         |        |             |              |                                                                                                                                                                                                                       |                                                                                                                                                                                                                         | <a href="https://a1.muscache.com/im/pictures/96821426/ea9864f1_original.jpg?aki_policy=large" class="uri">https://a1.muscache.com/im/pictures/96821426/ea9864f1_original.jpg?aki_policy=large</a>                     |                                                                                                                                                                                                                           | 13945253 | <a href="https://www.airbnb.com/users/show/13945253" class="uri">https://www.airbnb.com/users/show/13945253</a> | Vincent    | 2014-04-06  | Paris, ÃŽle-de-France, France    |                                                                           | within an hour       | 100%                 | N/A                    | f                   | <a href="https://a0.muscache.com/im/users/13945253/profile_pic/1396781528/original.jpg?aki_policy=profile_small" class="uri">https://a0.muscache.com/im/users/13945253/profile_pic/1396781528/original.jpg?aki_policy=profile_small</a> | <a href="https://a0.muscache.com/im/users/13945253/profile_pic/1396781528/original.jpg?aki_policy=profile_x_medium" class="uri">https://a0.muscache.com/im/users/13945253/profile_pic/1396781528/original.jpg?aki_policy=profile_x_medium</a> | Batignolles         |                     1 |                            1 | \[‘email’, ‘phone’, ‘reviews’\]          | t                       | f                        | Rue la Condamine, Paris, ÃŽle-de-France 75017, France   | Batignolles     | Batignolles-Monceau     | NA                             | Paris | ÃŽle-de-France | 75017   | Paris  | Paris, France   | FR            | France  | 48.88384 |  2.321031 | t                   | Apartment      | Entire home/apt |            2 |         1 |        1 |    1 | Real Bed  | {TV,Internet,“Wireless Internet”,Kitchen,“Indoor Fireplace”,Heating,“Family/Kid Friendly”,Washer,Essentials,Shampoo}                                          |           NA | $80.00  | $501.00       | $1,503.00      | $501.00           |               |                1 | $0.00         |               3 |            1125 | today             | NA                |                6 |               23 |               23 |               298 | 2016-07-04              |                   1 | 2015-10-10    | 2015-10-10   |                     80 |                       NA |                          NA |                      NA |                            NA |                       NA |                    NA | f                 |         | Paris               | f                 | flexible             | f                                | f                                   |                                 1 |                0.11 |
|  9337509 | <a href="https://www.airbnb.com/rooms/9337509" class="uri">https://www.airbnb.com/rooms/9337509</a>   | 2.01607e+13 | 2016-07-03    | Charming flat near Batignolles            | Welcome to my apartment ! This a quiet and cosy flat with 2 room (25 sqm2) fully furnished closed to trendy Batignolles area in the heart of the 17th district. (Near Montmartre foothill / Place de Clichy).                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Welcome to my apartment ! This a quiet and cosy flat with 2 room (25 sqm2) fully furnished closed to trendy Batignolles area in the heart of the 17th district. (Near Montmartre foothill / Place de Clichy).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | none                 |                        |       |         |        |             |              |                                                                                                                                                                                                                       |                                                                                                                                                                                                                         | <a href="https://a2.muscache.com/im/pictures/5fa65f2d-b159-4fb5-986a-bd36cb92d2bc.jpg?aki_policy=large" class="uri">https://a2.muscache.com/im/pictures/5fa65f2d-b159-4fb5-986a-bd36cb92d2bc.jpg?aki_policy=large</a> |                                                                                                                                                                                                                           |  5107123 | <a href="https://www.airbnb.com/users/show/5107123" class="uri">https://www.airbnb.com/users/show/5107123</a>   | Julie      | 2013-02-16  | Paris, ÃŽle-de-France, France    | Nous sommes un jeune couple vivant Ã  Paris. Nous aimons beaucoup voyager | within a day         | 50%                  | N/A                    | f                   | <a href="https://a1.muscache.com/im/users/5107123/profile_pic/1425849895/original.jpg?aki_policy=profile_small" class="uri">https://a1.muscache.com/im/users/5107123/profile_pic/1425849895/original.jpg?aki_policy=profile_small</a>   | <a href="https://a1.muscache.com/im/users/5107123/profile_pic/1425849895/original.jpg?aki_policy=profile_x_medium" class="uri">https://a1.muscache.com/im/users/5107123/profile_pic/1425849895/original.jpg?aki_policy=profile_x_medium</a>   | Batignolles         |                     1 |                            1 | \[‘email’, ‘phone’, ‘reviews’, ‘jumio’\] | t                       | t                        | Rue Gauthey, Paris, ÃŽle-de-France 75017, France        | Batignolles     | Batignolles-Monceau     | NA                             | Paris | ÃŽle-de-France | 75017   | Paris  | Paris, France   | FR            | France  | 48.89236 |  2.322338 | t                   | Apartment      | Entire home/apt |            2 |         1 |        1 |    1 | Real Bed  | {“Wireless Internet”,Kitchen,Heating,Washer,Essentials}                                                                                                       |           NA | $60.00  |               |                | $250.00           |               |                0 | $0.00         |               2 |            1125 | 8 months ago      | NA                |               29 |               59 |               89 |               364 | 2016-07-03              |                   1 | 2015-12-15    | 2015-12-15   |                     80 |                        6 |                          10 |                       8 |                            10 |                        6 |                     8 | f                 |         | Paris               | f                 | flexible             | f                                | f                                   |                                 1 |                0.15 |
| 12928158 | <a href="https://www.airbnb.com/rooms/12928158" class="uri">https://www.airbnb.com/rooms/12928158</a> | 2.01607e+13 | 2016-07-04    | Spacious bedroom near the centre of Paris | Spacious, quiet and bright room, ideal to explore and enjoy                                                                                                                                                                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Spacious, quiet and bright room, ideal to explore and enjoy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | none                 |                        |       |         |        |             |              | <a href="https://a2.muscache.com/im/pictures/df47511b-0e86-4dcb-9887-569489b16020.jpg?aki_policy=small" class="uri">https://a2.muscache.com/im/pictures/df47511b-0e86-4dcb-9887-569489b16020.jpg?aki_policy=small</a> | <a href="https://a2.muscache.com/im/pictures/df47511b-0e86-4dcb-9887-569489b16020.jpg?aki_policy=medium" class="uri">https://a2.muscache.com/im/pictures/df47511b-0e86-4dcb-9887-569489b16020.jpg?aki_policy=medium</a> | <a href="https://a2.muscache.com/im/pictures/df47511b-0e86-4dcb-9887-569489b16020.jpg?aki_policy=large" class="uri">https://a2.muscache.com/im/pictures/df47511b-0e86-4dcb-9887-569489b16020.jpg?aki_policy=large</a> | <a href="https://a2.muscache.com/im/pictures/df47511b-0e86-4dcb-9887-569489b16020.jpg?aki_policy=x_large" class="uri">https://a2.muscache.com/im/pictures/df47511b-0e86-4dcb-9887-569489b16020.jpg?aki_policy=x_large</a> | 51195601 | <a href="https://www.airbnb.com/users/show/51195601" class="uri">https://www.airbnb.com/users/show/51195601</a> | Daniele    | 2015-12-13  | Prato, Toscana, Italy            |                                                                           | within an hour       | 100%                 | 60%                    | f                   | <a href="https://a2.muscache.com/im/pictures/e984ba68-7571-46d9-99dc-735ec6e5c9d6.jpg?aki_policy=profile_small" class="uri">https://a2.muscache.com/im/pictures/e984ba68-7571-46d9-99dc-735ec6e5c9d6.jpg?aki_policy=profile_small</a>   | <a href="https://a2.muscache.com/im/pictures/e984ba68-7571-46d9-99dc-735ec6e5c9d6.jpg?aki_policy=profile_x_medium" class="uri">https://a2.muscache.com/im/pictures/e984ba68-7571-46d9-99dc-735ec6e5c9d6.jpg?aki_policy=profile_x_medium</a>   | Ternes              |                     1 |                            1 | \[‘email’, ‘phone’, ‘reviews’, ‘jumio’\] | t                       | t                        | Avenue BrunetiÃ¨re, Paris, ÃŽle-de-France 75017, France | Ternes          | Batignolles-Monceau     | NA                             | Paris | ÃŽle-de-France | 75017   | Paris  | Paris, France   | FR            | France  | 48.88942 |  2.298321 | t                   | Apartment      | Private room    |            2 |         1 |        1 |    1 | Real Bed  | {“Wireless Internet”,Kitchen,“Smoking Allowed”,“Pets Allowed”,Breakfast,“Elevator in Building”,Heating,“Family/Kid Friendly”,Washer,Dryer,Essentials,Shampoo} |           NA | $50.00  |               |                |                   |               |                1 | $0.00         |               1 |              30 | 4 weeks ago       | NA                |               29 |               59 |               89 |                89 | 2016-07-04              |                   2 | 2016-06-17    | 2016-06-17   |                    100 |                       10 |                          10 |                      10 |                            10 |                       10 |                    10 | f                 |         | Paris               | f                 | flexible             | f                                | f                                   |                                 1 |                2.00 |
|  5589471 | <a href="https://www.airbnb.com/rooms/5589471" class="uri">https://www.airbnb.com/rooms/5589471</a>   | 2.01607e+13 | 2016-07-04    | Rare, Maison individuelle 200m2           | Maison individuelle, 200 m2 habitable,rÃ©novÃ©e en 2013. Quartier rÃ©sidentiel, nombreux commerces, restaurants. Maison familiale, pouvant accueillir 5 adultes et un enfant (1 lit en hauteur).                                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Maison individuelle, 200 m2 habitable,rÃ©novÃ©e en 2013. Quartier rÃ©sidentiel, nombreux commerces, restaurants. Maison familiale, pouvant accueillir 5 adultes et un enfant (1 lit en hauteur).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | none                 |                        |       |         |        |             |              |                                                                                                                                                                                                                       |                                                                                                                                                                                                                         | <a href="https://a2.muscache.com/im/pictures/69589240/79d976c4_original.jpg?aki_policy=large" class="uri">https://a2.muscache.com/im/pictures/69589240/79d976c4_original.jpg?aki_policy=large</a>                     |                                                                                                                                                                                                                           | 28980052 | <a href="https://www.airbnb.com/users/show/28980052" class="uri">https://www.airbnb.com/users/show/28980052</a> | Philippe   | 2015-03-08  | Paris, ÃŽle-de-France, France    |                                                                           | N/A                  | N/A                  | N/A                    | f                   | <a href="https://a0.muscache.com/im/users/28980052/profile_pic/1425844331/original.jpg?aki_policy=profile_small" class="uri">https://a0.muscache.com/im/users/28980052/profile_pic/1425844331/original.jpg?aki_policy=profile_small</a> | <a href="https://a0.muscache.com/im/users/28980052/profile_pic/1425844331/original.jpg?aki_policy=profile_x_medium" class="uri">https://a0.muscache.com/im/users/28980052/profile_pic/1425844331/original.jpg?aki_policy=profile_x_medium</a> | Batignolles         |                     1 |                            1 | \[‘email’, ‘phone’\]                     | t                       | f                        | Rue de Saussure, Paris, ÃŽle-de-France 75017, France    | Batignolles     | Batignolles-Monceau     | NA                             | Paris | ÃŽle-de-France | 75017   | Paris  | Paris, France   | FR            | France  | 48.88707 |  2.312212 | t                   | House          | Entire home/apt |            6 |         3 |        4 |    4 | Real Bed  | {TV,Internet,“Wireless Internet”,Kitchen,Heating,“Family/Kid Friendly”,Washer,Dryer,“Smoke Detector”,“Fire Extinguisher”,Essentials}                          |           NA | $191.00 |               |                |                   | $50.00        |                1 | $0.00         |               3 |            1125 | 5 months ago      | NA                |                0 |                0 |                0 |                 0 | 2016-07-04              |                   0 |               |              |                     NA |                       NA |                          NA |                      NA |                            NA |                       NA |                    NA | f                 |         | Paris               | f                 | flexible             | f                                | f                                   |                                 1 |                  NA |

Table with Kable

    #tail(L)

<div
id="now-we-know-that-we-are-dealing-with-large-dataset-we-need-to-deploy-few-libraries-that-can-help-us-navigate-through-this-and-come-up-with-relationships-between-the-columns."
class="section level3">

### Now we know that we are dealing with “Large dataset”, we need to deploy few libraries that can help us navigate through this and come up with relationships between the columns.

    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    library(tidyr)
    library(stringr)
    library(ggplot2)
    library(ggmap)

    ## Google's Terms of Service: https://cloud.google.com/maps-platform/terms/.

    ## Please cite ggmap if you use it! See citation("ggmap") for details.

Usually, it is easy to work on cleaned data rather than raw data.

While exploring, we might find few columns with no information, in this
case we can drop them:

    data = L[is.na(L$square_feet) == TRUE, ]

    dim(L) #Original data set 

    ## [1] 52725    95

    dim(data) #Only few values observed in the "Square_feet" column.

    ## [1] 50218    95

    thedata <- select(L, Apartment_ID=id, ApartmentName=name, Host_ID=host_id, Host_Name=host_name, Location=host_location, city, state, zipcode, country, property_type, room_type, accommodates, bathrooms, bedrooms, beds, bed_type, amenities, price, weekly_price, Arrondissements=neighbourhood, house_rules, cancellation_policy,host_listings_count,longitude,latitude)

    ncol(thedata)

    ## [1] 25

    colnames(thedata)

    ##  [1] "Apartment_ID"        "ApartmentName"       "Host_ID"            
    ##  [4] "Host_Name"           "Location"            "city"               
    ##  [7] "state"               "zipcode"             "country"            
    ## [10] "property_type"       "room_type"           "accommodates"       
    ## [13] "bathrooms"           "bedrooms"            "beds"               
    ## [16] "bed_type"            "amenities"           "price"              
    ## [19] "weekly_price"        "Arrondissements"     "house_rules"        
    ## [22] "cancellation_policy" "host_listings_count" "longitude"          
    ## [25] "latitude"

Often it is useful to subset the data from raw data to facilitate easy
manoeuvre.

Now we operate on “thedata”. Modifing it further to draw graphs and
charts:

    #hist(thedata$price) - #this indicates we cannot perform operations on price which could be a problem, so we change the data type.

    thedata$price = as.numeric(thedata$price)
    thedata$amenities = str_count(thedata$amenities, '\\w+') 

    typeof(thedata$price)

    ## [1] "double"

    hist(thedata$price)

<img src="./89505d7a692bfddf208b197f116fa9e749f2b2e9.png" width="672" />

    #duprowsremovd = unique(data[,]) 
    #dim(duprowsremovd) #All columns considered

    #duprowsremvd = data %>% distinct(host_id,host_name, .keep_all = TRUE)
    #dim(duprowsremvd) #unique hostid and hostname considered

    #head(duprowsremvd)

Now that we have only what we need, We proceed to finding relationship
between the data:

<div id="relationship-between-prices-and-apartment-features--"
class="section level4">

#### Relationship between prices and apartment features -

    ggplot(data=thedata) + 
      geom_smooth(mapping = aes(x=price,y=beds), method = 'gam', col = 'blue') +
      geom_smooth(mapping = aes(x=price,y=bedrooms), method = 'gam', col = 'red') +
      geom_smooth(mapping = aes(x=price,y=bathrooms), method = 'gam', col = 'green') +
      geom_smooth(mapping = aes(x=price,y=accommodates), method = 'gam', col = 'yellow') +
      ggtitle("Apartment price and features") + labs(y= "Features", x = "Price") 

    ## `geom_smooth()` using formula 'y ~ s(x, bs = "cs")'
    ## `geom_smooth()` using formula 'y ~ s(x, bs = "cs")'
    ## `geom_smooth()` using formula 'y ~ s(x, bs = "cs")'
    ## `geom_smooth()` using formula 'y ~ s(x, bs = "cs")'

<img src="./bda7380d448e0bf25d2fe3da7ac4398171f51735.png" width="672" />

This graph shows that the apartment features are more in the budget
cateogry compared to 300-400 price range but then they tend to rise
again as the price of the apartment goes up.

The rise in the number of features in budget category could be justified
as most of apartments in this segment are shared(hence more
beds,bedrooms etc)

</div>

<div
id="here-we-define-a-function-that-takes-a-neighbourhood-and-graphs-the-distribution-of-beds-and-bedrooms-according-to-room-type."
class="section level4">

#### Here we define a function that takes a neighbourhood and graphs the distribution of beds and bedrooms according to room type.

    Neighbourhood <- function(string){
      graph = ggplot(data = thedata) + geom_boxplot(aes(y = beds, x = bedrooms),
      col = 'blueviolet') + facet_wrap(~room_type)
      
      return(graph)
    }
                                    
    Neighbourhood('Paris')

<img src="./d1182d6ffcc1b87eee682d435f67864c1b654be7.png" width="672" />

</div>

<div id="price-distribution-among-different-room-types"
class="section level4">

#### Price distribution among different room types:

    ggplot(thedata, aes(x = room_type, y = price)) +
        geom_violin() +
        scale_y_log10()

<img src="./49dd3308859ad6d698c5bf1d85957005bed44306.png" width="672" />

<div
id="this-highlights-the-potential-of-a-library-we-used-above---ggplot"
class="section level6">

###### This highlights the potential of a library we used above - ggplot

We can see that the prices of pirvate rooms tend to be more compared to
other types. Privacy isn’t cheap now.

</div>

</div>

<div
id="noticing-the-trend-of-amenities-around-different-room-types-and-their-prices"
class="section level4">

#### Noticing the trend of amenities around different room types and their prices:

    ggplot(data=thedata) + geom_smooth(aes(y=amenities,x=accommodates))

    ## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

<img src="./d6098e797f152fdaed9f658bb54a114731b533b2.png" width="672" />

This graph illustrates the distribution of amenities for accommodates.

    ggplot(data=thedata) + geom_smooth(aes(x=price,y=amenities)) + facet_wrap(~room_type,ncol=1)

    ## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

<img src="./5d53aaf1d8774d50486e03d87577c30e6cec5bba.png" width="672" />

We can see the distribuion of amenities across various price points. In
a shared room the number of amenities peak at 25, in a private room they
stay at 20 and in entire house they vary from 25 to above.

</div>

<div id="behaviour-of-prices-across-cancellation-policies"
class="section level4">

#### Behaviour of prices across cancellation policies:

    ggplot(data=thedata) + geom_bar(aes(x=price) , col='black') + facet_wrap(~cancellation_policy,ncol=2)

<img src="./f94bca479a7d77303d9576ce4bfad1c2ff7a2a4c.png" width="672" />

We can neatly see the price distributed across cancellation policy
(super strict to flexible).

More hosts charging around $350 tend to be flexible with cancellation
policies.

</div>

<div id="here-we-can-see-the-hosts-in-contrast-to-super-hosts"
class="section level4">

#### Here we can see the hosts in contrast to super hosts:

    ggplot(L) +
      geom_bar(aes(x='' , fill=host_is_superhost)) +
      coord_polar(theta='y') +
      scale_fill_brewer(palette="Blues")+
      theme_minimal() 

<img src="./a0accc191e7dbef9eeb9b9992e31305efb15ae94.png" width="672" />

</div>

<div id="there-is-an-interesting-package-with-in-r-called"
class="section level4">

#### There is an interesting package with in R called:

> ggmap

This allows us draw spatial data on top of static maps from various
online sources like Google and Stamen maps, mostly used in geolocation
and routing in real time.

    library(maps)
    map('france')

<img src="./7a1f5ac17e2b6e7294a001203bf93bfd311538f6.png" width="672" />

    library(ggmap)

    get_map(location = c(lon=46.2276, lat = 2.2137)) #This sets the map location 

    ## Source : https://maps.googleapis.com/maps/api/staticmap?center=2.2137,46.2276&zoom=10&size=640x640&scale=2&maptype=terrain&language=en-EN&key=xxx

    ## 1280x1280 terrain map image from Google Maps. 
    ## See ?ggmap to plot it.

    france <- get_map( location = c(lon = 46.2276, lat = 2.2137))

    ## Source : https://maps.googleapis.com/maps/api/staticmap?center=2.2137,46.2276&zoom=10&size=640x640&scale=2&maptype=terrain&language=en-EN&key=xxx

    #ggmap(france) - We will require a API key to be able to plot this 

    #Getting the API from google cloud platform : 
    register_google(key = "AIzaSyDZjd5TEpnt1Rlo_8umbl2g_HJjSad5z1A", write = TRUE)

    ## Replacing old key (AIzaSyDZjd5TEpnt1Rlo_8umbl2g_HJjSad5z1A) with new key in C:\Users\verce\Documents/.Renviron

    ggmap(france)

<img src="./f73d0a73d1b47e915b32fdfb0a1a8b53d60a30e4.png" width="672" />

<div
id="since-we-dont-have-a-real-time-requirement-for-our-data-we-can-plot-a-map-using-the-latitudes-and-longitudes-columns-from-the-data-set."
class="section level5">

##### Since we don’t have a real time requirement for our data we can plot a map using the latitudes and longitudes columns from the data set.

</div>

</div>

<div
id="this-map-illustrates-the-top-7-expensive-listings-from-the-data"
class="section level4">

#### This map illustrates the top 7 expensive listings from the data:

    top_df <- thedata %>% top_n(n = 7, wt = price)

    #Setting the map
    top_height <- max(top_df$latitude) - min(top_df$latitude)
    top_width <- max(top_df$longitude) - min(top_df$longitude)
    top_borders <- c(bottom  = min(top_df$latitude)  - 0.1 * top_height,
                     top     = max(top_df$latitude)  + 0.1 * top_height,
                     left    = min(top_df$longitude) - 0.1 * top_width,
                     right   = max(top_df$longitude) + 0.1 * top_width)

      top_map <- get_stamenmap(top_borders, zoom = 12, maptype = "toner")

    ## Source : http://tile.stamen.com/toner/12/2073/1408.png

    ## Source : http://tile.stamen.com/toner/12/2074/1408.png

    ## Source : http://tile.stamen.com/toner/12/2075/1408.png

    ## Source : http://tile.stamen.com/toner/12/2073/1409.png

    ## Source : http://tile.stamen.com/toner/12/2074/1409.png

    ## Source : http://tile.stamen.com/toner/12/2075/1409.png

    #Plotting the map 

    ggmap(top_map) +
        geom_point(data = top_df, mapping = aes(x = longitude, y = latitude,
                                            col = price)) +
        scale_color_gradient(low = "blue", high = "red")

<img src="./cb32fd3021de30e1b9ed717dbd23c6902080f2f7.png" width="672" />

                                                                                         R PROJECT - AIRBNB - PARIS 

</div>

</div>

</div>

</div>
