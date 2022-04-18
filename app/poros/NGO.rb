class NGO 
    attr_reader :mission, :charity_info_url, :tagline, :website_url, :charity_name, :ein, :state, :city, :zipcode, :street_address, :country, :category, :error
    def initialize(data) 
        if data[:errorMessage].present?
            @error = true
        else 
            @mission = data[:mission] unless data[:mission].nil?
            @charity_info_url = data[:charityNavigatorURL] if data[:charityNavigatorURL].present?
            @tagline = data[:tagLine] if data[:tagLine].present?
            @website_url = data[:websiteURL] if data[:websiteURL].present?
            @charity_name = data[:charityName].titleize if data[:charity_name].present?
            @ein = data[:ein] if data[:ein].present?
            @state = data[:mailingAddress][:stateOrProvince] if data[:state].present?
            @city = data[:mailingAddress][:city].titleize if data[:city].present?
            @zipcode = data[:mailingAddress][:postalCode] if data[:zipcode].present?
            @street_address = data[:mailingAddress][:streetAddress1].titleize if data[:mailingAddress].present?
            @country = data[:mailingAddress][:country].nil? ? "USA" : data[:mailingAddress][:country] 
            @category = data[:irsClassification][:nteeType] if data[:irsClassification][:nteeType].present?
            @error = false
        end
    end
end