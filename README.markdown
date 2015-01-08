mass_mandrill
=============

mass_mandrill is thin wrapper around mandrill-api gem that makes sending emails
with Mandrill easier and more pleasent to use. Goal is to resemble Rails'
ActionMailer API.

mass_mandrill supports bulk email sending and Mandrill templates. To learn more
about these topics, visit [Mandrill Support](http://help.mandrill.com/home).

Example
-------

```ruby
class ExampleMailer < MassMandrill::MandrillMailer

  def example_notice(recipients)
    addresses = recipients.map { |recipient| recipient.email }
    global_merge_vars = [{ name: 'headline', content: 'This is first example notice' }]
    merge_vars = recipients.map do |recipient|
      {
        :rcpt => recipient.email,
        :vars => [{ :name => 'first_name', :content => recipient.first_name }]
      }
    end
    template_content = [{ :name => 'header', :content => '<h1>Hello World</h1>' }]
    
    mail(to: addresses,
         from: 'John Doe <john.doe@example.com>',
         subject: 'This is example notice!',
         template_content: template_content,
         global_merge_vars: global_merge_vars,
         merge_vars: merge_vars)
  end

end
```

And to send the email:

```ruby
users = User.all
ExampleMailer.example_notice(users).deliver
```

Name of the Mandrill template that's going to be used for sending is same as
name of the method - in example above `example_notice`. To override template
name, use `template` parameter:

```ruby
mail(to: addresses,
     from: 'John Doe <john.doe@example.com>',
     subject: 'This is example notice!',
     template: 'some_other_template',
     global_merge_vars: global_merge_vars,
     merge_vars: merge_vars)
```

You can omit some options like `from` and `subject` in which case the default
`from` and `subject` that are stored remotely on the Mandrill server will be
used.  You can also send additional configuration to the message (like
`inline_css`, `track_opens`, `track_clicks`, `preserve_recipients`, ...) by
passing a hash of `message_extra`.  For a complete list of these parameters,
check the [Mandrill Message
API](https://mandrillapp.com/api/docs/messages.JSON.html).

```ruby
mail(to: addresses,
     global_merge_vars: global_merge_vars,
     merge_vars: merge_vars,
     message_extra: {
       inline_css: true,
       track_opens: false
     })
```

Install
-------

Add mass_mandrill to your Gemfile:

    gem 'mass_mandrill'

Install it:

    bundle

Or if you are not using bundler:

    gem install mass_mandrill

Place your Mandrill API key in `MANDRILL_APIKEY` environment variable (e.g.
`export MANDRILL_APIKEY=your-key`). If your application runs on
[heroku](http://www.heroku.com), this is automatically done.  If you are using
[foreman](https://github.com/ddollar/foreman) to run your application, place it
in your `.env`:

    MANDRILL_APIKEY=PASTE_YOUR_API_KEY_HERE


Contributing to mass_mandrill
-----------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented
  or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it
  and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to
  have your own version, or is otherwise necessary, that is fine, but please
isolate to its own commit so I can cherry-pick around it.

Testing mass_mandrill
---------------------

mass_mandrill is covered with RSpec tests. Besides that, there is a Rake task
that sends test email to your email address for ultimate test. Follow these
steps for running the Rake task:

Create Mandrill account at mandrillapp.com.

Create a template called `test_email` with following content:

```
<p>*|HEADLINE|*</p>

<p>Hello *|FIRST_NAME|*.</p>
```

Export your Mandrill API key in an environment variable:

```bash
export MANDRILL_APIKEY=your-key
```

Run the Rake task with your email address:

```bash
bundle exec rake test:send_email\[your-email@example.com\]
```

Check your email to verify everything is working correctly.

Copyright
---------

Copyright (c) 2015 Trisignia, Nebojša Stričević. See LICENSE.txt for
further details.
