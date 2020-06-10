library(tidyr)
library(shiny)
library(dplyr)
library(stringr)
library(ggplot2)

#load("C:/Users/verce/Downloads/AirBnB.Rdata")


thedata <- select(L, Apartment_ID=id, ApartmentName=name, Host_ID=host_id, Host_Name=host_name, Location=host_location, 
                  city, state, zipcode, country, property_type, room_type, accommodates, bathrooms, bedrooms, beds, bed_type, 
                  amenities, price, weekly_price, Arrondissements=neighbourhood,house_rules,cancellation_policy,host_listings_count,
                  longitude,latitude,last_scraped,reviews_per_month)

#View(thedata)

iNumberOfBedroomsOptions <- sort(c(unique(thedata$bedrooms)))
sRoomTypeOptions <- levels(thedata$room_type)
sBedTypeOptions <- levels(thedata$bed_type)
iNumberOfBedsOptions <- sort(c(unique(thedata$beds)))
iNumberofBathroomnsOptions <- sort(c(unique(thedata$bathrooms)))
sArrondissementsInParis <- str_trim(str_to_upper(str_sort(levels(thedata$Arrondissements))))
sHostName <- str_trim(str_to_upper(str_sort(levels(thedata$Host_Name))))
thedata$price = as.numeric(thedata$price)
thedata$amenities = str_count(thedata$amenities, '\\w+') 


ui <- fluidPage (
    headerPanel("AIRBNB - PARIS"),
    sidebarLayout(
        sidebarPanel(
            
            radioButtons("typeInput", "Choose an Option",
                         choices = c("Relationship between prices and appartment feature", "Number of appartments per owner",
                                     "Renting prices per arrondissement", "Visit frequency of different quarters according to time"),
                         selected = "Relationship between prices and appartment feature"),
            
            
                                              # P L O T 1
            
            conditionalPanel(
                condition = "input.typeInput == 'Relationship between prices and appartment feature'",
                
                radioButtons("typeInputr", "Choose Apartment Feature",
                             choices = c("Accommodation", 
                                         "Bathrooms",
                                         "Bedrooms", 
                                         "Beds", 
                                         "Roomtype"),
                             selected = "Accommodation"),
                
            ),
            
                                             # P L O T 2 
            
            
            conditionalPanel(
                condition = "input.typeInput == 'Number of appartments per owner'",
                numericInput('nlabs','Number of labels:', min=1,max=26,value=1),
                textOutput('texty'),
                uiOutput('plot2')
            ),
            
                                             # P L O T 3 
            
            
            conditionalPanel(
                condition = "input.typeInput == 'Renting prices per arrondissement'",
                selectInput("ArrondissementNumber", "Please select name of Arrondissement: ",
                            choices = c("Select Arrondissement Name"="",sArrondissementsInParis)),
                
            ),
            
            
                                            # P L O T 4
           conditionalPanel(
              condition = "input.typeInput == 'Visit frequency of different quarters according to time'",
             # selectInput("ArrondissementNumber", "Please select name of Arrondissement: ",
                         # choices = c("Select Arrondissement Name"="",sArrondissementsInParis)),
              
            ),
            
        ),
        
        mainPanel (
                plotOutput("coolplot"),
                ),
        
        
    ), #sidebarpanel
) #fluidpage 



                                              #### S E R V E R #####


