unless Rails.env.production?
  ENV['HTTP_USER'] = 'testuser'
  ENV['HTTP_PASS'] = 'testpass'
end
