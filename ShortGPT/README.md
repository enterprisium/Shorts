### Upload Automation 

1. Authentication (client-secrets.json from Google API console)
- Head to the Google API Console at https://console.cloud.google.com/ and create a project.
- In the marketplace (search bar), find 'YouTube v3 API' and enable it.
- After redirect, click on Oauth Screen and create.
- Add google.com as the authorized domain.
- Add scopes for the YouTube v3 API.
- Add the channel's email as the test user (in most cases, the email the channel was registered with).
- Create Credentials (OAuth Client ID) in the Credentials Menu and select Web App.
- For Authorized Redirect URIs, use:
    1. http://localhost:8080
    2. http://localhost:8080/
    3. http://localhost:8090
    4. http://localhost:8090/
- Finish up with downloading the .JSON file and put it inside this repository's directory.


2. Oauth2.json (within the repo itself) 
   
- Once a valid `client_secrets.json` is present in the directory, run `python3 upload.py` and follow further instructions. After successful authentication, an `oauth2.json` file will be created inside the directory.


> Note: You can avoid quota bottlenecks by stacking up projects in the google console and repeat steps before 

3. Automation

Once valid oauth2 credentials exist in the directory you can let this run 100% on autopilot. 

- `ultra.py` is the main script to direct the video production pipeling
- `upload.py` sets the backbone for youtube's v3 api to upload to YouTube without further authentification
- `final_upload.py` combines the finsished product and uploads it to YouTube (title, description, tags get parsed automatically)

Just craft your own bash script or use `automate.sh`


### Upgrades
- access YouTube as provider of video assets, surpassing stock footage by large
- avoids bans by using download streams with PyTube
- avoids YouTube v3 API's rate limit and auth
- avoids Pexels hard rate limit 

### Features 


Inside `api_utils` functions provide utility for working with different APIs. Files: `image_api.py`, `pexels_api.py`,  `youtube_api.py` and `eleven_api.py`. We added  `youtube_api.py` to source video assets directly from YouTube. Feel free to modify `the _generateVideoUrls` function for the hierachy of video asset sources. 

-  #### `search_videos_YouTube(query_string)`
  
      The search_videos_YouTube function takes a query string as input and searches for a video on YouTube based on that query. It returns the URL of the first search result if found, or None if no video is found.
      
      Integration of `shortGPT.api_utils.youtube_api`, which serves as an additional source for gathering footage based on the queried keyword. This is particularly useful when dealing with niche / comedy / meme topics where stock footage is not available. If nothing matches we backtrack to the pexels API. 
