# ChiliPlayer [![Build Status](https://travis-ci.org/chiligumdev/chili_player.svg?branch=master)](https://travis-ci.org/chiligumdev/chili_player) [![Coverage Status](https://coveralls.io/repos/github/chiligumdev/chili_player/badge.svg?branch=master)](https://coveralls.io/github/chiligumdev/chili_player?branch=master)

Lib to easily call [Chili Player API](https://player.chiligumvideos.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chili_player'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chili_player

## Usage

First of all, you need to sign in [chili player](https://player.chiligumvideos.com/) and then you need to get your credential.
After you get `token`, you can instantiate the class as in this example:

    client = Player.new('your-token')

## Videos

After you had instantiate the class, to manipulate the API endpoints we provide 4 methods

### List all videos

    response = client.videos
    
This method returns an array containing hashes of all information about the videos created, e.g:

    [{"id"=>164, "data"=>"https://s3.amazonaws.com/chilihls/uploads/7d00f8054103d0a3824e59a3689743d69faf4d4b.mp4", "player_url"=>"https://player.chiligumvideos.com/d6d791b7a8", "postback_url"=>nil, "preserve_original_file"=>true, "activated"=>true, "watermark_image_url"=>nil, "watermark_link"=>nil, "watermark_position"=>nil, "wartermark_start"=>nil, "watermark_duration"=>nil, "created_at"=>"2018-06-27T16:43:28.026Z"}, {"id"=>162, "data"=>"https://s3.amazonaws.com/chilihls/uploads/d24ceab72878a4fcdb2c4b52b6d1ef0c67a2ed43.mp4", "player_url"=>"https://player.chiligumvideos.com/dff4f6b549", "postback_url"=>nil, "preserve_original_file"=>true, "activated"=>true, "watermark_image_url"=>nil, "watermark_link"=>nil, "watermark_position"=>nil, "wartermark_start"=>nil, "watermark_duration"=>nil, "created_at"=>"2018-06-19T17:56:50.498Z"}] 


### Get a specific video

    response = client.video(video_id)

If video_id exists this call returns all information about the requested video, e.g:

    {"id"=>5212, "data"=>"https://s3.amazonaws.com/chilihls/uploads/9f46c3365c3f20cb32d82dd795fdb664fa363d33.mp4", "player_url"=>"https://player.chiligumvideos.com/db4d980eef", "postback_url"=>nil, "preserve_original_file"=>true, "activated"=>true, "watermark_image_url"=>nil, "watermark_link"=>nil, "watermark_position"=>nil, "wartermark_start"=>nil, "watermark_duration"=>nil, "created_at"=>"2018-08-30T18:11:16.907Z"}

### Upload video
In order to upload a video, you must pass as parameters the video's title, the video file you want to upload and also optional parameters such as: name, postback_url, preserve_original_file, activated, watermark_image_url, watermark_link, watermark_position, wartermark_start, watermark_duration.

    response = client.upload(name_video, video_file, video_optional_params)

This method returns all information displayed at 'Get a specific video' topic.

### Update video
In order to update a video, you must pass as parameters the video's id and also optional parameters such as: name, postback_url, preserve_original_file, activated, watermark_image_url, watermark_link, watermark_position, wartermark_start, watermark_duration. When you update the video, you cannot change the video's file.

    response = client.upload(video_id, video_optional_params)

This method returns all information displayed at 'Get a specific video' topic.

### Delete a video
If you want to delete a previous uploaded video, you just need to pass the id of this video

    response = client.delete(video_id)

If the video_id is valid, this method returns the message `{"msg": "deleted"}`

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chiligumdev/chili_player. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ChiliPlayer project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/chili_player/blob/master/CODE_OF_CONDUCT.md).
