# motion-photo-extractor

## What this does

It's a command line ruby script that splits your S7/S7 Edge motion photos in to a (now smaller) jpg and a mp4.

The files will be saved in the same folder the original image.

## Setup

    - You want Ruby on you path (tested with 2.4.3)
    - Install Bundler if you don't have it ```$ gem install bundler```
    - Then run a ```$ bundle install```

## Examples of use

$ motionPhotoExtractor.rb -p /Users/YourName/Desktop/Desktop/FolderWithMotionPhotosInIt

or

$ motionPhotoExtractor.rb -p /Users/YourName/Desktop/Desktop/FolderWithMotionPhotosInIt/OnePhoto.jpg

## Options

$ motionPhotoExtractor.rb [options]

| Short | Long           | Description
| ------|--------------- | --------------------
| -p    | --path=PATH    | Path of the Motion Photos photo folder
| -v    | --[no-]delete  | Delete the original image after split
| -h    | --help         | Prints help
