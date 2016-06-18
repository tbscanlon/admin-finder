# Admin Finder

## Synopsis
A handy tool to probe websites for common admin pages.

Admin Finder is a Ruby port of a similar project written in Python by Arsh Leak (www.github.com/4rsh).

## Code Example
Usage is very easy, just type in `admin-finder.rb http://www.your-url.com`.

### HTTP Request
```
response = Unirest.post link + "/" + page
```

### Output
This spaghetti code...:
```
response.code != 200 ? puts("#{red}\tFailed [#{response.code}]: \t#{link}/#{page}#{default}") : puts("#{green}\tSuccess [#{response.code}]: \t#{link}/#{page}#{default}")
```

...Returns the following output:
```
Failed [404]:   http://www.google.com/administrator/
```
*Google is un-hackable.*

## Installation
**Admin-finder requires Unirest to make HTTP requests.** I was too lazy to use Ruby's built-in HTTP tomfoolery.

1. Download Unirest by running `gem install unirest`
2. Grab a copy of this script using your preferred method.
3. run the script by typing `Admin-finder.rb http://www.your-url.com`.

## Contributors
- Thomas Scanlon - <thomas.scanlon@outlook.com>
- Original Python script by Arsh Leak - <http://www.github.com/4rsh>

Contributions are welcome - there's probably a better way to achieve what's done in this script and I'd love to see it.

## License
`¯\_(ツ)_/¯`
