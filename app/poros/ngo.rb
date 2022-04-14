class NGO
    def initialize(data)
        @ein = data[:ein]
        @name = data[:name]
        @city = data[:city]
        @state = data[:state]
        @category = map_ntee(data[:ntee_code]) if data[:ntee_code]
    end

    def map_ntee(string)
        if string.nil?
            @category = nil 
        else 
            letter = string[0].upcase
            if letter == 'A'
                @category = 'Arts, Culture, and Humanities'
            elsif letter == 'B'
                @category = 'Education'
            elsif %w(C D).include?(letter)
                @category = 'Education'
            elsif %w(E F G H).include?(letter)
                @category = 'Health'
            elsif %w(I J K L M N O P).include?(letter)
                @category = 'Human Service'
            elsif %w(Q).include?(letter)
                @category = 'International Foreign Affairs'
            elsif %w(R S T U V W).include?(letter)
                @category = 'Public, Societal Benefit'
            elsif letter == 'X'
                @category = 'Religion Related'
            elsif letter == 'Y'
                @category = 'Mutual/Membership Benefit'
            elsif letter == 'Z'
                @category = 'Unknown, Unclassified'
            end
        end
    end
end