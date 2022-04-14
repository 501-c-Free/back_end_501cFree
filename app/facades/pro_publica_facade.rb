require './app/poros/ngo'

class ProPublicaFacade
    def self.matching_non_profits(search)
        ProPublicaService.non_profit_search(search)[:organizations].map do |data| 
            NGO.new(data)
        end
    end
end