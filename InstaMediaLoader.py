import instaloader
from instaloader import Instaloader, Profile
import os

# Initialize Instaloader
L = instaloader.Instaloader()

# Selected Profile to import from
PROFILE = "nba"
profile = Profile.from_username(L.context, PROFILE) # Telling instaloader this is the profile we want data from
profilePosts = profile.get_posts()

# Specify the directory where you want to save the media files
save_dir = "/Users/ri/Documents/NBAStatsPlus/NBAStatsPlus/NBAStatsPlus/DownloadedMedia"  # Update this with your desired directory

# Change the current working directory to the save directory
os.chdir(save_dir)

# Counter to track the number of downloaded posts
downloaded_count = 0

# Iterate through the posts and download images and videos
for post in profile.get_posts():
    if downloaded_count >= 5:
        break  # Exit the loop if 5 posts have been downloaded
    
    # Check if the post is an image or video based on file extension
    if post.is_video:
        # Download the video
        L.download_post(post, PROFILE)
        print(f"Post {post.shortcode} saved at {post.url}")
        downloaded_count += 1
    elif post.typename == "GraphImage" and (post.url.endswith('.jpg') or post.url.endswith('.jpeg')):
        # Download the image
        L.download_post(post, PROFILE)
        print(f"Post {post.shortcode} saved at {post.url}")
        downloaded_count += 1

