class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    # @companies = Company.alphabetical.paginate(page: params[:page]).per_page(20)
    if params[:search]
      @companies = Company.where("symbol LIKE ?", "#{params[:search]}").paginate(page: params[:page]).per_page(20)
      # @companies = Company.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    else
      @companies = Company.alphabetical.paginate(page: params[:page]).per_page(20)
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    xs = @company.get_weeks
    ys = @company.get_weeks_prices
    xs_labels = []
    for x in xs
      xs_labels << x.to_s
    end
    data = xs.zip(ys).flatten
    @line_chart = Gchart.line(
                  # :data => [@company.get_weeks, @company.get_weeks_prices]
                  :size => '550x350',
                  :title => "Price Plot",
                  :axis_with_labels => ['y', 'x'],
                  # :axis_lables => [[xs.join("|")]],
                  :axis_lables => [xs_labels],
                  :data => ys
                  )
    # For analysis
    @stock_type = @company.find_stock_type
    @choice = @company.find_action
  end


  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :symbol, :pr01, :pr02, :pr04, :pr13, :pr26, :pr03, :pr39, :pr52, :pr_year_to_date, :price_current, :warranted_price, :per_FY1, :per_FY2, :per_LFY)
    end
end
