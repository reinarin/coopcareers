library(fixtuRes)

ad_view_date <- data.frame(rdate(10000, min = paste0("2024-10-15"), max = paste("2025-10-15")))
colnames(ad_view_date) <- "ad_view_date"

ad_view_time_hour <- unlist(list(sample(00:23, size = 10000, replace = T)))
ad_view_time_minute <- unlist(list(sample(00:59, size = 10000, replace = T)))

ad_view_time_hour <- sprintf("%02d", ad_view_time_hour)
ad_view_time_minute <- sprintf("%02d", ad_view_time_minute)

ad_view_time <- cbind(ad_view_time_hour, ad_view_time_minute)
ad_view_time <- data.frame(ad_view_time)

ad_view_time <- ad_view_time %>%
  unite("ad_view_time", ad_view_time_hour:ad_view_time_minute, sep = ":", remove = TRUE)

userid <- unlist(list(sample(1:394, size = 10000, replace = T)))
campaign_id <- unlist(list(sample(1:3452, size = 10000, replace = T)))


userid_table <- dataset2 %>%
  select(row_num, userid)

campaignid_table <- dataset1 %>%
  select(row_num, campaign_id)

dataset3 <- cbind(ad_view_date, ad_view_time, userid, campaign_id)

dataset3 <- dataset3 %>%
  inner_join(userid_table, by = join_by(userid == row_num)) %>%
  select(-userid) %>%
  inner_join(campaignid_table, by = join_by(campaign_id == row_num)) %>%
  select(-campaign_id)

colnames(dataset3) <- c("ad_view_date", "ad_view_time", "userid", "campaign_id")

write.csv(dataset3, "FA25_COOP_DA_Capstone_Dataset_3.csv", row.names = F)
