require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do 
    @number = params[:number].to_i
    @square = @number * @number
    "#{@square}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    @return_string = String.new
    @number.times do |x|
      @return_string << @phrase
    end
    "#{@return_string}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]
    @return_string = String.new
    @return_string << (@word1<< " ")
    @return_string << (@word2<< " ")
    @return_string << (@word3<< " ")
    @return_string << (@word4<< " ")
    @return_string << (@word5<< ".")
    "#{@return_string}"
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
  case params[:operation]
    when "add"
      @operation = :+
    when "subtract"
      @operation = :-
    when "divide"
      @operation = :/
    when "multiply"
      @operation = :*
    end

    result = @number1.send(@operation, @number2)
    "#{result}"
  end



end