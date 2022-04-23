# iOS Netflix Clone

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app is a clone of an older version of the Netflix app on the Apple app store. This app is used as a movie and TV show browsing app which allows users to view trending, upcoming, and popular movies as well as TV shows with the option to download them into their local device/phone.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Entertainment
- **Mobile:** This app would be mainly developed for mobile (iOS) for now. It would be possible in the future to create a native dedicated Android version of this app and a dedicated website. It is also possible to develop to integrate fully cross-platform using Flutter.
- **Story:** Allows users to browse movies and TV shows with the ability to search up movies and TV shows as well as download them onto their local device.
- **Market:** Any individual can choose to use this app for entertainment purposes. However, the user may need to enter their age in the future as younger users should not be able to browser R-rated content for example.
- **Habit:** This app may be used as often or unoften as the user desires depending on how much free time they have to view or browse movies and TV shows.
- **Scope:** The app is created as if the user had already logged into the Netflix Clone app and is able to freely browse and use the app to their desire.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* See a random movie as the header when opening the app
* Vertically scroll down and view trending movies, TV shows, popular, upcoming, and top rated movies
* Horizontally scroll in each category of movies or TV shows
* See upcoming movies that will be released soon
* Search up movies using a search function
* Download movies that they wish to view later after a long-hold on a movie on the home page
* View movies the user has previously downloaded onto their local device
* Delete previously downloaded movies
* Tap onto movies and view the movie details page which includes a YouTube trailer of the movie, the movie title, and the overview
* Watch the YouTube trailer of the movie straight from our app

**Optional Nice-to-have Stories**

* The ability to register for an account and sign-in to the app
* Store user preferences in the user's profile settings
* Be able to see a user's profile page
* Be able to download movies from the upcoming movies and movie details page
* Be able to see the movie details pages of searched up movies

### 2. Screen Archetypes

* Home
   * See a random movie as the header when opening the app
   * Vertically scroll down and view trending movies, TV shows, popular, upcoming, and top rated movies
   * Horizontally scroll in each category of movies or TV shows
   * Download movies that they wish to view later after a long-hold on a movie on the home page
* Upcoming Movies
   * See upcoming movies that will be released soon
* Search
   * Search up movies using a search function
* Downloads
   * View movies the user has previously downloaded onto their local device
   * Delete previously downloaded movies
* Movie Details
   * Tap onto movies and view the movie details page which includes a YouTube trailer of the movie, the movie title, and the overview
   * Watch the YouTube trailer of the movie straight from our app

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Page
* Upcoming Movies
* Search
* Downloads

**Flow Navigation** (Screen to Screen)

* Tap onto a movie -> See the movie details page of that movie
* Search for a movie (>= 3 characters) -> See a collection view of movies that match the search query

## Wireframes
<img src="https://user-images.githubusercontent.com/83325543/164873214-5374dd4f-d0f4-478c-8324-1f34e3a7eb0a.JPG" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
