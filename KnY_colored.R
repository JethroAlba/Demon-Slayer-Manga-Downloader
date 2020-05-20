

download.image<-function(chapter){
  
  require(stringr)
  require(qdapRegex)
  
  base_url<-"https://ww4.demonslayermanga.com/chapter/kimetsu-no-yaiba-digital-colored-comics-chapter-"
  
  
  to_read<-str_c(base_url,chapter)
  sourceCode<-readLines(to_read)
  
  location <- grep("https://cdn.read7deadlysins.com/file/AnimeRleases/",sourceCode)
  
  filler<-vector()
  
  for (x in seq_along(location)){
    a<-sourceCode[location[x]]
    filler<-c(filler,a)
  }
  
  links <- vector()
  for (i in filler){
    select <- rm_between(i, 'h', 'g', extract=TRUE)
    links <- c(links,select[[1]][1])
  }
  links<-str_c("h",links,"g")
fname.x <- gsub(".*/(.*)", "\\1", links)
  
  for (i in seq_along(links)){
    download.file(links[i], dest = fname.x[i], mode="wb")
  }
}


# Separate folders  

download.chapters.sep.folders<-function(num){
  
  for (x in num){
    dir.create(as.character(x))
    setwd(as.character(x))
    
    download.image(x)
    setwd("..")
  }
}


#All in one folder


download.chapters.one.folder<-function(num){
  require(stringr)
  
  name<-str_c("DS chapter ",num[1],"-",tail(num,1), sep = "")
  dir.create(name)
  setwd(name)
  for (x in num){
    
    download.image(x)
    
  }
  setwd("..")
  
}

