# This is for moving the saved media files into the XCode directory to be accessed during runtime

#!/bin/bash

# Define paths
downloadedMediaDir="/Users/ri/nba" # Downloaded Media
projectDir="/Users/ri/Documents/NBAStatsPlus/NBAStatsPlus/NBAStatsPlus" # Xcode Project Directory

# Copy downloaded media files to your Xcode project directory
cp -R "$downloadedMediaDir"/* "$projectDir/Assets.xcassets/Videos"

# Update Xcode project file
workspaceDir="$projectDirectory/NBAStatsPlus.xcworkspace"
if grep -q "Assets/Videos" "$workspaceDir/contents.xcworkspacedata"; then
    echo "Videos already added to project."
else
    sed -i '' '/ASSETCATALOG_COMPILER_APPICON_NAME/d' "$workspaceDir/contents.xcworkspacedata"
    echo "        ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;" >> "$workspaceDir/contents.xcworkspacedata"
    echo "Videos added to project."
fi