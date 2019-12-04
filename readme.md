# ProfitTrailer front-end 

Remember to update version number on each Pull Request to Master /templates/includes/version.ftl

## Description
This repository contains the required contents of the ```ext-resources``` folder, needed for setting up the development environment to work on ProfitTrailer front-end code.

## Branches
The ```master/PTFrontend``` branch will always reflect the most up to date front-end code that is ready to be/has been merged with the 
[```master/profittrailer/src/main/resources/```](https://github.com/profittrailerbv/profittrailer/tree/master/src/main/resources) pathway of the main [```master/profittrailer```](https://github.com/profittrailerbv/profittrailer) repository.
### MASTER branch is the MASTER! (obvious reminder that master is not your dev branch)
#### Do not be afraid to make a branch. 
This is a code tree, trees have branches. So, make your own branch, or adopt a branch. 
Use all of githubs features to name and describe what that branch is for. 
Work on that branch. 
Only push commits to a branch. 
Remember to rebase with master. 
When your code isn't broken and also doesnt break other code: Pull Request. 
We must merge as a team =) So let's keep the repo clean, and mind your working branch. 


## Implementation Instructions
### Environment Setup - Starting from scratch
#### This assumes you are working from a terminal with git installed :-P
Download the latest PT release from github, and extract the .zip file.
Enter the root folder or your newly extracted PT install, and type:
```
git clone git@github.com:profittrailerbv/PTBootmix.git ext-resources
```
This command will clone the working master repository of PTFrontend in to a folder named ```ext-resources```.
Start (or restart) ProfitTrailer. The web code in the ```ext-resources``` folder is now activated and being used by your bot.
Write code.

## installation Instructions

#### Go to development files
```
cd developement
```

#### Install dependencies
```
yarn OR npm install
```

#### Run the compiler
```
yarn run watch OR npm run watch
```

All compiled files from the development folder will be located inside the static/ folder.

#### Run for production
```
yarn run production OR npm run production
```