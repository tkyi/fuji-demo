# Fuji Demo Meow

A simple demo app that shows Flickr images of Mount Fuji in a slideshow. This app uses the Flickr API and Nodejs to display images from Flickr based on a keyword. It will also cover setting up a Continuous Integration/Continuous Delivery pipeline using [Screwdriver](http://screwdriver.cd) and Heroku.

## Prerequisites
- [Github](https://github.com) account
- [Heroku](https://www.heroku.com) account

## 1. Fork and clone the repository
Click on the Fork button on the top right of the [repository](https://github.com/screwdriver-cd/fuji-demo).

## 2. Set up your Screwdriver pipeline
In order to use Screwdriver, you will need to login to Screwdriver using Github and set up your pipeline.

#### 1. Create a Screwdriver pipeline

1. Go to the [Screwdriver UI](https://cd.screwdriver.cd).

2. Click on the Create icon (you will be redirected to login if you have not already).

  - Click Login with SCM Provider.
  - You will be asked to give Screwdriver access to your repositories. Choose appropriately and click Authorize.

4. Enter your repository link into the field. SSH or HTTPS link is fine, with #<YOUR_BRANCH_NAME> immediately after (ex: `git@github.com:{YOUR_GITHUB_USERNAME}/fuji-demo.git`). Click `Use this repository` to confirm and then click Create Pipeline. Make note of your pipeline ID.

#### 2. Get Heroku Secrets
In order to add the secrets needed for this app to deploy, you will need your Heroku API key and a Heroku app name.

##### Heroku API key
Navigate to your [Heroku Account settings page](https://dashboard.heroku.com/account). Find your API Key and click Reveal. Copy this displayed value.

##### Heroku application name
Navigate to the [Heroku Apps page](https://dashboard.heroku.com/apps). Click `New` in the top right corner and select Create New App. Copy your new application name.

### 3. Add secrets to Screwdriver
Screwdriver has a built in UI for adding secrets as protected environment variables in your build.

Navigate to the Screwdriver Secrets tab at `https://cd.screwdriver.cd/pipelines/{YOUR_PIPELINE_ID}/secrets`.
- Add `HEROKU_API_KEY` as the key with your Heroku API key as the value. You do not need to `Allow in PR`.
- Add `HEROKU_APP` as the key with your Heroku application name as the value. You do not need to `Allow in PR`.

### 4. Start your build
Now that you've added the proper secrets, navigate to your Builds page at `https://cd.screwdriver.cd/pipelines/{YOUR_PIPELINE_ID}` and click `Start` in the upper right corner to start a build. When it's done, refresh the page and click on `Next Job` to follow the logs for the Publish job.

### 5. View your app!
You should be able to see your deployed application after the build is done running at `https://{YOUR_HEROKU_APP}.herokuapp.com/`. To see Heroku logs for your Heroku deployment, navigate to the Heroku Activity page at `https://dashboard.heroku.com/apps/{YOUR_HEROKU_APP}/activity`. Click `View build log` under your latest deployment.

### Next steps
Make a change to your code and push it to your branch. Screwdriver will detect the code change and automatically trigger a new build, causing your code change to go all the way to production!

#### Ex: Change the Flickr tag
Change the `tag` in line 5 of `./lib/photos.js` from `mount fuji` to another monument. Push your changes to Github and navigate to your Screwdriver pipeline to see the change get deployed.

## Local development
To setup:
```bash
$ git clone git@github.com:screwdriver-cd/fuji-demo.git
$ cd fuji-demo/
$ npm install
$ npm test      # to test locally
$ npm start     # to start locally
```
Navigate to http://localhost:7000 to see the app.
