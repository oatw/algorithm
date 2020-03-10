require 'bubble_sort'

RSpec.describe Array do

  input_array = [1, 10, 3, 2, 4, 5, 9, 5, 8, 4, 7, 6, 0]

  asc_bubble_sort_expected_output = input_array.sort

  desc_bubble_sort_expected_output = input_array.sort {|a, b| b <=> a}

  it 'asc bubble sort' do
    expect(input_array.bubble_sort! :asc).to eq asc_bubble_sort_expected_output
  end

  it 'desc bubble sort' do
    expect(input_array.bubble_sort! :desc).to eq desc_bubble_sort_expected_output
  end

end
