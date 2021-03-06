<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

[![CircleCI][circleci-shield]][circleci-url]

# Garden Party Backend API

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#graphql-endpoint">GraphQL Endpoint</a></li>
    <li><a href="#rest-endpoints">ReST Endpoints</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

[Garden Party](https://frontend-ui-gardenparty.vercel.app/) is a social application that allows home gardeners to share their surplus harvest with their communities. A user is able to create a post with images and edit their profile. It is composed of a backend application built using Ruby on Rails and GraphQL and a frontend React application.

The bulk of this project was designed and built by a team of five engineers in under two weeks while attending [Turing School of Software and Design](https://turing.io). This backend API uses [CircleCI](https://circleci.com) for continuous integration and is hosted on [Heroku](https://garden-party-veg.herokuapp.com). The frontend repository can be found [here](https://github.com/veg-share/frontend-ui). 



This project features:

* Exposing a GraphQL endpoint
* Exposing RESTful endpoints for uploading images
* Active Storage 
* Amazon Web Services S3 Buckets
* Testing API exposure with RSpec and Postman
* Composing advanced ActiveRecord queries to analyze information stored in PostgreSQL database
* Write SQL statements without the assistance of an ORM
* Implement json:api standards
* Add custom error responses for invalid API requests


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [GraphQL](https://graphql.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Postman](https://www.postman.com/)
* [Amazon Web Services](https://aws.amazon.com/)

<!-- GETTING STARTED -->
## Getting Started

1. Clone this repo
2. Install gem packages: `bundle`
3. Setup the database. A pgdump is included in `./db` to seed the database

    `rails db:{create,migrate,seed}`
    
4. Run the RSpec test suite: `bundle exec rspec`
5. Start your local server: `rails s`

### Prerequisites

* Ruby 2.5.3
* Rails 5.2.4

<!-- USAGE EXAMPLES -->
## GraphQL Endpoint
```
POST http://localhost:3000/graphql
```
The following is documentation for the exposed GraphQL schema.
### Users:
User Type Fields: id, username, passwordDigest, city, zipCode, state, posts, createdAt, updatedAt<br><br>
### User Queries:
**getAllUsers:** returns all users<br><br>
**getOneUser:** returns one user from an id<br>
	Arguments:<br>
		id (required)<br><br>
### User Mutations:
**updateUser:** updates a user???s info specified by id <br>
	Arguments:<br>
		id (required),<br>
		username, city, state, zipCode (optional)<br><br>
**createUser:** creates a user with specified information<br>
	Arguments: <br>
		Username, city, state, zipCode, password, passwordConfirmation (required)<br>
**deleteUser:** deletes the specified user<br><br>
	Arguments:<br>
		id (required)<br><br>

### Posts:
Post Type Fields: id, userId, tags, title, description, createdAt, updatedAt<br><br>
### Post Queries:
**getAllPosts:** returns all posts<br><br>
**getOnePost:** returns one post from an id<br>
	Arguments:<br>
		id (required)<br><br>
### Post Mutations:
**updatePost:** updates a post???s info specified by id <br>
	Arguments:<br>
		id (required),<br>
		title, description (optional)<br><br>
**createPost:** creates a post with specified information<br>
	Arguments: <br>
		userId, tags, title, description (required)<br><br>
**deletePost:** deletes the specified post<br>
	Arguments:<br>
		id (required)<br>


## REST Endpoints
All image upload functionality is handled through RESTful endpoints.

### Upload User Avatar
Required parameters: user id and an image file.

```
PUT http://localhost:3000/api/v1/users/:id
```

Below is an example of the response body format for a successful upload:
```
{
    "success": {
        "message": "Avatar updated"
    }
}
```
Unsuccessful response:
```
{
    "error": {
        "message": "Avatar not updated"
    }
}
```

### Upload a Post's Image
Required parameters: post id and an image file.

```
PUT http://localhost:3000/api/v1/posts/:id
```

Below is an example of the response body format for a successful upload:
```
{
    "success": {
        "message": "Image updated"
    }
}
```
Unsuccessful response:
```
{
    "error": {
        "message": "Avatar not updated"
    }
}
```


<!-- CONTACT -->
## Contact

Grayson Myers - [LinkedIn](https://www.linkedin.com/in/grayson-myers-285926165/)

Aiden Mendez ??? [LinkedIn](https://linkedin.com/in/aidenmendez)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-url]: https://linkedin.com/in/aiden-mendez
[circleci-shield]: https://circleci.com/gh/veg-share/backend-api.svg?style=svg
[circleci-url]: https://app.circleci.com/pipelines/github/veg-share/backend-api
[contributors-shield]: https://img.shields.io/github/contributors/veg-share/backend-api.svg?style=for-the-badge
[contributors-url]: https://github.com/veg-share/backend-api/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/veg-share/backend-api.svg?style=for-the-badge
[forks-url]: https://github.com/veg-share/backend-api/network/members
[stars-shield]: https://img.shields.io/github/stars/veg-share/backend-api.svg?style=for-the-badge
[stars-url]: https://github.com/veg-share/backend-api/stargazers
[issues-shield]: https://img.shields.io/github/issues/veg-share/backend-api.svg?style=for-the-badge
[issues-url]: https://github.com/veg-share/backend-api/issues
