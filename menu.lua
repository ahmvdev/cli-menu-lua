local sys = require("system")

function menu()
    print("1. Get Terminal Size")
    print("2. Exit")
end

function termsize()
   k,v = sys.termsize()
    print("Height: ".. k .. " " .. "Width: " .. v)
end

while true do
    menu()
    local choice = tonumber(io.read())
    if choice == 1 then
        termsize()
    elseif choice == 2 then
        os.exit()
        break
    end
end