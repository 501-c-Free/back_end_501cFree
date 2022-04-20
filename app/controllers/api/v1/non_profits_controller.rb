class Api::V1::NonProfitsController < ApplicationController
    def create
        charity = CharityNavigatorFacade.one_charity(params[:ein])
        if charity.ein.present?
            # create project here
            user = User.find(params[:current_user])
            non_profit = user.non_profit
            non_profit.non_profit_name = charity.charity_name
            non_profit.city = charity.city
            non_profit.state = charity.state
            non_profit.category = charity.category
            non_profit.ein = charity.ein
            non_profit.mission = charity.mission
            non_profit.street_address = charity.street_address
            non_profit.website_url = charity.website_url
            non_profit.tagline = charity.tagline
            non_profit.zipcode = charity.zipcode
            non_profit.charity_info_url = charity.charity_info_url
            non_profit.country = charity.country
            non_profit.save
            render json: charity
        elsif charity.error
            render json: {error: 'not found'}
        end
    end

    def show 
        render json: NonProfitProjectsSerializer.new(User.find(params[:id]).non_profit)
        
    end
end