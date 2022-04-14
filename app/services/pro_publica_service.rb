class ProPublicaService
    def self.conn
        Faraday.new(url: 'https://projects.propublica.org/nonprofits/api/v2/')
    end

    def self.non_profit_search(search)
        response = conn.get("search.json?q=#{search}")
        json = JSON.parse(response.body, symbolize_names: true)
    end
end