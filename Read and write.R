graphics.off(); remove(list=ls());cat("\12")

pacman::p_load(tidyverse, fs, stringr, writexl)

#.................................Read all the data in the folder................#

file_paths<- fs::dir_ls('C:/Users/New folder/Cu') # for other material change the filepath
file_names<- list.files('C:/Users//Cu')
file_contents<- list()
for(i in seq_along(file_paths)){
  file_contents[[i]]<-read_xls(file_paths[[i]], range = "Sheet1!A7:BB2300") 
}
file_contents<-set_names(file_contents, file_paths)
length<-length(file_contents)
length
#...........................Get the sheet_Names.........................#

Name_of_the_sheet<- str_remove(file_names, "SPGlobal_Export_Copper_")
Name_of_the_sheets<- str_remove(Name_of_the_sheet, "\\.xls$")
print(Name_of_the_sheets)


#................. convert the files into data.frame...............
df1<- data.frame(file_contents[[1]])
df2<- data.frame(file_contents[[2]])
df3<- data.frame(file_contents[[3]])
df4<- data.frame(file_contents[[4]])
df5<- data.frame(file_contents[[5]])
df6<- data.frame(file_contents[[6]])
df7<- data.frame(file_contents[[7]])

colnames(df1)[1:4]<-c("Names", "Mine_id", "Commodity", "Other_commodities")
colnames(df1)[5:54]<-2040:1991
colnames(df2)[1:4]<-c("Names", "Mine_id", "Commodity", "Other_commodities")
colnames(df2)[5:54]<-2040:1991
colnames(df3)[1:4]<-c("Names", "Mine_id", "Commodity", "Other_commodities")
colnames(df3)[5:54]<-2023:1980
colnames(df4)[1:4]<-c("Names", "Mine_id", "Commodity", "Other_commodities")
colnames(df4)[5:54]<-2040:1991
colnames(df5)[1:4]<-c("Names", "Mine_id", "Commodity", "Other_commodities")
colnames(df5)[5:54]<-2040:1991
colnames(df6)[1:4]<-c("Names", "Mine_id", "Commodity", "Other_commodities")
colnames(df6)[5:54]<-2040:1991
colnames(df7)[1:4]<-c("Names", "Mine_id", "Commodity", "Other_commodities")
colnames(df7)[5:54]<-2040:1991

#....................write into new excel sheet...................#

write_path<-"C:/Users/Desktop/write/"

#this was used in data

dataset_names<-list("Sheet1"=df1, "Sheet2"=df2, "Sheet3"=df3, "sheet4"=df4,"sheet5"=df5, "sheet6"=df6,"sheet7"=df7)
write.xlsx(dataset_names, file = paste0(write_path, "cu.xlsx"))
