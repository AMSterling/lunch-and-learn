<a name="readme-top"></a>
  
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<br>

<div align="center">

# Lunch and Learn

[![Rails][Rails]][Rails-url] [![Ruby][Ruby]][Ruby-url] [![RSpec][RSpec]][RSpec-url] [![Atom][Atom]][Atom-url] [![PostgreSQL][PostgreSQL]][PostgreSQL-url] [![Postman][Postman]][Postman-url]
  
</div>

## Description

Backend SOA application to search for cuisines by country and provide opportunity to learn more about that country

<br>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#architecture">Architecture</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#gem-documentation">Gem Documentation</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>
<br>

<!-- Architecture -->
## Architecture

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.

Ruby:
  ```sh
  rbenv install 2.7.4
  ```
Rails:
  ```sh
  gem install rails --version 5.2.8
  ```
API Keys:
Lunch and Learn uses <a href="https://developer.edamam.com/edamam-recipe-api" target="_blank" rel="noopener noreferrer">Edamam API</a>, <a href="https://developers.google.com/youtube/v3/getting-started" target="_blank" rel="noopener noreferrer">YouTube API</a>, and <a href="https://www.geoapify.com/get-started-with-maps-api" rel="noopener noreferrer">Geoapify API</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
  
### Installation

Instructions to set up a local version of Lunch and Learn:

Fork and clone the project, then install the required gems with `bundle`. A full list of gems that will be installed can be found in the [gemfile](gemfile).

```sh
bundle install
```

Reset the database:

```sh
rake db:{drop,create,migrate}
```

Run:
   
```sh
bundle exec figaro install
```

In config/application.yml add API keys:
   
```sh
edamam_id: 'YOUR EDAMAM ID'
edamam_recipe_api: 'YOUR EDAMAM KEY'

YouTube_API: 'YOUR YOUTUBE KEY'

Access_Key: 'YOUR YOUTUBE ACCESS KEY'
Secret key: 'YOUR YOUTUBE SECRET KEY'

geoapify_key: 'YOUR GEOAPIFY KEY'
```

Push to your preferred production server or in your terminal run 
 ```sh 
  rails server
 ``` 
Then open [http://localhost:3000](http://localhost:3000) in your browser.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Gem Documentation

* [bcrypt][bcrypt-docs]
* [capybara][capybara-docs]
* [factory_bot_rails][factory_bot_rails-docs]
* [faker][faker-docs]
* [faraday][faraday-docs]
* [figaro][figaro-docs]
* [jsonapi-serializer][jsonapi-serializer-docs]
* [pry][pry-docs]
* [rspec-rails][rspec-rails-docs]
* [shoulda-matchers][shoulda-matchers-docs]
* [simplecov][simplecov-docs]
* [vcr][vcr-docs]
* [webmock][webmock-docs]

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

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Contact

Anna Marie Sterling - [LinkedIn][linkedin-url]

Project Link: [https://github.com/AMSterling/lunch-and-learn](https://github.com/AMSterling/lunch-and-learn)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/AMSterling/lunch-and-learn.svg?style=for-the-badge
[contributors-url]: https://github.com/AMSterling/lunch-and-learn/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AMSterling/lunch-and-learn.svg?style=for-the-badge
[forks-url]: https://github.com/AMSterling/lunch-and-learn/network/members
[stars-shield]: https://img.shields.io/github/stars/AMSterling/lunch-and-learn.svg?style=for-the-badge
[stars-url]: https://github.com/AMSterling/lunch-and-learn/stargazers
[issues-shield]: https://img.shields.io/github/issues/AMSterling/lunch-and-learn.svg?style=for-the-badge
[issues-url]: https://github.com/AMSterling/lunch-and-learn/issues
[license-shield]: https://img.shields.io/github/license/AMSterling/lunch-and-learn.svg?style=for-the-badge
[license-url]: https://github.com/AMSterling/lunch-and-learn/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/sterling-316a6223a/

[Atom]: https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white
[Atom-url]: https://atom.io/

[Bootstrap]: https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com/

[CircleCI]: https://img.shields.io/badge/circle%20ci-%23161616.svg?style=for-the-badge&logo=circleci&logoColor=white
[CircleCI-url]: https://circleci.com/developer

[CSS]: https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white
[CSS-url]: https://en.wikipedia.org/wiki/CSS

[Fly]: https://custom-icon-badges.demolab.com/badge/Fly-DCDCDC?style=for-the-badge&logo=fly-io
[Fly-url]: https://fly.io/

[GitHub Badge]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[GitHub-url]: https://github.com/<Username>/

[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://www.heroku.com/

[HTML5]: https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white
[HTML5-url]: https://en.wikipedia.org/wiki/HTML5

[JavaScript]: https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E
[JavaScript-url]: https://www.javascript.com/

[jQuery]: https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white
[jQuery-url]: https://github.com/rails/jquery-rails

[LinkedIn Badge]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[LinkedIn-url]: https://www.linkedin.com/in/<Username>/

[Miro]: https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white
[Miro-url]: https://miro.com/

[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/

[Postman]: https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white
[Postman-url]: https://web.postman.co/

[Rails]: https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/

[RSpec]: https://custom-icon-badges.demolab.com/badge/RSpec-fffcf7?style=for-the-badge&logo=rspec
[RSpec-url]: https://rspec.info/

[RuboCop]: https://img.shields.io/badge/RuboCop-000?logo=rubocop&logoColor=fff&style=for-the-badge
[RuboCop-url]: https://docs.rubocop.org/rubocop-rails/index.html

[Ruby]: https://img.shields.io/badge/Ruby-000000?style=for-the-badge&logo=ruby&logoColor=CC342D
[Ruby-url]: https://www.ruby-lang.org/en/

[Visual Studio Code]: https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white
[Visual Studio Code-url]: https://code.visualstudio.com/

[bcrypt-docs]: https://github.com/bcrypt-ruby/bcrypt-ruby
[capybara-docs]: https://github.com/teamcapybara/capybara
[factory_bot_rails-docs]: https://github.com/thoughtbot/factory_bot_rails
[faker-docs]: https://github.com/faker-ruby/faker
[faraday-docs]: https://lostisland.github.io/faraday/
[figaro-docs]: https://github.com/laserlemon/figaro
[jsonapi-serializer-docs]: https://github.com/jsonapi-serializer/jsonapi-serializer
[launchy-docs]: https://www.rubydoc.info/gems/launchy/2.2.0
[omniauth-google-oauth2-docs]: https://github.com/zquestz/omniauth-google-oauth2
[orderly-docs]: https://github.com/jmondo/orderly
[pry-docs]: https://github.com/pry/pry
[rspec-rails-docs]: https://github.com/rspec/rspec-rails
[shoulda-matchers-docs]: https://github.com/thoughtbot/shoulda-matchers
[simplecov-docs]: https://github.com/simplecov-ruby/simplecov
[vcr-docs]: https://github.com/vcr/vcr
[webmock-docs]: https://github.com/bblimke/webmock
