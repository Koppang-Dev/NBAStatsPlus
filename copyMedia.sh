# This is for moving the saved media files into the XCode directory to be accessed during runtime

#!/bin/bash

# Define paths
downloadedMediaDir="/Users/ri/nba" # Downloaded Media
projectDir="/Users/ri/Documents/NBAStatsPlus/NBAStatsPlus/NBAStatsPlus" # Xcode Project Directory

# Copy downloaded media files to your Xcode project directory
cp -R "$downloadedMediaDir"/* "$projectDir/Assets.xcassets/Videos"
