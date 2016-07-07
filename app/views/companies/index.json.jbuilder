json.array!(@companies) do |company|
  json.extract! company, :id, :name, :symbol, :pr01, :pr02, :pr04, :pr13, :pr26, :pr03, :pr39, :pr52, :pr_year_to_date, :price_current, :warranted_price, :per_FY1, :per_FY2, :per_LFY
  json.url company_url(company, format: :json)
end
