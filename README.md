# HTML-linter
Linter checks for seven types of errors and returns different messages for each situation along with the number of lines. It runs this set of tests:
- trailing spaces detection
- indentation by two: every line, except for the first and last must be intended with an even number of spaces
- indentation of first and last (not empty) line: must be zero
- vertical indentation: must be different by zero or two compared to previous/next line (empty lines are ignored)
-  open braces (unclosed tags) detection
- the last line must be empty 
- alt check for two cases: if there is no alt or alt is empty
