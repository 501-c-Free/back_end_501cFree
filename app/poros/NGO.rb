class NGO 
    def initialize(data) 
        @mission = data[:mission]
        @website_url = data[:websiteUrl]
        @charity_name = data[:charityName]
        @ein = data[:organization][:ein]
        @address = data[:mailingAddress]
        @category = data[:classification]
    end
end