require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/write' do
  #글을 저장하고

  #index에서 입력받은 값을 던진 것을 받는다 params를 통해서
  @title = params["title"]
  @content = params["content"]

  File.open("blog.txt",'a') do |f|
    f.write("title : #{@title}, content : #{@content}")
    f.write("\n")
  end

  erb :write #글이 성공적으로 작성되었습니다.
end

get '/show' do
  @list = []
  File.open("blog.txt","r") do |f|
    f.each_line do |line|
      @list << line
    end
  end

  erb :show
end
