mass_mandrill
=============

mass_mandrill is thin wrapper around mandrill-api gem that makes sending emails with Mandrill easier and more pleasent to use. Goal is to reasemble Rails' ActiveMailer API.

mass_mandrill supports bulk email sending and Mandrill templates. To learn more about these topics, visit [Mandrill Support](http://help.mandrill.com/home).

Example
-------

```ruby
class ExampleMailer < MassMandrill::MandrillMailer

  def example_notice(recipients)
    addresses = recipients.map { |recipient| recipient.email }
    global_merge_vars = [{ name: 'headline', content: 'This is first example notice' }]
    merge_vars = recepients.map do |recipient|
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

Name of the Mandrill template that's going to be used for sending is same as name of the method - in example above `example_notice`. To override template name, use `template` parameter:

```ruby
mail(to: addresses,
     from: 'John Doe <john.doe@example.com>',
     subject: 'This is example notice!',
     template: 'some_other_template',
     global_merge_vars: global_merge_vars,
     merge_vars: merge_vars)
```

Contributing to mandrill_template
---------------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2013 Trisignia, Nebojša Stričević. See LICENSE.txt for
further details.