server <- function(input, output) {
    output$plot2 <- renderUI({
        # Create labels
        my_labs = sort(LETTERS[1:input$nlabs]) 
        my_labs = paste(sapply(my_labs,function(x){paste0("'",x,"'")}),collapse=",")
        # Create the JS code
        JScode <-paste0(
            "$(function() {
      setTimeout(function(){
      var names = [", my_labs, "];
      var vals = [];
      for (i = 0; i < names.length; i++) {
      var val = names[i];
      vals.push(val);
      }
      $('#pvalue').data('ionRangeSlider').update({'values':vals})
      }, 7)})")
        # Return the div with the JS Code and the sliderInput.
        div(
            tags$head(tags$script(HTML(JScode))),
            sliderInput("pvalue",
                        "Host name starts with:",
                        min = 0,
                        max = 26,
                        value = 0
            )
        )
    })
    
    
    output$coolplot <- renderPlot( {
        
                                           # P L O T 1
      
        if(input$typeInputr == 'Accommodation'){
            a <- ggplot(data=thedata) + 
                geom_smooth(mapping = aes(x= price ,y=accommodates), col = 'yellow') +
                ggtitle("Apartment price and features") + labs(y= "Accommodates", x = "Price")
            plot(a) }
        
        if(input$typeInputr == 'Bathrooms'){
            b <- ggplot(data=thedata) + 
                geom_smooth(mapping = aes(x=price,y=bathrooms), col = 'green') +
                ggtitle("Apartment price and features") + labs(y= "Bathrooms", x = "Price")
            plot(b)
        }
        
        if(input$typeInputr == 'Bedrooms'){
            c <- ggplot(data=thedata) + 
                geom_smooth(mapping = aes(x=price,y=bedrooms), col = 'red') +
                ggtitle("Apartment price and features") + labs(y= "Bedrooms", x = "Price")
            plot(c)
        }
        
        if(input$typeInputr == 'Beds'){
            d <- ggplot(data=thedata) + 
                geom_smooth(mapping = aes(x=thedata$price,y=beds), col = 'blue') +
                ggtitle("Apartment price and features") + labs(y= "Beds", x = "Price")
            plot(d) }
        
        if(input$typeInputr == 'Roomtype'){
            e <- ggplot(data = thedata, aes(x=room_type,y=price)) +
                geom_violin() + scale_y_log10()
            plot(e)
        }
        
        
                                           # P L O T 2
        
        my_char_list = LETTERS
        temp <- thedata[,c(1,3,4,10)]
        iNumberOfApartmentsPerOwner <- temp %>% 
            filter(property_type == "Apartment") %>%
            group_by(Host_ID, Host_Name) %>% summarise(Total=n_distinct(Apartment_ID))
        
        if (input$typeInput == 'Number of appartments per owner'){
            if(my_char_list[input$pvalue+1] == "A"){
                NamesStartingA <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^A"))
                g<- ggplot(NamesStartingA, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)
            }else if(my_char_list[input$pvalue+1] == "B"){
                NamesStartingB <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^B"))
                g<- ggplot(NamesStartingB, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "C"){
                NamesStartingC <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^C"))
                g<- ggplot(NamesStartingC, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "D"){
                NamesStartingD <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^D"))
                g<- ggplot(NamesStartingD, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "E"){
                NamesStartingE <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^E"))
                g<- ggplot(NamesStartingE, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "F"){
                NamesStartingF <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^F"))
                g<- ggplot(NamesStartingF, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "G"){
                NamesStartingG <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^G"))
                g<- ggplot(NamesStartingG, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "H"){
                NamesStartingH <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^H"))
                g<- ggplot(NamesStartingH, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "I"){
                NamesStartingI <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^I"))
                g<- ggplot(NamesStartingI, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "J"){
                NamesStartingJ <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^J"))
                g<- ggplot(NamesStartingJ, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "K"){
                NamesStartingK <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^K"))
                g<- ggplot(NamesStartingK, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "L"){
                NamesStartingL <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^L"))
                g<- ggplot(NamesStartingL, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "M"){
                NamesStartingM <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^M"))
                g<- ggplot(NamesStartingM, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "N"){
                NamesStartingN <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^N"))
                g<- ggplot(NamesStartingN, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "O"){
                NamesStartingO <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^O"))
                g<- ggplot(NamesStartingO, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "P"){
                NamesStartingP <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^P"))
                g<- ggplot(NamesStartingP, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "Q"){
                NamesStartingQ <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^Q"))
                g<- ggplot(NamesStartingQ, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "R"){
                NamesStartingR <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^R"))
                g<- ggplot(NamesStartingR, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "S"){
                NamesStartingS <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^S"))
                g<- ggplot(NamesStartingS, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "T"){
                NamesStartingT <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^T"))
                g<- ggplot(NamesStartingT, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "U"){
                NamesStartingU <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^U"))
                g<- ggplot(NamesStartingU, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "V"){
                NamesStartingV <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^V"))
                g<- ggplot(NamesStartingV, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "W"){
                NamesStartingW <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^W"))
                g<- ggplot(NamesStartingW, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "X"){
                NamesStartingX <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^X"))
                g<- ggplot(NamesStartingX, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "Y"){
                NamesStartingY <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^Y"))
                g<- ggplot(NamesStartingY, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }else if(my_char_list[input$pvalue+1] == "Z"){
                NamesStartingZ <- iNumberOfApartmentsPerOwner %>% 
                    ungroup(iNumberOfApartmentsPerOwner) %>%
                    filter(str_detect(iNumberOfApartmentsPerOwner$Host_Name, "^Z"))
                g<- ggplot(NamesStartingZ, aes(x=Host_Name, y=Total)) + geom_point()
                plot(g)   
            }     
        }
        
                                         # P L O T 3 
        
        if (input$typeInput == 'Renting prices per arrondissement') {
            B <- spread(thedata, Arrondissements, price)
            C <- select(B,c(1:2,24:87))
            for(i in 1:length(sArrondissementsInParis)){
                if(input$ArrondissementNumber == sArrondissementsInParis[i])
                {
                    Subs1<-subset(C, (!is.na(C[,2])) & (!is.na(C[,i+2]))) %>% select(2,i+2)
                    ApartmentPrice<- as.numeric(gsub("[\\$,]", "", Subs1[,2]))
                    g<- ggplot(Subs1, aes(x=ApartmentName, y=ApartmentPrice)) + geom_point() 
                    plot(g)
                } 
            } 
        }
        
                                           # P L O T 4
        
        if (input$typeInput == 'Visit frequency of different quarters according to time') { 
          
        
          ggplot(thedata, aes(x=Arrondissements, y=reviews_per_month)) + geom_point() + 
                labs(x='Arrondissements', y = 'Visit frequency based on reviews per month') + facet_wrap(~last_scraped,ncol = 1)
          
          
          
          }
          
 } ) 
    
}#serverclosing. 

shinyApp(ui = ui, server = server) 








