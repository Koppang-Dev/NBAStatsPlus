
# Importing Instaloader
import instaloader
from instaloader import Instaloader, Profile
L = instaloader.Instaloader() # Initalizing instance
import schedule
import time


def download_posts():
    # Selected Profile to import from
    PROFILE = "nba"
    profile = Profile.from_username(L.context, PROFILE) # Telling instaloader this is the profile we want data from
    profilePosts = profile.get_posts()

    #Counter to track the number of downloaded posts
    downloaded_count = 0

    # Iterate through the posts and download them
    for post in profile.get_posts():
        if downloaded_count >= 5:
            break  # Exit the loop if 5 posts have been downloaded
        L.download_post(post, PROFILE)
        print(f"Post {post.shortcode} saved at {post.url}")
        downloaded_count += 1

    # Schedule the function to run every hour
    schedule.every().hour.do(download_posts)
    
    # Infinite loop to keep the script running
    while True:
    schedule.run_pending()
    time.sleep(1) # Sleeping for one second
