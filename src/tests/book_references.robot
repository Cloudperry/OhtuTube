*** Settings ***
Resource  resource.robot


*** Test Cases ***

Add Book Reference With Correct Inputs
    [Documentation]    UI returning confirmation when reference added succesfully
    Select Add New Book Reference
    Input Correct Book Reference Values 
    Confirm Summary    
    Execute
    Output Should Contain    Added successfully!


Add Book Reference With Incorrect Year
    [Documentation]    UI returning error and instructions for correct form 
    Select Add New Book Reference
    Input Author    Metz, Cade
    Input Title    Genius makers    
    Input Year    fff
    Input Year    2021    
    Input Publisher    Penguin
    Input Address    London     
    Confirm Summary  
    Execute
    Output Should Contain    Error, enter the year like this: 2014

Search Book References With Parameter
    [Documentation]    Search book reference from database with Author
    Save Two Book References
    Select Search
    Input Author  Bond, James
    Execute
    Output Should Contain  jj
    
See Summary Of The Entry
    [Documentation]    UI displaying summary of the reference entry
    Select Add New Book Reference
    Input Correct Book Reference Values
    Confirm Summary 
    Execute
    Entry Should Succeed With Summary
    # Output Should Contain    metz2021      | Metz, Cade          | Genius makers                | 2021   | Penguin            | London            


*** Keywords ***

Input Correct Book Reference Values
    Input Author    Metz, Cade
    Input Title    Genius makers    
    Input Year    2021    
    Input Publisher    Penguin
    Input Address    London    


Save Two Book References
    Select Add New Book Reference
    Input Author    Metz, Cade
    Input Title    Genius makers    
    Input Year    2021    
    Input Publisher    Penguin
    Input Address    London    
    Confirm Summary  
    Select Add New Book Reference
    Input Author    vn, ery
    Input Title    cvbcvus makers
    Input Year    1212
    Input Publisher    xcvnguin
    Input Address    zxcvzxcvon
    Input    y


Entry Should Succeed With Summary
    Output Should Contain  metz2021geni ${SPACE}| Metz, Cade ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE}| Genius makers ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE}| 2021 ${SPACE} | Penguin ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE}| London ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE} ${SPACE}
      


    
    
    