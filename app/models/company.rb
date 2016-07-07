class Company < ActiveRecord::Base

  # Scopes
  scope :alphabetical,  -> { order('name') }

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   else
  #     # find(:all)
  #   end
  # end

  def get_weeks
    weeks = [-52, -39, -26, -13, -4, -3, -2, -1]
  end

  def get_exact_price(ratio, curr_price)
    f = curr_price * (100.0 + ratio) / 100.0
    f.round(2)
  end

  def get_weeks_prices
    pc = price_current
    prices = [get_exact_price(pr52, pc),
             get_exact_price(pr39, pc),
           get_exact_price(pr26, pc),
         get_exact_price(pr13, pc),
       get_exact_price(pr04, pc),
     get_exact_price(pr03, pc),
   get_exact_price(pr02, pc),
   get_exact_price(pr01, pc),]
  end

  def is_variable_stock?
    ratios = [pr52,pr39,pr26,pr13,pr04,pr03,pr02,pr01]
    diff_sum = 0
    for i in 0...7
      diff_sum += (ratios[i] - ratios[i+1]).abs
    end
    result = diff_sum > 8
  end

  def is_worse_stock?
    result = (per_FY1 + per_FY2 + per_LFY) / 3.0
    result.round(2)
  end

  def is_moment_down_stock?
    ratios = [pr52,pr39,pr26,pr13,pr04,pr03,pr02,pr01]
    b1 = pr52 < 0 && pr39 < 0 && pr26 < 0 && pr13 < 0
    b2 = pr39 < 0 && pr26 < 0 && pr13 < 0 && pr04 < 0
    b3 = pr26 < 0 && pr13 < 0 && pr04 < 0 && pr03 < 0
    b4 = pr13 < 0 && pr04 < 0 && pr03 < 0 && pr02 < 0
    b5 = pr04 < 0 && pr03 < 0 && pr02 < 0 && pr01 < 0
    result = b1 || b2 || b3 || b4 || b5
  end

  def is_moment_up_stock?
    ratios = [pr52,pr39,pr26,pr13,pr04,pr03,pr02,pr01]
    b1 = pr52 > 0 && pr39 > 0 && pr26 > 0 && pr13 > 0
    b2 = pr39 > 0 && pr26 > 0 && pr13 > 0 && pr04 > 0
    b3 = pr26 > 0 && pr13 > 0 && pr04 > 0 && pr03 > 0
    b4 = pr13 > 0 && pr04 > 0 && pr03 > 0 && pr02 > 0
    b5 = pr04 > 0 && pr03 > 0 && pr02 > 0 && pr01 > 0
    result = b1 || b2 || b3 || b4 || b5
  end

  def find_stock_type
    if is_variable_stock?
      result = "Variable Stock"
    elsif is_worse_stock?
      result = "Worse Stock"
    elsif is_moment_up_stock?
      result = "Moment Up Stock"
    elsif is_moment_down_stock?
      result = "Moment Down Stock"
    else
      result = "Other"
    end
    result
  end

  def find_action
    if is_variable_stock?
      result = "Variable Stock"
    elsif is_worse_stock?
      result = "Worse Stock"
    elsif is_moment_up_stock?
      result = "Moment Up Stock"
    elsif is_moment_down_stock?
      result = "Moment Down Stock"
    else
      result = "Other"
    end
    result
  end

end
