# Brigittes setup for Advent of Code 2024

## About the Setup

Test Driven coding in ruby for advent of code

    bundle install   # once for the whole advent

Code is in `01/solution_spec.rb` to `25/solution_spec.rb`

    rake next          # every day - sets up everything for today
    bundle exec guard  # watches for changes in todays program, runs tests

## how to use rake with bash

    rake next      # sets up everything for today
    rake day[3]    # sets up everything for day 3
    rake md[3]     # created markdown file for day 3
    rake input[3]  # gets input data for day 3
    rake guard[3]  # sets up Guardfile to run day 3

## how to use rake with zsh

    rake next      # sets up everything for today
    noglob rake day[3]    # sets up everything for day 3
    noglob rake md[3]     # created markdown file for day 3
    noglob rake input[3]  # gets input data for day 3
    noglob rake guard[3]  # sets up Guardfile to run day 3

