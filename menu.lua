function displayMenu()
    print("=======Menu=======")
    print("1.View Files")
    print("2.Create New File")
    print("3.Delete File")
    print("4.Exit")
    print("==================")
end

function option1()
    print("You Selected Option 1")
end

function option2()
    print("You Selected Option 2")
end

function option3()
    print("You Selected Option 3")
end

function option4()
    print("Exiting...")
end

while true do
    displayMenu()
    io.write("Select an Option : ")
    local choice = tonumber(io.read())

    if choice==1 then
        option1()
    elseif choice==2 then
        option2()
    elseif choice==3 then
        option3()
    elseif choice==4 then
        option4()
    break
    else print("Invalid option try again!")
    end 
end