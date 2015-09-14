Given(/^a game between:$/) do |table|

  sleep 0.5
end

Given(/^Dave has guessed: (\d+)$/) do |arg1|
  sleep 0.5
end

When(/^Celine guesses: (\d+)$/) do |arg1|
  sleep 0.5
  fail
end

Then(/^Celine wins$/) do
  sleep 0.5
end
