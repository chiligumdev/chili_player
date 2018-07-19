# ChiliPlayer [![Build Status](https://travis-ci.org/chiligumdev/chili_player.svg?branch=master)](https://travis-ci.org/chiligumdev/chili_player)

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

    client = ChiliGum::Init.new(token: 'your-token')

## Videos

After you had instantiate the class, to manipulate the API endpoints we provide 4 methods

### List all videos

    response = client.all_videos
    response.body
    
This method returns the entire response to chili player call, the `.body` returns an array of hashes containing information for all links createad in your account 

### Get a specific video

    response = client.get_video(video_id)
    response.body

If video_id exists this call returns all information about the requested video.

### Upload video
In order to upload video, you must pass as parameters the video's title and the video file you want to upload.

    response = client.upload(name_video, video_file)
    response.body

This method returns all information about your uploaded video, such as id, name, duration, token and so forth.

### Delete a video
If you want to delete a previous uploaded video, you just need to pass the id of this video

    response = client.delete(video_id)
    response.body

If the id is valid, this method returns the message `{"msg": "deleted"}`

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chiligumdev/chili_player. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UrliMe project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/urli_me/blob/master/CODE_OF_CONDUCT.md).
