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

## Live Demo

[Live Demo Link](https://1v4n4.github.io/HTML-linter/)

## Getting Started

### To get a local copy and play game

### Prerequisites

- Text editor
- GitHub
- Git

#### Clone this repository on to your local PC

- Click on the `Code` green button
- By the right end of the read-only input containing the repository link click the clipboard icon to copy the link
- In your local PC, open your terminal in the folder you would like to clone the repository into
- Clone the repository with the command: `git clone (copied link)`; like so: `git clone https://github.com/1v4n4/HTML-linter`
- After the clone, type in the command `cd HTML-linter` to access the directory on the terminal

#### Test the linter

- After clonning the project, go to test_filest folder and run any of the files using command lint and name of the file. You can also run program on any other custom file.

### Rspec

To run the tests, enter the HTML-linter directory and run rspec --init. Then run the files file_validator_spec.rb and logic_spec.rb in the spec folder using rspec command.

## About linters

A linterr is a software that helps detect errors in the document. It is a static code analysis tool used to flag programming errors, bugs, stylistic errors, and suspicious constructs. The term originates from a Unix utility that examined C language source code. [Wikipedia](https://en.wikipedia.org/wiki/Lint_(software))

## Authors

:bust_in_silhouette: **Ivana Novakovic-Lekovic**

- GitHub: [@githubhandle](https://github.com/1v4n4)
- Twitter: [@twitterhandle](https://twitter.com/codeIv1)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/ivana-novakovic-lekovic/)


## :handshake: Contributing

Contributions, issues, and feature requests are welcome!
Feel free to contribute

## Show your support

Give a ⭐️ if you like this project!

