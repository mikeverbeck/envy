Given /^I download envy$/ do
  run_simple("git clone git@github.com:mikeverbeck/envy.git")
end

Then /^a home directory named "(.*?)" should exist$/ do |directory|
  path = "#{Dir.home}/#{directory}"
  check_directory_presence([path], true)
end