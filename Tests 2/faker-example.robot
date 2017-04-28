*** Settings ***
Library  FakerLibrary

*** Test Cases ***
FakerLibrary Words Generation
    ${words}=  FakerLibrary.Words
    log  words: ${words}
    ${words}=  Faker.Library.Words
