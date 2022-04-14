class CharityNavigatorService 
    def self.conn
    Faraday.new(
        url: "https://api.data.charitynavigator.org/v2/",
        params: {app_id: ENV['charity_navigator_id'], app_key: ENV['charity_navigator_secret']},
        headers: {'Content-Type' => 'application/json'})
    end

    def self.search_charities(search)
        response = conn.get("organizations?search=#{search}")
        json = JSON.parse(response.body, symbolize_names: true)
    end
end