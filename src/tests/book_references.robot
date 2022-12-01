*** Settings ***
Resource  resource.robot
# Test Teardown  
# Test Setup    Start App


*** Test Cases ***
# Add Book Reference 
#     Book Inputs  1  Seppo, Taalasmaa  Salattu  1212  WSOY  AA  9232  y  0
# 	Output Should Contain  Added successfully!

Add Book Reference With Correct Inputs
    Add Book Reference    1    Metz, Cade    Genius makers    2021    Penguin    London    metz2021    y    0
    Output Should Contain  Added successfully!

Add Book Reference With Incorrect Year
    # miten silputa Add Book Reference osiin tätä testiä varten
    Input  1
    Input   Metz, Cade
    Input  Genius makers
    Input Year  fff
    Output Should Contain  Error, enter the year like this: 2014
	

###

# Choose Action From Menu With Correct Command
#     [Documentation]    UI presenting menu and displaying correct content
#     Output Should Contain    Commands:    [1]Add new reference    [2]Display all references    [3]Search    [0]Exit    
#     Input    1
#     Output Should Contain    ADD NEW REFERENCE
#     # Add Book Reference Should Open

# Choose Action From Menu With Incorrect Command
#     [Documentation]    UI presenting menu and displaying correct content
#     Output Should Contain    Commands:    [1]Add new reference    [2]Display all references    [3]Search    [0]Exit    
#     Input    a
#     Output Should Contain    Command not recognized, please enter a valid command
#     # Menu Should Appear


# Add Reference To Database 
#     Input    1
#     Input Author    Metz, Cade
#     Input Title    Genius makers
#     Input Year    2021
#     Input Publisher    Penguin
#     Input Address    London
#     Input ReferenceID    metz2021
#     Input    y
#     Output Should Contain    Added successfully!
#     Input    0
#     Start App
    
    

# Add Book Reference With Correct Inputs
#     [Documentation]    UI asking correct inputs when adding a book reference
#     Input Author    Metz, Cade
#     Input Title    Genius makers
#     Input Year    2021
#     Input Publisher    Penguin
#     Input Address    London
#     Input ReferenceID    metz2021
#     Create Book Reference    Metz, Cade    Genius makers    2021    Penguin    London    metz2021       
#     # Entry Should Succeed With Summary
#     # Output Should Contain    Do you want to save this item to database? (y/n):
#     Input    y 
#     Add Reference To Database    Metz, Cade    Genius makers    2021    Penguin    London    metz2021 
#     Output Should Contain    Added successfully!


*** Keywords ***
Add Book Reference
    [Arguments]  ${menu}  ${author}  ${title}  ${year}  ${publisher}  ${address}  ${id}  ${yes}  ${exit}
    Book Inputs  ${menu}  ${author}  ${title}  ${year}  ${publisher}  ${address}  ${id}  ${yes}  ${exit}


# Create Book Reference
#     [Arguments]  ${id}  ${author}  ${title}  ${year}  ${publisher}  ${address}  
#     Book Reference Inputs    Metz, Cade    Genius makers    2021    Penguin    London    metz2021 