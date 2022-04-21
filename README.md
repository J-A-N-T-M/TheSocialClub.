# TheSocialClub.

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
A social networking application that draws up a feed that is populated based on a user's interest and where one can join others in groups that share the same interests. 
### App Evaluation
- **Category:** Social Networking(location, camera, notifications, etc.)
- **Mobile:** Location, camera, notifications, etc.
- **Story:** Truly personalized experience
- **Market:** Mainly young adults(18-35) stepping into a new space (new job, college, etc.) and trying to connect with others
- **Habit:** Users would be inclined to use the app frequently, especially since it's catered to their specific interests and they can post as well
- **Scope:** It is challenging because this social media app is unlike any other, however it is still a social media app so we will still be able to implement the concepts that we've learned in class.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User can login
- [x] User can create account
- [x] User can logout
- [x] User can search/follow interests/other accounts
- [x] User can create/join groups
- [x] User can post
- [x] User can view posts
- [ ] User can see their own profile
- [ ] User can update account information/settings

**Optional Nice-to-have Stories**

* User can upload pictures and videos 
* User can see other user's locations (if enabled) on a map to see if there are users around them with the same interests
* Real time location

### 2. Screen Archetypes

* Login Screen
   * User can login/logout
   
* Account Creation Screen
   * User can create an account

* Home Screen
   * User can post
   * User can create/join groups 

* Search Screen
   * User can search/follow interests/other accounts

* User Profile Screen
   * User can see their own profile 

* Account Settings Screen
   * User update account information/settings

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Search
* Profile
* Settings

**Flow Navigation** (Screen to Screen)

* Login Screen
   * => Account Creation Screen
   * => Home screen
* Account Creation Screen
   * => Home Page
* Home Page
   * => Account Settings Screen
   * => Search Screen
   * => Profile Screen
* Search Screen
   * => Home Screen
   * => Account Settings Screen 
   * => Profile Screen
* Profile Screen
   * => Home Screen
   * => Account Settings Screen
   * => Search Screen
* Account Settings Screen
   * => Login Screen
   * => Home Screen
   * => Search Screen 
   * => Profile Screen
 

## Wireframes
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups
<img width="600" alt="MAD WIRE" src="https://user-images.githubusercontent.com/70228981/159394224-e5e4a58f-ba79-4f7b-a434-cb1e0d89868b.png">

### [BONUS] Interactive Prototype
Link to Interactive Prototype - ![TSC](https://user-images.githubusercontent.com/70228981/159395266-873adbbd-83be-4da2-b802-ad029cc00e6d.gif)

# Schema 
### Models
***Group***
Property | Type | Descripition
---| --- | ---
groupId | String | Unique ID for each group
messageId | String | Unique ID for each message
user | Pointer to User | Current user profile
message| String | Message created by user 
image | File | (optional) Image attached to message 
sentAt | DateTime | Time a which the message is sent
createdAt | DateTime | Time at which the group is created
profilePicture | File | Picture of user

***Profile***
Property | Type | Descripition
---| --- | ---
profilePicture | File | picture of user
user | Pointer to User | current user profile

### Networking
1. Login Screen 
  - (Read/GET) Obtaining user information

2. Sign up screen 
  - (Post) Creating a new profile 

3. Home Screen
 - (Read/GET) Query all posts where user is author
let query = PFQuery(className:"Post")
query.whereKey("author", equalTo: currentUser)
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
   if let error = error {
      print(error.localizedDescription)
   } else if let posts = posts {
      print("Successfully retrieved \(posts.count) posts.")
      // TODO: Do something with posts...
   }
}
 - (Create/POST) Create a new like on a post
 - (Delete) Delete existing like
 - (Create/POST) Create a new comment on a post 

4. Profile 
 - (Read/GET) Query logged in user object
 - (Update/PUT) Update user profile image

5. Search
 - (READ/GET) Searching posts based on search criteria 

6. Settings
 - (Post) Creating a new password or email


SPRINT 1 GIF

![ezgif com-gif-maker](https://user-images.githubusercontent.com/52511733/162008492-76c47787-8520-4ea7-bafc-c3edbb69e3ef.gif)


SPRINT 2 GIF

![Post Gif](https://user-images.githubusercontent.com/70228981/163034941-f580bbbe-2f82-47e1-89b3-9822dfd47c24.gif)

SPRINT 3 GIF

![ezgif com-gif-maker (10)](https://user-images.githubusercontent.com/94195907/164368327-ad63b241-4583-45be-bd0e-cb06a6cfd156.gif)
