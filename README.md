# Capybara-Cannon

Capybara-Cannon is syntactic sugar of Capybara::DSL. It evaluates capybara-dsl easily.

## Installation

```
git clone https://github.com/alpaca-tc/capybara_cannon
cd capybara_cannon
gem build capybara_cannon.gemspec
gem install capybara_cannon-*.gem
```

## Example

```
$ capybara_cannon --file multiple_user_agent.rb
```

```
# multiple_user_agent.rb
# multiple user agent checklist
browsers = [
  'Mozilla/5.0 (Linux; Android 6.0.1; SM-G920V Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36',
  'Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Microsoft; Lumia 950) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Mobile Safari/537.36 Edge/13.10586',
  'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 6P Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36',
]

app_host 'http://example.com'

browsers.each do |ua|
  Capybara.reset_session!
  puts ua

  header('User-Agent', ua)

  visit '/'

  within('.form') do
    find(%(input[name='checkbox'][value='1'])).click
    find(%(input[type='submit'])).click
  end
end
```
