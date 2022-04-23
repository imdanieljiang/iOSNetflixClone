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

### Models

#### Title
   | Property       | Type   | Description |
   | -------------- | ------ | ------------|
   | id             | Int    | unique id for the title |
   | media_type     | String | media type (movie/TV show) |
   | original_name  | String | original name of media |
   | original_title | String | original title of media |
   | poster_path    | String | url path of the poster |
   | overview       | String | overview description of the media |
   | release_date   | String | release date of the media |
   | vote_count     | Int    | total number of votes for the media |
   | vote_average   | Double | rating of the votes for the media |

#### TitleViewModel
   | Property       | Type   | Description |
   | -------------- | ------ | ------------|
   | titleName      | String | name of the media |
   | posterURL      | String | url path of the media poster |

#### TitlePreviewViewModel
   | Property       | Type         | Description |
   | -------------- | ------------ | ------------|
   | title          | String       | title of the media |
   | youtubeView    | VideoElement | the element of the youtube video |
   | titleOverview  | String       | overview of the media |

#### VideoElement
   | Property       | Type           | Description |
   | -------------- | -------------- | ------------|
   | id             | IDVideoElement | unique id of the video element |

#### IDVideoElement
   | Property       | Type   | Description |
   | -------------- | ------ | ------------|
   | videoId        | String | id of the video |
   | kind           | String | what kind of media it is |

### Networking
#### All existing networking uses existing API endpoints (TheMovieDB API, Google/YouTube API)
   - Home
      - (Read/GET) Get a random movie to display
        ```swift
        private func configureHeroHeaderView() {
        
           APICaller.shared.getTrendingMovies { [weak self] result in
               switch result {
               case .success(let titles):
                   let selectedTitle = titles.randomElement()
                   self?.randomTrendingMovie = selectedTitle
                   self?.headerView?.configure(with: TitleViewModel(titleName: selectedTitle?.original_title ?? "", posterURL: selectedTitle?.poster_path ?? ""))
                
               case .failure(let error):
                   print(error)
               }
           }
        }
        ```
      - (Read/GET) Query the trending movies
        ```swift
        func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
            
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))
               }
               catch {
                   completion(.failure(APIError.failedToGetData))
               }
           }
         
           task.resume()
        }
        ```
      - (Read/GET) Query the trending TV shows
        ```swift
        func getTrendingTVs(completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
            
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))
               }
               catch {
                   completion(.failure(APIError.failedToGetData))
               }
           }
        
           task.resume()
        }
        ```
      - (Read/GET) Query the popular movies
        ```swift
        func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
            
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))
               }
               catch {
                   completion(.failure(APIError.failedToGetData))
               }
           }
        
           task.resume()
        }
        ```
      - (Read/GET) Query the upcoming movies
        ```swift
        func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
            
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))
               }
               catch {
                   completion(.failure(APIError.failedToGetData))
               }
           }
        
           task.resume()
        }
        ```
      - (Read/GET) Query the top rated movies
        ```swift
        func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
            
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))
               }
               catch {
                   completion(.failure(APIError.failedToGetData))
               }
           }
        
           task.resume()
        }
        ```
   - Upcoming
      - (Read/GET) Query the upcoming movies
        ```swift
        func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
            
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))
               }
               catch {
                   completion(.failure(APIError.failedToGetData))
               }
           }
        
           task.resume()
        }
        ```
   - Search
      - (Read/GET) Query all the movies matching the user's custom media query
         ```swift
         func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
           guard let url = URL(string: "\(Constants.BASE_URL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else { return }
        
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
            
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))
               }
               catch {
                   completion(.failure(APIError.failedToGetData))
               }
           }
        
           task.resume()
         }
         ```
   - Download
      - No network requests
   - Movie Details
      - (Read/GET) Queries YouTube for the trailer video
        ```swift
        func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        
           guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
           guard let url = URL(string: "\(Constants.YOUTUBEBASE_URL)q=\(query)&key=\(Constants.YOUTUBEAPI_KEY)") else { return }
        
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
            
               do {
                   let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                   completion(.success(results.items[0]))
               }
               catch {
                   completion(.failure(error))
                   print(error)
               }
           }
        
           task.resume()
        }
        ```
      - (Read/GET) Queries the movie database for the title and overview
        ```swift
        func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
           guard let url = URL(string: "\(Constants.BASE_URL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else { return }
           let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
               
               do {
                   let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                   completion(.success(results.results))
               }
               catch {
                   completion(.failure(APIError.failedToGetData))
               }
           }
        
           task.resume()
        }
        ```
