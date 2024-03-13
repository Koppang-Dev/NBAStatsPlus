import instaloader
from instaloader import Instaloader, Profile
import os

# Initialize Instaloader
L = instaloader.Instaloader()

# Specify the directory where you want to save the media files
save_dir = "/Users/ri/Documents/NBAStatsPlusGitNew/NBAStatsPlus/NBAStatsPlus/NBAStatsPlus/DownloadedMedia"

# Change the current working directory to the save directory
os.chdir(save_dir)

# Selected Profile to import from
profiles = ["nba", "nbaonespn", "basketballreach"]

for PROFILE in profiles:
    profile = Profile.from_username(L.context, PROFILE) # Telling instaloader this is the profile we want data from
    profilePosts = profile.get_posts()
    
    # Counter to track the number of downloaded posts
    downloaded_count = 0

    # Iterate through the posts and download images and videos
    for post in profile.get_posts():
        if downloaded_count >= 25:
            break  # Exit the loop if 5 posts have been downloaded
    
        # Check if the post is an image or video based on file extension
        if post.is_video:
            # Download the video
            L.download_post(post, target="MediaFolder")  # Save all videos directly into save_dir
            print("For Profile: ", PROFILE)
            downloaded_count += 1
        elif post.typename == "GraphImage" and (post.url.endswith('.jpg') or post.url.endswith('.jpeg')):
            # Download the image
            L.download_post(post, target=save_dir)  # Save all images directly into save_dir
            downloaded_count += 1


