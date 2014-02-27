# Reverb

Built on OS X using ruby 2.0.0. There may be some pathing issues on other operating systems (This can surely be resolved).

CLI App usage:  
```
> ruby ./reverb -s [gender, age, name] <files>
```

Hosting as a rack applications:  
```
# from project root
> rackup
```

The rack application is hosted on port 8080, you can fake some data with curl via:  
```
> curl -X POST -d "record=Paul Les male sunburst 06/09/1915" http://localhost:8080/records
```

To run the tests:  
```
> rspec
```
or...  
```
> rspec spec/[file]
```

===

# Technical Challenge

## Rules/Guidelines
* Make a github repository and commit in small cohesive chunks.
* You can use external gems if you like, but keep in mind that by definition external dependencies add complexity, so think carefully on whether you need them.
* Do not use Rails - it is a complex external dependency that makes code review and refactoring difficult.
* You will be judged on the readability and cleanliness of your code
* Provide unit tests (RSpec or MiniTest or whatever you’re comfortable with). The cleanliness and readability of tests is just as important as your production code. Use BetterSpecs.org as a guideline.
* Think simple. Readability and modularity are better than being clever.
* You must provide 100% test coverage for your code. Write tests first to ensure full coverage.

===

## Step 1:
Build a system to parse and sort a set of records  

Create a command line app that takes as input a file with a set of records in one of three formats described below, and outputs (to the screen) the set of records sorted in one of three ways.  

### Input
A record consists of the following 5 fields:  
last name, first name, gender, date of birth and favorite color.  

You will be given 3 files (CSV), each containing records stored in a different format.  

The pipe-delimited file lists each record as follows:  
LastName | FirstName | Gender | FavoriteColor | DateOfBirth

The comma-delimited file looks like this:  
LastName, FirstName, Gender, FavoriteColor, DateOfBirth  

The space-delimited file looks like this:   
LastName FirstName Gender FavoriteColor DateOfBirth  

You may assume that the delimiters (commas, pipes and spaces) do not appear anywhere in the data values themselves. Write a Ruby program to read in records from these files and combine them into a single set of records.  

### Output
Create and display 3 different views of the data you read in:  

Output 1 – sorted by gender (females before males) then by last name ascending.  
Output 2 – sorted by birth date, ascending.  
Output 3 – sorted by last name, descending.  

Ensure that fields are displayed in the following order:  
* last name
* first name
* gender
* date of birth
* favorite color

Display dates in the format M/D/YYYY.

===

## Step 2:
Build a Grape API to access your system  

Tests for this section are required as well.  

Your assignment is to build a standalone Grape API with the following endpoints:

```
POST /records - Post a single data line in any of the 3 formats supported by your existing code  
GET /records/gender - returns records sorted by gender  
GET /records/birthdate - returns records sorted by birthdate  
GET /records/name - returns records sorted by name  
```
It's your choice how you render the output from these endpoints as long as it well structured data. These endpoints should return JSON.  

