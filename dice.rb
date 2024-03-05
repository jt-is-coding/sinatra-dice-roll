require "sinatra"
require "sinatra/reloader"

require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "Gotta add a path for each route we want to support"
end

get("/giraffe") do
  "I wonder if I can see this without restarting the server. Okay what about now?? Cool." 
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  "<h1>2d6</h1>
  <p>#{outcome}</p>"

end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die
  
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  first_die = rand(1..20)

  outcome = "You rolled a #{first_die}"

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  sum = []
  x = 0
  rand = 0

  while x < 5 do 
    rand = rand(1..4)
    sum.push(rand)
    x = x + 1
  end

  outcome = "You rolled #{sum[0]},  #{sum[1]},  #{sum[2]},  #{sum[3]}, and #{sum[4]} for a total of #{sum.sum}"

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/6") do
  sum = []
  x = 0
  rand = 0

  while x < 5 do
    rand = rand(1..6)
    sum.push(rand)
    x = x + 1
  end

  outcome = "You rolled #{sum[0]}, #{sum[1]}, #{sum[2]}, #{sum[3]}, and #{sum[4]} for a total of #{sum.sum}"

  "<h1>5d6</h1>
  <p>#{outcome}</p>"
end
