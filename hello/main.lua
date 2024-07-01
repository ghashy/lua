socket = require("socket")

local a = { a=1, b=2, c=3};




local server = assert(socket.bind("*", 0))
-- find out which port the OS chose for us
local ip, port = server:getsockname()
-- print a message informing what's up
print("Please telnet to localhost on port " .. port)
print("After connecting, you have 10s to enter a line to be echoed")
-- loop forever waiting for clients
while 1 do
  -- wait for a connection from any client
  local client = server:accept()
  -- make sure we don't block waiting for this client's line
  client:settimeout(10)
  -- receive the line
  local line, err = client:receive()
  print("Got line: ", line)
  -- if there was no error, send it back to the client
  if not err then client:send(line .. "\n") end
  -- done with client, close the object
  client:close()
end
















-- local function calculate_polynomial(coefficients, x)
--   -- Initialize the result to 0
--   local result = 0
--
--   -- Loop through the coefficients in reverse order
--   for i = #coefficients, 1, -1 do
--     -- Get the current coefficient
--     local coefficient = coefficients[i]
--
--     -- Add the term (coefficient * x^(i-1)) to the result
--     result = result + coefficient * x^(i-1)
--   end
--
--   -- Return the final result
--   return result
-- end

