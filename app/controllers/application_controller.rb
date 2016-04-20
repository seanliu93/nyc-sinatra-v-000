class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
  get '/' do
    puts "hello world"
    erb :'application/root'
  end
end
