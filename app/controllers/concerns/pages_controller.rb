class PagesController < ApplicationController
  def square
   render({ :template => "page_templates/square" })
  end

  def square_results
    @user_num = params.fetch("user_number").to_f
    @square_value = @user_num**2

    render({ :template => "page_templates/square_results" })
  end

  def square_root
    render({ :template => "page_templates/square_root" })
  end

  def square_root_results
    @user_num = params.fetch("user_number").to_f
    @sqr_root = @user_num**(0.5)

    render({ :template => "page_templates/square_root_results" })
  end

  def payment

    render({ :template => "page_templates/payment" })
  end

  def payment_results
    @apr = (params.fetch("user_apr").to_f)/100
    @apr_display = (params.fetch("user_apr").to_f).to_fs(:percentage, { :precision => 4 } )
    @num_years = params.fetch("num_years").to_i
    @present_value = params.fetch("user_principal").to_i
    @present_val_display = @present_value.to_fs(:currency)

    @num_periods = @num_years * 12
    @rate_per_period = @apr / 12

    @numerator = @rate_per_period * @present_value
    @denominator = 1 - ((1 + @rate_per_period)**(-@num_periods))

    @payment = (@numerator / @denominator).to_fs(:currency)


    render({ :template => "page_templates/payment_results" })
  end

  def random
    render({ :template => "page_templates/random" })
  end
  
  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f

    @rand_num = rand(@min..@max)

    render({ :template => "page_templates/random_results"})
  end
end
