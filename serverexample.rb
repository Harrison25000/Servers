require 'socket'
require_relative 'notelist'

class Bob

attr_reader :they_said

server = TCPServer.new(2345)

socket = server.accept

while true do

  socket.puts "What do you say?"

  @they_said = socket.gets.chomp

  if @they_said == "quit"
      socket.puts "Your note: #{@they_said}. Goodbye!"
      break
  end

  socket.puts "Your note: #{@they_said}."
end

socket.close

end
