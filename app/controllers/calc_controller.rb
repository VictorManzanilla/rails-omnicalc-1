class CalcController < ApplicationController

  def home
    render({ :template => "calc_templates/home"})
  end

  def square_new
    render({ :template => "calc_templates/square_new"})
  end

  def square_results
    @number = params.fetch("number").to_f

    @result = @number * @number
    render({ :template => "calc_templates/square_results"})
  end

 

  def square_root_new

    render({ :template => "calc_templates/square_root_new"})
  end

  
  def square_root_results
    @user_number = params.fetch("user_number").to_f
    @user_result = Math.sqrt(@user_number).to_f
    render({ :template => "calc_templates/square_root_results"})
  end

  def payment_new

    render({ :template => "calc_templates/payment_new"})
  end

  def payment_results
    user_apr = params.fetch("user_apr").to_f
  
  @apr_result = (user_apr / 100) / 12
  @formatted_apr = (@apr_result * 100).to_fs(:percentage, { :precision => 4} )
  

  @years = params.fetch("user_years").to_i
  months = @years * 12

  @principal = params.fetch("user_pv").to_f

  @payment = (@apr_result * @principal) / (1 - ((1 + @apr_result.to_f) ** -months))
  @formatted_payment = @payment.to_fs(:currency, precision: 2)

    render({ :template => "calc_templates/payment_results"})
  end

  def random_new

    render({ :template => "calc_templates/random_new"})
  end

  def random_results
    @minimum = params.fetch("user_min").to_f
    @maximum = params.fetch("user_max").to_f
  
    @rand_num = rand(@minimum..@maximum).to_f
    render({ :template => "calc_templates/random_results"})
  end
end
