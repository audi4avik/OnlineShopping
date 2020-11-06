*** Settings ***
Documentation  Input data for test cases

*** Variables ***
${URL} =  http://automationpractice.com/index.php
${screenshotDir} =      C:/Users/SHIV/PycharmProjects/Online Shopping/Output/
@{loginCreds} =     audi4avik@gmail.com     audia8
&{registerCreds} =      fname=John  lname=Doe   day=10  month=1   year=1990   address=123, Unknown Street   city=Dakota   state=Texas    zip=12001
&{validLogin} =      username=audi4avik@gmail.com     password=audia8       message=My account
&{invalidEmail} =    username=audi4avikgmail.com      password=audia8       message=Invalid email address
&{invalidPwd} =      username=audi4avik@gmail.com     password=audia9       message=Authentication failed