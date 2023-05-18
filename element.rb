class Element
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def compare_to(element)
        fail "This method should be overridden"
    end

end

class Rock < Element

    def compare_to(element)
        case element.name
        when 'Paper' then
            return 'Paper covers Rock', 'Player 2 won the round'
        when 'Scissors' then
            return 'Rock crushes Scissors', 'Player 1 won the round'
        when 'Lizard' then
            return 'Rock crushes Lizard', 'Player 1 won the round'
        when 'Spock' then
            return 'Spock vaporizes Rock', 'Player 2 won the round'
        else
            return 'Rock equals Rock', 'Round was a tie'
        end
    end

end

class Paper < Element

    def compare_to(element)
        case element.name
        when 'Rock' then
            return 'Paper covers Rock', 'Player 1 won the round'
        when 'Scissors' then
            return 'Scissors cut Paper', 'Player 2 won the round'
        when 'Lizard' then
            return 'Lizard eats Paper', 'Player 2 won the round'
        when 'Spock' then
            return 'Paper disproves Spock', 'Player 1 won the round'
        else
            return 'Paper equals Paper', 'Round was a tie'
        end
    end

end

class Scissors < Element

    def compare_to(element)
        case element.name
        when 'Paper' then
            return 'Scissors cut Paper', 'Player 1 won the round'
        when 'Rock' then
            return 'Rock crushes Scissors', 'Player 2 won the round'
        when 'Lizard' then
            return 'Scissors decapitate Lizard', 'Player 1 won the round'
        when 'Spock' then
            return 'Spock smashes Scissors', 'Player 2 won the round'
        else
            return 'Scissors equals Scissors', 'Round was a tie'
        end
    end

end

class Lizard < Element

    def compare_to(element)
        case element.name
        when 'Paper' then
            return 'Lizard eats Paper', 'Player 1 won the round'
        when 'Scissors' then
            return 'Scissors decapitate Lizard', 'Player 2 won the round'
        when 'Rock' then
            return 'Rock crushes Lizard', 'Player 2 won the round'
        when 'Spock' then
            return 'Lizard poisons Spock', 'Player 1 won the round'
        else
            return 'Lizard equals Lizard', 'Round was a tie'
        end
    end

end

class Spock < Element

    def compare_to(element)
        case element.name
        when 'Paper' then
            return 'Paper disproves Spock', 'Player 2 won the round'
        when 'Scissors' then
            return 'Spock smashes Scissors', 'Player 1 won the round'
        when 'Lizard' then
            return 'Lizard poisons Spock', 'Player 2 won the round'
        when 'Rock' then
            return 'Spock vaporizes Rock', 'Player 1 won the round'
        else
            return 'Spock equals Spock', 'Round was a tie'
        end
    end

end


$moves = [
    Rock.new('Rock'),
    Paper.new('Paper'),
    Scissors.new('Scissors'),
    Lizard.new('Lizard'),
    Spock.new('Spock')
]
