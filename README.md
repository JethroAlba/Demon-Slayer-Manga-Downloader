# Demon-Slayer-Manga-Downloader

This repository contains the script for downloading chapters of Koyoharu Gotouge's Kimetsu no Yaiba manga series. The story follows Tanjiro Kamado, a young boy who becomes a demon slayer after his family is slaughtered and his younger sister Nezuko is turned into a demon.

## This repository contains the following files:
* **KnY_black.R** - allows user to download chapters in original black & white color
* **KnY_colored.R** - allows user to download chapters in color (only available for Chapters 140 onwards) 

## Both R script contain the following functions:
* `download.image`
* `download.chapters.sep.folders`
* `download.chapters.one.folder` 


### `download.image`

This is the main function which downloads images from a specified chapter. Note that this function can only download one chapter at a time. In order to download multiple chapters, the `download.chapters.sep.folders` or `download.chapters.one.folder` must be used. 

Briefly, the download.image function loads the specified chapter number https://ww4.demonslayermanga.com website. The function then reads the lines of from the site and collects the links of all the relevant image files from the chapter. It then loops over the links and downloads each image using the `download.file()` function in R. 

### `download.chapters.sep.folders`

This function downloads the images from all the specified chapters and put them in separate folders inside the working directory. This function runs the download.image function and iterates over the specified series of chapter numbers to download the files. 

### `download.chapters.sep.folders`

This function performs the same task as the function above but puts the all the images in one folder. This is useful for stiching all images into one PDF file using a third-party application for easier reading. 

## How to use the script
1. R the script (choose between **KnY_black.R** or **KnY_colored.R**).
2. Run `download.chapters.sep.folders` or `download.chapters.sep.folders` along with the specified chapters. Example:
* `download.chapters.sep.folders(1:2)`
* `download.chapters.sep.folders(c(1:5,8)`



# A few notes
* The Kimetsu no Yaiba manga series has 205 main chapters
* The functions described above cannot download Chapters 120 and 205. The image files imbeded within these chapters are formatted differently from the rest. 
* This function is purely for research purposes only. Do not distribute or sell downloaded Chapters. 
