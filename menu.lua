local sys = require("system")

local UI = require("ui")

function displayMenu()
    print("=============")
    print("1. Check Time")
    print("2. Get Mono Time")
    print("3. Give Feedback")
    print("4. Progress Bar Demo")
    print("5. Logs ")
    print("6. Exit")
    print("=============")
end

function sleep()
    local input = io.read()
    local gotInput = sys.readkey(input)
    print(gotInput)
end

function getTime()
    local time = sys.gettime()
    local date = os.date("Current Time: %Y-%m-%d %H:%M:%S", time)
    print(date)
end


function progressBar()
    local total = 100
    for i=1, total do
        UI.progressBar(i, total)
        sys.sleep(0.01)
    end
    print()
end


function monoTime()
    local response = sys.monotime()
    print(response)
end

function UI.prompt(message)
    print(message .. " (yes/no):")
    local response = io.read()
    if response == "yes" then
        return true
    else return false end
end

function uiPrompt()
    local response = UI.prompt("Do you like lua?")
        if response == true then 
            print("Thats great!")
        else 
            print("So sad to hear :(")
        end
end

while true do
    displayMenu()
    io.write("Select an Option: ")
    local choice = tonumber(io.read())

    if choice == 1 then
        getTime()
    elseif choice == 2 then
        monoTime()
    elseif choice == 3 then
        uiPrompt()
    elseif choice == 4 then
        progressBar()
    elseif choice==6 then
        break
    end
end