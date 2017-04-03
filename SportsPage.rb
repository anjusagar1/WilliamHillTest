require 'rubygems'
require 'selenium-webdriver'



When(/^I navigate to WilliamHill website$/) do
  @browser.get "http://sports.williamhill.com/betting/en-gb/football"
end

Then(/^WilliamHill Sports page should be displayed$/) do
  pageTitle = @browser.title
  puts "Page Title : #{pageTitle}"
end

When(/^I click on login button$/) do
  input = @wait.until {
    element = @browser.find_element(:id, "accountTabButton")
    element if element.displayed?
  }
  input.click
end

And(/^I enter username and password$/) do
  @browser.find_element(:id,"loginUsernameInput").send_keys("WHATA_FOG2")
  @browser.find_element(:id,"loginPasswordInput").send_keys("F0gUaTtest")
  @browser.find_element(:id,"loginButton").click
end



Then(/^I place a bet$/) do
@browser.find_element(:id,"nav-football").click


#popup = @wait.until {
 #element1 = @browser.find_element(:link,'No thanks')
#element1 if element1.displayed?

#}
#popup.click

@browser.find_element(:partial_link_text,'Inter Milan').click

activeselection = @wait.until {
  selectedbutton = @browser.find_element(:id,"OB_OU1515299658")
  selectedbutton if selectedbutton.displayed?
}
activeselection.click

stakeinputvalue = @wait.until {

 stakeinput = @browser.find_element(:id,"stake-input__1515299658L")
 stakeinput if stakeinput.displayed?

}
stakeinputvalue.send_keys(0.05)

  balancemoneybeforebet = @browser.find_element(:id, "balanceLink").text

toreturn = @browser.find_element(:id, "total-to-return-price").text
  puts "#{toreturn}"

  totalstake = @browser.find_element(:id,"total-stake-price").text
  puts "#{totalstake}"

  @browser.find_element(:id,"place-bet-button").click

  @browser.find_element(:id,"bet-receipt").click

  assert_equal(@browser.find_element(:id,"receipt-estimated-returns_1515299658L").text, totalstake, msg="Test1 is passed")
  balancemoneyafterbet = @browser.find_element(:id, "balanceLink").text

  if balancemoneyafterbet.to_f <  balancemoneybeforebet.to_f then
    puts "Test 2 is passed"
  else
    puts "Test 2 is failed"
  end

end