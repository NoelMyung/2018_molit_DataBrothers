# inital setting
rm(list = ls())
dir <- 'C:/Users/Taewoong/Projects/Hackerthon/01_Code'
setwd(dir)

source("functions/import_packages.r")

# file path
filepath <- "../00_Data/�ǰŷ���_OUT"
filename <- 'TBL_�����_����Ʈ_�Ÿ�.csv'
out_name_gu <- 'LOC_GU_����Ʈ.csv'
out_name_dong <- 'LOC_DONG_����Ʈ.csv'

# read data
file_path_name <- paste(filepath, filename, sep = '/')
rest_price <- as.tibble(fread(file_path_name))
rest_price

# extract name of gu and dong 
str_loc_gu <- as.tibble(unique(rest_price$c_gu)) %>%
	select(c_gu = value)

str_loc_dong <- rest_price %>%
	group_by(c_gu, c_dong)%>%
	summarize(c_mean = mean(c_value)) %>%
	select(c_gu, c_dong)

write.csv(str_loc_gu, paste(filepath, out_name_gu, sep='/'), row.names=FALSE)
write.csv(str_loc_dong, paste(filepath, out_name_dong, sep='/'), row.names=FALSE)
