ram {Integer[]} nums
# @return {Integer}
def find_shortest_sub_array(nums)
    mapper = {}
    # 1. make hashmap of keys to number of occurrences
    nums.each do |number|
        if mapper.has_key?(number)
            mapper[number] = mapper[number] + 1
        else
            mapper[number] = 1
        end
    end
    
    # 2. iterate through keys and save keys according to max value
    max_keys = []
    curr_max = 0
    mapper.keys.each do |key|
        if mapper[key] >= curr_max
            if mapper[key] > curr_max
                curr_max = mapper[key]
                max_keys = []
                max_keys << key
            elsif mapper[key] == curr_max
                max_keys << key
            end
        end
    end
    
    # 3. iterate through max_keys and find subarray with first/last occurrence of that key
    subarrays = []
    max_keys.each do |degree_key|
        subarray_index = nums.each_with_index.map do |elem, index|
            elem == degree_key ? index : nil
        end.compact
        
        subarrays << nums[subarray_index.first..subarray_index.last]
    end
    
    # 4. return length of shortest subarray
    min_size = 100000000
    subarrays.each do |sub|
        min_size = sub.size if sub.size < min_size
    end

    min_size
end
