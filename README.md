# imgur Album Downloader
This is a simple script to download one or more imgur albums.

## Requirements
* ruby => 1.9.3
* rubygems
  * httparty

## Usage
To use this script, simply set the albums variable to a list of imgur albums URLs.
```
albums = [
  'http://imgur.com/a/foo123',
  'http://imgur.com/a/bar123'
]
```
Then just run the script with `ruby album_downloader.rb`. A new directory will be created for each album being downloaded. All images in each album will be saved in their respective directories.
