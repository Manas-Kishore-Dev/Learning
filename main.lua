function Greet(Time)
    if Time<=12 then
        return "Good Morning"
    elseif Time>12 then
        return "Good Afternoon"
    elseif Time>16 then
        return "Good Evening"
    else
        return "Good Night"
    end
end

print(Greet(12))