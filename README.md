# Introduction
The aim of this exercise is to explain the use of Service Objects in Rails App, and help you to answer the question: 'How Service Object is supposed to make my life easier?'.

# App description
This is a very simple API app, that allows only to create table reservations. 
There are 3 controllers doing the very same thing:
 - ReservationsController - plain Rails controller
 - SoReservationsController - Controller using Service Objects
 - MonadsReservationsController - Controller using Service Objects based ond [dry-monad :result](https://dry-rb.org/gems/dry-monads/1.3/result/)

## Reservation Creation
In order to make a reservation, we need to provide the following params:
- id of the customer
- id of the table
- Date of the reservation
- number of guests

## Reservation parameters' validation
Thanks to ActiveRecord, we have a validation for the presence of customers and tables id.
We wan to add two more validations:
- Date of the reservation must be at least 7 days in the future
- Number of guests should be smaller than the capacity of the table

# Exercise description
Make all the tests green :) 
You should change only with the following files:
- app/controllers/reservations_controller.rb (plain Rails approach)
- app/services/ReservationServices/create_reservation_with_monads.rb (Monad service object approach)
- app/services/ReservationServices/create_reservation.rb (Service Object approach)

## Goal
At the first glance,  all three controllers look more or less the same, but Service Objects approaches require additional class (and more code) to do the same thing as simple Rails controllers. 
The real goal of this exercise is to show, that Service Objects approach is not only more readable, but also more flexible.

## How to run
Install dependiencies
```
bundle install
```

Run tests
```
bundle exec rspec
```
