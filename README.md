[![ruby](https://img.shields.io/badge/ruby-v2.5.1-red.svg)](https://www.ruby-lang.org/en/)
[![rails](https://img.shields.io/badge/rails-v5.2.2-orange.svg)](https://rubyonrails.org/)
[![CircleCI](https://circleci.com/gh/hbellows/widgets.svg?style=svg)](https://circleci.com/gh/hbellows/widgets)
[![Maintainability](https://api.codeclimate.com/v1/badges/62d8a795fc71cc751823/maintainability)](https://codeclimate.com/github/hbellows/widgets/maintainability)
[![codecov.io](https://codecov.io/gh/hbellows/widgets/branch/master/graph/badge.svg)](https://codecov.io/gh/hbellows/widgets)

# READ ME


## Table of Contents

* [Description/Purpose](#descriptionpurpose)
* [System Requirements](#system-requirements)
* [Initial Setup](#initial-setup)
* [Running Tests](#running-tests)
* [Known Issues](#known-issues)
* [Dependencies](#dependencies)
* [Screenshots](#screenshots)
    * [Home](#home)
    * [Widget by User](#widget-by-user)
    * [User Dashboard](#user-dashboard)
* [How To Contribute](#how-to-contribute)
* [Contributors/Developers](#contributorsdevelopers)

## Description/Purpose

This is a small rails application that allows users to view a collection of widgets.  An unregistered or logged out user can see a page listing all of the widgets in the collection, inlcuding a link to the user who created it.  If an unregistered/logged out user clicks on the widget creator's name, they will be taken a page that show's that user's detail, along with a listing of all the widgets that user created.

An unregistered user may also register with the web app in order to login to an account.

A logged in user can view their own dashboard.  A user's dashboard will have a listing of their widgets.  A logged in user can create new widgets, delete existing widgets, see more details about a specific widget, and edit a widget.  

A registered user may update or reset a forgotten password from the log in screen.

Track the progress of this application [here](https://github.com/hbellows/widgets/projects/1).

## System Requirements
 - Ruby >= 2.5.1
 - Rails >= 5.2.2
## Initial Setup
1. Clone or fork this project to your local machine.
2. Run `bundle` in the project folder.
3. Run `figaro install` in the project folder.
4. Add the following API keys to config/application.yml with the variable names exactly as shown:
    - `API_CLIENT_ID`
    - `API_CLIENT_SECRET`
5. Run `rails db:{create,migrate,seed}` in the project folder.
6. To use the application locally, run `rails s` and navigate to `http:localhost:3000`
7. Or, use go [here](https://widgets-app.herokuapp.com/) to see the application live
## Running Tests
Run `rspec` to run the full test suite, or `rails s` to load up the application locally.

## Known Issues
 - Flash alerts and notices are static. The should probably actually flash! And, ideally, be red or green according to the success or failure of the action.
 - Oauth has not yet been implemented.
 - New Widget link should appear on main nav bar, and when a unregistered/unlogged in user clicks the link, a modal should appear with sign up/sign in forms

## Dependencies
 ### All Environments
 - [Rails](https://guides.rubyonrails.org/)
 - [Postgresql](https://www.postgresql.org/)
 - [Faraday](https://github.com/lostisland/faraday)
 - [Figaro](https://github.com/laserlemon/figaro)
 - [Bootstrap 4](https://getbootstrap.com/docs/4.0/getting-started/introduction/)
 - [Bcrypt](https://github.com/codahale/bcrypt-ruby)

 ### Development
 - [Rspec for Rails](https://github.com/rspec/rspec-rails)
 - [Pry for Rails](https://github.com/rweng/pry-rails)
 - [Fuubar](https://github.com/thekompanee/fuubar)
 
 ### Test
 - [VCR](https://github.com/vcr/vcr)
 - [Webmock](https://github.com/bblimke/webmock)
 - [Capybara](https://github.com/teamcapybara/capybara)
 - [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
 - [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
 - [Simplecov](https://github.com/colszowka/simplecov)

## Screenshots
### Home

<img src="./screenshots/home_view.png">


### Widget by User

<img src="./screenshots/widget_by_user_view.png">

### User Dashboard

<img src="./screenshots/dashboard_view.png">

# How to Contribute
Widgets is an open source project. We invite your participation through issues and pull requests! 

When adding or changing a service please add tests.


## Contributors/Developers
[Me!](@hbellows)
