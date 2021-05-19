# HTML-linter
The main goal of this linter is to validate the HTML file and inform the customer about errors in the document. The user will get a sorted overview list with clearly marked items and suggestions on what to do.

Linter checks for seven types of errors and returns different messages for each situation along with the number of lines. 

It runs this set of tests:
- trailing spaces detection
- indentation by two: every line, except for the first and last, must be indented with an even number of spaces
- indentation of the first, and last not empty line must be zero. If the last line is not empty, it is going to trigger
   a different error.
- vertical indentation: must be different by zero or two compared to previous/next line (empty lines are ignored)
- open braces (unclosed tags) detection
- the last line must be empty
- missing alt detection.

All possible outcomes are accounted for:

- if an argument not given, the wrong document name entered or the file is empty

![linter1](https://user-images.githubusercontent.com/65791349/118408015-e1312f00-b683-11eb-98aa-c57f4a18bc47.png)

- If there is a lot of offenses in a file

![linter2](https://user-images.githubusercontent.com/65791349/118408009-deced500-b683-11eb-900a-1eb42b9481d1.png)

- if there is only one error in the file

![linter3](https://user-images.githubusercontent.com/65791349/118408018-e42c1f80-b683-11eb-8c56-d99d7f8905d5.png)

- if there are no offenses in a document

![linter4](https://user-images.githubusercontent.com/65791349/118408020-e55d4c80-b683-11eb-9d08-0277be4f3b33.png)

Results are displayed as a sorted list of lines containing offenses, along with the total count of errors.

## Built With

- Ruby
- RSpec for Ruby Testing

## Getting Started

### To get a local copy and run a linter

#### Prerequisites

- Text editor
- GitHub
- Git
- Ruby

#### Clone this repository onto your local PC

- Click on the `Code` green button
- By the right end of the read-only input containing the repository link click the clipboard icon to copy the link
- In your local PC, open your terminal in the folder you would like to clone the repository into
- Clone the repository with the command: `git clone (copied link)`; like so: `git clone https://github.com/1v4n4/HTML-linter`
- After the clone, type in the command `cd HTML-linter` to access the directory on the terminal

#### Installing RSPEC

To install RSPEC run `gem install rspec` in your Terminal.

#### Gem 'colorize' needed

Linter is using a Ruby gem 'colorize', and it is already in HTML-linter repository.

### Run the linter

- After cloning the project and installation, go to test_files folder and run any of the files using the command `lint (filename)`. 
You can also run a program on any other custom file.

### Rspec

To run the tests, go to the spec folder and run the files file_validator_spec.rb and logic_spec.rb using rspec command (`rspec logic_spec.rb`).

## About linters

A linter is software that helps detect errors in the document. It is a static code analysis tool used to flag programming errors, bugs, stylistic errors, and suspicious constructs. The term originates from a Unix utility that examined C language source code. [Wikipedia](https://en.wikipedia.org/wiki/Lint_(software))

## Authors

:bust_in_silhouette: **Ivana Novakovic-Lekovic**

- GitHub: [@githubhandle](https://github.com/1v4n4)
- Twitter: [@twitterhandle](https://twitter.com/codeIv1)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/1v4n4/)


## :handshake: Contributing

Contributions, issues, and feature requests are welcome!
Feel free to contribute

## Show your support

Give a ⭐️ if you like this project!

