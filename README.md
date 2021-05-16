# HTML-linter
Linter checks for seven types of errors and returns different messages for each situation along with the number of lines. It runs this set of tests:
- trailing spaces detection
- indentation by two: every line, except for the first and last, must be indented with an even number of spaces
- indentation of first, and last not empty line must be zero. if last line is not empty, it is going to trigger different error.
- vertical indentation: must be different by zero or two compared to previous/next line (empty lines are ignored)
- open braces (unclosed tags) detection
- the last line must be empty 
- missing alts detection
