local msg = false

print("Enter A Number below 10 to get true: ")
Condition = io.read("n");

if Condition < 10 then
    msg = true
end

print(msg)