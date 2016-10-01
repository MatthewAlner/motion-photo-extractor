#!/usr/bin/env ruby

require 'optparse'

$PATH = ""

def parse_options()
    options = {}

    optparse = OptionParser.new do |opts|
        opts.banner = "Usage: motionPhoto.rb [options]"

        opts.on("-p", "--path=PATH", "Path of the image / folder of images you want to extract the motion from") do |path|
            options[:path] = path
        end

        opts.on("-d", "--delete", "delete original files") do |d|
            options[:delete] = d
        end

        opts.on("-h", "--help", "Prints this help") do
            puts opts
            exit
        end

    end

    optparse.parse!

    if !options[:path].nil? then $PATH = options[:path] end
    if !options[:delete].nil? then $DELETE = options[:delete] end

    puts "Path: " + $PATH.to_s

    check_for_missing_options(optparse, options)
end

def check_for_missing_options(optparse, options)
    begin
        mandatory = [:path]
        missing = mandatory.select{ |param| options[param].nil? }
        unless missing.empty?
          puts "Missing options: #{missing.join(', ')}"
            puts optparse
            exit
        end
    rescue OptionParser::InvalidOption, OptionParser::MissingArgument
        puts $!.to_s
        puts optparse
        exit
    end
end

def extract_and_save(name, file_path)
    File.open("#{file_path}/#{name}.jpg", "rb") do |motion_photo|
        data = motion_photo.read.split("MotionPhoto_Data");
        if data.length > 1
            puts "#{name} - Split into 'jpg' & 'mp4'"
            File.open("#{file_path}/#{name}_Extracted.jpg", 'w') { |file| file.write(data[0]) }
            File.open("#{file_path}/#{name}_Extracted.mp4", 'w') { |file| file.write(data[1]) }
            if $DELETE
                File.delete("#{file_path}/#{name}_Extracted.jpg")
                puts "#{name} - Original Deleted!"
            end
        else
            puts "#{name} - Not a MotionPhoto"
        end
    end
end

def process_images(folder_path)
    root_folder = File.absolute_path(folder_path)
    if File.directory? folder_path
        image_files = Dir["#{root_folder}/*.jpg"]
    else
        image_files = [folder_path]
    end
    image_files.each do |file|
        file_name = File.basename(file, ".jpg")
        extract_and_save(file_name, File.dirname(file));
    end
end

parse_options
process_images($PATH)
