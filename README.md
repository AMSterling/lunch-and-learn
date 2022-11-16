<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


  <h3 align="center">Lunch and Learn</h3>

  <p align="center">
    The Backend portion of a Service Oriented Architecture application to provide a frontend with API endpoints to consume
  </p>
  <br>
</div>


<!-- TABLE OF CONTENTS -->
<details>
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
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>
<br>



<!-- ABOUT THE PROJECT -->
## Learning Goals

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).
* Implementation of caching
* Implementation of basic authentication

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

[![Rails][Rails.org]][Rails-url]
[![Ruby][Ruby]][Ruby-url]
[![RSpec][RSpec]][RSpec-url]
[![Atom][Atom]][Atom-url]
[![PostgreSQL][PostgreSQL]][PostgreSQL-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

This README makes the assumption that rails is currently active on local machine.
### Installation

1. Clone the repo
   ```sh
   git clone
   https://github.com/AMSterling/lunch-and-learn
   ```
1. Install gems
   In the main body:
   ```sh
   gem 'bcrypt', '~> 3.1.7'
   gem 'faraday'
   gem 'figaro'
   gem 'jsonapi-serializer'
   ```
   In group :development, :test do

   ```sh
   gem 'pry'
   gem 'rspec-rails'
   ```
   In group :test do

   ```sh
   gem 'capybara'
   gem 'factory_bot_rails'
   gem 'faker'
   gem 'shoulda-matchers'
   gem 'simplecov'
   gem 'vcr'
   gem 'webmock'
   ```
1. Enter your API keys
   Run
   ```sh
   $ bundle exec figaro install
   ```
   File config/application.yml should be created and ignored.
   ```sh
   edamam_id: 'ENTER YOUR API'
   edamam_recipe_api: 'ENTER YOUR API'

   YouTube_API: 'ENTER YOUR API'

   Access_Key: 'ENTER YOUR API'
   Secret key: 'ENTER YOUR API'

   geoapify_key: 'ENTER YOUR API'
   ```

**Gem Documentation**

[bcrypt][bcrypt-docs]

[faraday](https://lostisland.github.io/faraday/)

[Figaro](https://github.com/laserlemon/figaro)

[jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)

[capybara](https://github.com/teamcapybara/capybara)

[factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)

[faker](https://github.com/faker-ruby/faker)

[pry](https://github.com/pry/pry)

[rspec-rails](https://github.com/rspec/rspec-rails)

[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)

[simplecov](https://github.com/simplecov-ruby/simplecov)

[vcr](https://github.com/vcr/vcr)

[webmock](https://github.com/bblimke/webmock)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

Happy path endpoints to use in Postman running a local server `rails s`

  GET recipes for a random country cuisine
  ```
  /api/v1/recipes
  ```
  or select a country
  ```
  /api/v1/recipes?country=<country of your choice as parameter>
  ```

  GET a video and pictures from a random country
  ```
  /api/v1/learning_resources
  ```
  or select a country
  ```
  /api/v1/learning_resources?country=<country of your choice as parameter>
  ```

  POST a User (name: your name, email: email@example.com, password: password, password_confirmation: password passed in body using JSON)
  ```
  /api/v1/user
  ```

  GET favorite recipes for a user passing 'api_key: <user_api_key>' as JSON in request body
  ```
  /api/v1/favorites
  ```

  DELETE a favorite from user passing 'api_key: <user_api_key>, favorite_id: <favorite.id>' as JSON in request body
  ```
  /api/v1/favorites
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Contact

Anna Marie Sterling - [LinkedIn][linkedin-url]

Project Link: [https://github.com/neb417/lunch_and_learn](https://github.com/AMSterling/lunch-and-learn)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[[contributors-shield]: https://img.shields.io/github.com/AMSterling/lunch-and-learn.svg?style=for-the-badge
[contributors-url]: https://github.com/AMSterling/lunch-and-learn/graphs/contributors
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/sterling-316a6223a/
[Rails.org]: https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org
[Atom]: https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white
[Atom-url]: https://atom.io/
[Ruby]: https://img.shields.io/badge/Ruby-000000?style=for-the-badge&logo=ruby&logoColor=CC342D
[Ruby-url]: https://www.ruby-lang.org/en/
[RSpec]: https://img.shields.io/badge/RSpec-fffcf7?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4Ij48cGF0aCBkPSJNMzIyLjM4NDE4NTgsMTQ1LjU3NTY2ODNsNjguNTQ4NjQ1LDcwLjI4NDA1NzZsLTE3LjM1NDA5NTUsMzEuNjcxMjE4OUwyNTQuMjY5MzYzNCwzOTYuNzc2MDkyNUwxMzQuOTYwMDA2NywyNTEuMDAxNzU0OGwtMTcuMzU0MDgwMi0zNS4xNDIwMjg4bDY4LjU0ODY2MDMtNzAuMjg0MDU3NkgzMjIuMzg0MTg1OHogTTMwMC4yNzUzMjk2LDM2LjAwOTgyNjdsLTI1LjY3NTQxNSwzMy45NDQ4MzE4QzM5OC4wMTA4MzM3LDgyLjAzMDUzMjgsNDcyLjA5NzI5LDIwNy45MTIxMzk5LDQzMy4wNDE5MzEyLDMxOC4zMzk0NDdsMTkuODc0ODE2OSwzOS41Mjg2ODY1bDM5LjQ5NTAyNTYtMi45ODkxNjYzQzU1Ny4zNDYxMzA0LDIwMC42MTA2NDE1LDQ1NC4zMTExNTcyLDE3LjkzMzU3NjYsMjc5LjY4MDI2NzMsMS43NTU0NzY2TDMwMC4yNzUzMjk2LDM2LjAwOTgyNjd6IE0xNy41ODYxOTg4LDM0OC42OTE4OTQ1Qy00OC41MzY1OTQ0LDE4MC4zMTU1NjcsODAuMTU4NDMyLTUuNDMyNjY5MiwyNjMuOTI0MzQ2OSwwLjc1NTQ1NDZsMjAuNjk2MDE0NCwzNC40MjIxNTczbC0yNS42MjQyMDY1LDMzLjg3NjY2MzJDMTI0LjMyMjk5OCw2Ni42NDI2OTI2LDMxLjA5Nzk1OTUsMjA1LjE3MjI3MTcsODMuMzY0Mjk2LDMyOC43OTgwMzQ3bC00Mi43NzA3NTk2LTExLjIyMTUyNzFMMTcuNTg2MTk4OCwzNDguNjkxODk0NXogTTQ4Ni4yOTQxMjg0LDM2OC4zNjY2MzgybC00MS4wNzMxNTA2LDMuMTA4NjEyMWwtMTguNjY3NTQxNS0zNy4xMjcyMjc4Yy01NC4xMDkzNDQ1LDEyNC44ODMzMDA4LTI1MC41ODg0NzA1LDE2Mi4xODEwMzAzLTMzNS45MDgyNjQyLDkuNzg3MTcwNGwtNDQuODM4ODU1Ny0xMS43NjQyMjEybC0yMi4zMDExNjA4LDMwLjE2MDAwMzdDMTI4LjAxMDc0MjIsNTc2LjQ1Mjc1ODgsNDA1LjA3OTU4OTgsNTQzLjE1MTI0NTEsNDg2LjI5NDEyODQsMzY4LjM2NjYzODJ6Ii8+PC9zdmc+
[RSpec-url]: https://rspec.info/
[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/

[bcrypt-docs]: https://github.com/bcrypt-ruby/bcrypt-ruby
