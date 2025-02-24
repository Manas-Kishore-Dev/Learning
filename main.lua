local msg = false

print("Enter A Number below 10 to get true: ")
Condition = io.read("n");

if Condition < 10 then
    msg = true
elseif Condition > 20 then
    msg = true
else
    msg = false
end

print(msg)