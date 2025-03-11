local sys = require("system")
local copas = require("copas")


function menu()
    print("1. Get Terminal Size")
    print("2. Check time")
    print("3. Exit")
end

function termsize()
   k,v = sys.termsize()
    print("Height: ".. k .. " " .. "Width: " .. v)
end

function gettime()
  copas.addthread( 
  function()  
  while run do 
    local systime = sys.gettime()
    io.write("\r" , math.floor(systime))
    io.flush()
    copas.pause(0.1)
end
end)
end    

copas.addthread( function()
while true do
    menu()
    local character = sys.readansi(math.huge, copas.pause)
    local choice = tonumber(character)
    if choice == 1 then
        termsize()
    elseif choice == 2 then
        run = true
        gettime()
    elseif choice == 3 then
        run = false
        break
    end
end
end)

local of_attr = sys.tcgetattr(io.stdin)
sys.setnonblock(io.stdin, true)
sys.tcsetattr(io.stdin, sys.TCSANOW, {
  lflag = of_attr.lflag - sys.L_ICANON - sys.L_ECHO, -- disable canonical mode and echo
})

copas.loop()

local of_attr = sys.tcgetattr(io.stdin)
sys.setnonblock(io.stdin, false)
sys.tcsetattr(io.stdin, sys.TCSANOW, {
  lflag = of_attr.lflag + sys.L_ICANON + sys.L_ECHO,
})