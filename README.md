# motion-photo-extractor

## What this does

It's a command line ruby script that splits your S7/S7 Edge motion photos in to a (now smaller) jpg and a mp4.

The files will be saved in the same folder the original image.

## Examples

$ motionPhotoExtractor.rb -p /Users/YourName/Desktop/Desktop/FolderWithMotionPhotosInIt

or

$ motionPhotoExtractor.rb -p /Users/YourName/Desktop/Desktop/FolderWithMotionPhotosInIt/OnePhoto.jpg

## Options

$ motionPhotoExtractor.rb [options]

| Short | Long           | Description
| ------|--------------- | --------------------
| -p    | --path=PATH    | Path of the facebook photo folder
| -h    | --help         | Prints help
