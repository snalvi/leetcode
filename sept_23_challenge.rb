# @param {String[]} ops
# @return {Integer}
def cal_points(ops)
    sum = 0
    first_valid_round = 0
    second_valid_round = 0
    
    puts "== ops: #{ops}"
    
    ops.each_with_index do |round, index|
        puts "== round: #{round}"
        if round == 'C'
            sum -= first_valid_round
            first_valid_round = second_valid_round
            second_valid_round = 0
        elsif round == 'D'
            double_sum = first_valid_round*2
            sum += double_sum
            second_valid_round = first_valid_round
            first_valid_round = double_sum
        elsif round == '+'
            two_valid_rounds = first_valid_round + second_valid_round
            sum += two_valid_rounds
            second_valid_round = first_valid_round
            first_valid_round = two_valid_rounds
        else
            points = round.to_i
            second_valid_round = first_valid_round
            first_valid_round = points
            sum += points
        end

        puts "sum: #{sum}, first_valid: #{first_valid_round}, second_valid: #{second_valid_round}"

    end
    sum
end