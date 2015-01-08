module MassMandrill
  class TestMailer < MandrillMailer
    def test_email(email)
      global_merge_vars = [{ name: "headline", content: "This is a test email" }]
      merge_vars = [
        {
          :rcpt => email,
          :vars => [{ :name => "first_name", :content => "John Doe" }]
        }
      ]

      template_content = [{ :name => "header", :content => "<h1>Hello World</h1>" }]

      mail(to: [email],
           from: "MassMandrill <mass_mandrill@example.com>",
           subject: "This is a test email!",
           template_content: template_content,
           global_merge_vars: global_merge_vars,
           merge_vars: merge_vars)
    end
  end
end
