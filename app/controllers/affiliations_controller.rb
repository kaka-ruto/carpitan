class AffiliationsController < ApplicationController
  # POST /affiliations or /affiliations.json
  def create
    @affiliation = Affiliation.new(politician_id: affiliation_params[:politician_id], relationship: affiliation_params[:relationship], business_id: affiliation_params[:business_attributes][:id]) if affiliation_params[:business_attributes] && affiliation_params[:business_attributes][:id].present?
    @affiliation = Affiliation.new(affiliation_params) if affiliation_params[:business_attributes] && affiliation_params[:business_attributes][:id].blank?

    respond_to do |format|
      if @affiliation.save
        format.html { redirect_to business_url(@affiliation), notice: "Business was successfully created." }
        format.json { render :show, status: :created, location: @affiliation}
      else
        format.html { redirect_to :new_business, alert: @affiliation.errors }
        format.json { render json: @affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def affiliation_params
      params.fetch(:affiliation, {}).permit(:politician_id, :relationship, business_attributes: %i[id name business_phone business_email address industry user_id])
    end
end
# Parameters: {"authenticity_token"=>"[FILTERED]", "affiliation"=>{"politician_id"=>"1", "relationship"=>"owned", "business"=>{"id"=>"1", "name"=>"", "business_phone"=>"", "business_email"=>"", "address"=>"", "industry"=>""}}, "commit"=>"Create Business"}