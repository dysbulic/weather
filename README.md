# Exercise:

The purpose of this exercise is to gain a better understanding of how you approach a more complicated problem. Documenting your design decision is a plus.

Create an application that will track current weather measurements for a given set of zip codes.

## Store the following data at a minimum:

* Zip code
* General weather conditions (e.g. sunny, rainy, etc.)
* Atmospheric pressure
* Temperature (in Fahrenheit)
* Winds (direction and speed)
* Humidity
* Timestamp (in UTC)

## There is no output requirement for this application, it is data retrieval and storage only.

* The application should be able to recover from any errors encountered.
* The application should be developed using a TDD approach. 100 % code coverage is not required.
* The set of zip codes and their respective retrieval frequency should be contained inconfiguration file.
* Use the Open WeatherMap API for data retrieval (https://openweathermap.org)

# Usage

* To load files: `rake load:zipcodes[test/fixtures/files/zips.txt]`
* To update data: `rake update:locations` which may be run by cron for regular updates