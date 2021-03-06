# SlackHook

[![Gem Version](https://badge.fury.io/rb/slack_hook.svg)](https://badge.fury.io/rb/slack_hook)
[![CircleCI](https://circleci.com/gh/kirillshevch/slack_hook.svg?style=svg)](https://circleci.com/gh/kirillshevch/slack_hook)


A Simple Interface to Slack Incoming Webhooks Integrations

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slack_hook'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slack_hook

## Usage

Integrate [incoming webhooks](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks) into your workspace.

```ruby
slack_hook = SlackHook::Incoming.new("HOOK_URL")

payload={"text": "A very important thing has occurred! <https://alert-system.com/alerts/1234|Click here> for details!"}

slack_hook.post(payload)
#<Net::HTTPOK 200 OK readbody=true>
```

# <img src='https://github.com/kirillshevch/slack_hook/blob/master/example.jpg' alt='Incoming Hook Example' />

## Message formatting (payload)

Slaсk currently provides two ways to format messages:

1. [Message attachments](https://api.slack.com/docs/outmoded-messaging) (outmoded)
2. [Block Kit](https://api.slack.com/block-kit)

`SlackHook` support both approaches.

1. `{ text: 'hook text', attachments: []}`
1. `{ blocks: [] }`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kirillshevch/slack_hook.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
