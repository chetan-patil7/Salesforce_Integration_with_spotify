# Salesforce Spotify Integration

This project integrates Salesforce with the Spotify API to retrieve artist information using OAuth 2.0 authentication. It consists of an Apex class that handles the API calls and a Lightning Web Component (LWC) that provides a user interface for input and output.

## Features

- Retrieve Spotify artist information using the artist's ID.
- Authenticate with Spotify using client credentials.
- Display artist details in a user-friendly interface.

## Prerequisites

- Salesforce Developer Account
- Salesforce CLI
- Visual Studio Code (VSCode) with Salesforce Extension Pack
- Spotify Developer Account to obtain client credentials

## Setup Instructions

### Step 1: Create a Spotify Developer Account

1. Go to [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/).
2. Log in or create a new account.
3. Create a new application to obtain your `Client ID` and `Client Secret`.

### Step 2: Create a Remote Site Setting in Salesforce

1. Go to Salesforce Setup.
2. In the Quick Find box, search for **Remote Site Settings**.
3. Click **New Remote Site**.
4. Enter the following details:
   - **Remote Site Name**: Spotify
   - **Remote Site URL**: `https://api.spotify.com`
5. Save the settings.

### Step 3: Implement the Apex Class

1. Open your Salesforce project in VSCode.
2. Create a new Apex class called [`SpotifyService`](force-app/main/default/classes/SpotifyService.cls):
