require './app/poros/NGO'

class CharityNavigatorFacade 
    def self.search_charities(search) 
        CharityNavigatorService.search_charities(search).map do |data|
            NGO.new(data)
        end
    end
end