
UI={}

function UI.progressBar(current, total)
    local widthOfBar = 50
    local progress = math.floor((current / total) * widthOfBar)
    local remaining = widthOfBar - progress
    local bar = "[" .. string.rep("=", progress) .. string.rep(" ", remaining) .. "]"
    io.write("\r" .. bar .. math.floor((current / total) * 100) .. "%") -- carriage return for progress bar to stay on the same line
    io.flush()
end

return UI