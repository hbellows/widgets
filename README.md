<!-- [![ruby](https://img.shields.io/badge/ruby-v2.4.1-red.svg)](https://www.ruby-lang.org/en/)
[![rails](https://img.shields.io/badge/rails-v5.2.2-orange.svg)](https://rubyonrails.org/) -->
[![CircleCI](https://circleci.com/gh/hbellows/smooth_move.svg?style=svg)](https://circleci.com/gh/hbellows/smooth_move)
[![Maintainability](https://api.codeclimate.com/v1/badges/62d8a795fc71cc751823/maintainability)](https://codeclimate.com/github/hbellows/smooth_move/maintainability)
[![codecov.io](https://codecov.io/gh/hbellows/smooth_move/branch/master/graph/badge.svg)](https://codecov.io/gh/hbellows/smooth_move)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/hbellows/smooth_move/master.svg)

# Smooth Move


## Table of Contents

* [Description/Purpose](#descriptionpurpose)
* [System Requirements](#system-requirements)
* [Initial Setup](#initial-setup)
* [Running Tests](#running-tests)
* [Dependencies](#dependencies)
* [Screenshots](#screenshots)
    * [Home Page](#home-page)
    * [User Dashboard](#user-dashboard)
* [How To Contribute](#how-to-contribute)
* [Contributors/Developers](#contributorsdevelopers)

## Description/Purpose
This application was developed for the final project assignment for Turing School's Backend Engineering Program.  More information about this assignment can be found [here](http://backend.turing.io/module4/projects/take_home_challenge/take_home_challenge_spec).

The specfic assignment required the student to build a fullstack application according to the following specification:
```
Create a tool that people who are considering moving can get some data points on for a prospective city:

- What is the cost of living?
- What is the population? 
- At least 2 more considerations, from the following or based on your own ideas:
    - What is the walkability score? Bike-ability score?
    - Proximity to airport
    - Cost of vehicle registration
    - Cost of gas

- Users should be able to "favorite" and "eliminate" cities, and see their master list of favorites. If they re-search for an eliminated city, they should still be able to access the data but should receive a friendly reminder that they eliminated it. Consider how you will make sure all of the numbers are put into perspective for your user, so that they all have meaning. 
This API should help you get started - https://public.opendatasoft.com/explore/dataset/1000-largest-us-cities-by-population-with-geographic-coordinates/api
```


## System Requirements
 - Ruby >= 2.5.1
 - Rails >= 5.2.2


## Initial Setup
1. Clone or fork this project to your local machine.
2. Run `bundle` in the project folder.
3. Run `figaro install` in the project folder.
4. Run `rails db:{create,migrate,seed}` in the project folder.
5. To use the application locally, run `rails s` and navigate to `http:localhost:3000`
6. Or, use go [here]() to see the application live

## Running Tests
Run `rspec` to run the full test suite, or `rails server` to load up the application.
## Dependencies

 ### All Environments
 - [Rails](https://guides.rubyonrails.org/)
 - [Postgresql](https://www.postgresql.org/)
 - [Puma](https://github.com/puma/puma)
 - [Bootsnap](https://github.com/Shopify/bootsnap)
 - [Faraday](https://github.com/lostisland/faraday)
 - [Figaro](https://github.com/laserlemon/figaro)
 - [Fast_jsonapi](https://github.com/Netflix/fast_jsonapi)
 ### Development
 - [Rspec for Rails](https://github.com/rspec/rspec-rails)
 - [Factory Bot for Rails](https://github.com/thoughtbot/factory_bot_rails)
 - [Pry for Rails](https://github.com/rweng/pry-rails)
 - [Awesome Print](https://github.com/awesome-print/awesome_print)
 - [Fuubar](https://github.com/thekompanee/fuubar)
 ### Test
 - [VCR](https://github.com/vcr/vcr)
 - [Webmock](https://github.com/bblimke/webmock)
 - [Capybara](https://github.com/teamcapybara/capybara)
 - [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
 - [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
 - [Simplecov](https://github.com/colszowka/simplecov)
  

# How to Contribute
GitWired is an open source project. We invite your participation through issues and pull requests! 

When adding or changing a service please add tests.

Issues needing additional support:
- Desperately needs styling love!

## Screenshots

### Home Page

<img src="./screenshots/home_view.png">


### User Dashboard

<img src="./screenshots/user_dashboard.png">

## Known Issues
There are no known issues at this time.