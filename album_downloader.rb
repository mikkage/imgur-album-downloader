# Downloads the contents of an imgur album.
# Usage: ruby album_downloader.rb
require 'httparty'
require 'json'

# List of album URLs to download, EX: http://imgur.com/a/abc12
albums = [
]

if albums.length == 0
  puts 'No albums specified. Exiting'
  exit 1
end

  # The blog layout lists all images in the album, unlike going straight to the album
  doc = HTTParty.get("#{album}/layout/blog").body

  # A bit of hackery to find the JSON blob that describes the album from javascript on the page
  album_json = /.*_item:\ (.*)\]\}\}$/.match(doc)[1] + "]}}"
  album_data = JSON.parse(album_json)

  title = album_data['title']
  Dir.mkdir(title) unless File.exist?(title)

  puts "Starting album #{index + 1} of #{albums.length}: #{title}"

  image_total = album_data['album_images']['count']
  album_data['album_images']['images'].each_with_index do |image, index|
    id = image['hash']
    ext = image['ext']
    puts "Downloading image #{index + 1} of #{image_total}: http://i.imgur.com/#{id}#{ext}"
    File.binwrite("#{title}/#{id}#{ext}", HTTParty.get("http://i.imgur.com/#{id}#{ext}").body)
  end
end
