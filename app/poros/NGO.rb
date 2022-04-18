class NGO 
    attr_reader :mission, :charity_info_url, :tagline, :website_url, :charity_name, :ein, :state, :city, :zipcode, :street_address, :country, :category, :error
    def initialize(data) 
        if data[:errorMessage].present?
            @error = true
        else 
            @mission = data[:mission] unless data[:mission].nil?
            @charity_info_url = data[:charityNavigatorURL]
            @tagline = data[:tagLine]
            @website_url = data[:websiteURL]
            @charity_name = data[:charityName].titleize
            @ein = data[:ein]
            @state = data[:mailingAddress][:stateOrProvince]
            @city = data[:mailingAddress][:city].titleize
            @zipcode = data[:mailingAddress][:postalCode]
            @street_address = data[:mailingAddress][:streetAddress1].titleize
            @country = data[:mailingAddress][:country].nil? ? "USA" : data[:mailingAddress][:country] 
            @category = data[:irsClassification][:nteeType]
            @error = false
        end
    end
end