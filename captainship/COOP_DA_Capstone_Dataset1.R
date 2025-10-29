require(tidyverse)
require(cleaner)

myFun2 <- function(n = 50) {
  a <- do.call(paste0, replicate(2, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%02d", sample(999, n, TRUE)), sample(LETTERS, n, TRUE))
}

campaign_id <- myFun2(3452)
campaign_id <- data.frame(campaign_id)

ad_format <- unlist(list(sample(0:3, size = 3452, replace = T)))
ad_format <- data.frame(ad_format)

ad_position <- unlist(list(sample(0:3, size = 3452, replace = T)))
ad_position <- data.frame(ad_position)

deal_type <- unlist(list(sample(0:2, size = 3452, replace = T)))
deal_type <- data.frame(deal_type)

auction_type <- unlist(list(sample(0:1, size = 3452, replace = T)))
auction_type <- data.frame(auction_type)

creative_size <- unlist(list(sample(0:6, size = 3452, replace = T)))
creative_size <- data.frame(creative_size)

segment_list <- c("Health", "Home", "Technology", "Food", "Fashion", "Travel", "Music", "Sports")
segment <- sample (segment_list, 3452, replace = TRUE)
segment <- data.frame(segment)

creative_messaging_list <- c("Fast WiFi Now", "Get Unlimited", "Start Your Plan", "Switch & Save", "Upgrade Today")
creative_messaging <- sample (creative_messaging_list, 3452, replace = TRUE)
creative_messaging <- data.frame(creative_messaging)

ad_impressions <- unlist(list(sample(50000:300000, size = 3452, replace = T)))
ad_impressions <- data.frame(ad_impressions)

random_percentage <- runif(3452)
measurable_impressions <- ceiling(ad_impressions$ad_impressions * random_percentage)
measurable_impressions <- data.frame(measurable_impressions)

random_percentage <- runif(3452)
viewable_impressions <- ceiling(measurable_impressions$measurable_impressions * random_percentage)
viewable_impressions <- data.frame(viewable_impressions)

random_percentage <- runif(3452)
clicks <- ceiling(viewable_impressions$viewable_impressions * random_percentage)
clicks <- data.frame(clicks)

random_percentage <- runif(3452)
conversions <- ceiling(clicks$clicks * random_percentage)
conversions <- data.frame(conversions)

random_percentage <- sample(99:299, size = 3452, replace = T)
acquisition_cost <- conversions$conversions * random_percentage / pi
acquisition_cost <- data.frame(acquisition_cost)

random_percentage <- sample(1:299, size = 3452, replace = T)
advertising_cost <- acquisition_cost * (random_percentage / 100)
advertising_cost <- data.frame(advertising_cost)
colnames(advertising_cost) <- c("advertising_cost")

app_url <- unlist(list(sample(0:2, size = 3452, replace = T)))

for (i in 1:3452) {
  if (segment$segment[i] == "Health" & app_url[i] == 0){
    app_url[i] <- "www.healthline.com"
  } else if (segment$segment[i] == "Health" & app_url[i] == 1){
    app_url[i] <- "www.verywellhealth.com"
  } else if (segment$segment[i] == "Health" & app_url[i] == 2){
    app_url[i] <- "www.webmd.com"
  } else if (segment$segment[i] == "Home" & app_url[i] == 0){
    app_url[i] <- "www.architecturaldigest.com"
  } else if (segment$segment[i] == "Home" & app_url[i] == 1){
    app_url[i] <- "www.wayfair.com"
  } else if (segment$segment[i] == "Home" & app_url[i] == 2){
    app_url[i] <- "www.houzz.com"
  } else if (segment$segment[i] == "Technology" & app_url[i] == 0){
    app_url[i] <- "www.techcrunch.com"
  } else if (segment$segment[i] == "Technology" & app_url[i] == 1){
    app_url[i] <- "www.engadget.com"
  } else if (segment$segment[i] == "Technology" & app_url[i] == 2){
    app_url[i] <- "www.cnet.com"
  } else if (segment$segment[i] == "Food" & app_url[i] == 0){
    app_url[i] <- "www.foodnetwork.com"
  } else if (segment$segment[i] == "Food" & app_url[i] == 1){
    app_url[i] <- "www.food52.com"
  } else if (segment$segment[i] == "Food" & app_url[i] == 2){
    app_url[i] <- "www.epicurious.com"
  } else if (segment$segment[i] == "Fashion" & app_url[i] == 0){
    app_url[i] <- "www.vogue.com"
  } else if (segment$segment[i] == "Fashion" & app_url[i] == 1){
    app_url[i] <- "www.instyle.com"
  } else if (segment$segment[i] == "Fashion" & app_url[i] == 2){
    app_url[i] <- "www.harpersbazaar.com"
  } else if (segment$segment[i] == "Travel" & app_url[i] == 0){
    app_url[i] <- "www.booking.com"
  } else if (segment$segment[i] == "Travel" & app_url[i] == 1){
    app_url[i] <- "www.expedia.com"
  } else if (segment$segment[i] == "Travel" & app_url[i] == 2){
    app_url[i] <- "www.tripadvisor.com"
  } else if (segment$segment[i] == "Music" & app_url[i] == 0){
    app_url[i] <- "www.pitchfork.com"
  } else if (segment$segment[i] == "Music" & app_url[i] == 1){
    app_url[i] <- "www.thedailymusicreport.com"
  } else if (segment$segment[i] == "Music" & app_url[i] == 2){
    app_url[i] <- "www.billboard.com"
  } else if (segment$segment[i] == "Sports" & app_url[i] == 0){
    app_url[i] <- "www.espn.com"
  } else if (segment$segment[i] == "Sports" & app_url[i] == 1){
    app_url[i] <- "www.sports.yahoo.com"
  } else if (segment$segment[i] == "Sports" & app_url[i] == 2){
    app_url[i] <- "www.nbcsports.com"
  }
}
app_url <- data.frame(app_url)

ad_exchange <- unlist(list(sample(0:4, size = 3452, replace = T)))
ad_exchange <- data.frame(ad_exchange)

dataset1 <- cbind(campaign_id, ad_format, ad_position, deal_type, auction_type, creative_size, segment, creative_messaging, ad_impressions, measurable_impressions, viewable_impressions, clicks, conversions, advertising_cost, acquisition_cost, app_url, ad_exchange)

dataset1$row_num <- seq.int(nrow(dataset1))

write.csv(dataset1, "FA25_COOP_DA_Capstone_Dataset_1.csv", row.names = F)

rm('campaign_id', 'ad_format', 'ad_position', 'deal_type', 'auction_type', 'creative_size', 'segment', 'creative_messaging', 'ad_impressions', 'measurable_impressions', 'viewable_impressions', 'clicks', 'conversions', 'advertising_cost', 'acquisition_cost', 'app_url', 'ad_exchange')
