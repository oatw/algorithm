require 'quick_sort'

RSpec.describe Array do

  input_array = [1, 3, 2, 9, 8, 1, 0, 10, 6, 7, 5, 4]
  asc_expected_output = input_array.sort
  desc_expected_output = input_array.sort {|a, b| b <=> a}


  it 'recursion unilateral quick sort: asc' do
    expect(input_array.dup.recursion_quick_sort!).to eq asc_expected_output
  end

  it 'recursion unilateral quick sort: desc' do
    expect(input_array.dup.recursion_quick_sort! order: :desc).to eq desc_expected_output
  end

  it 'recursion bilateral quick sort: asc' do
    expect(input_array.dup.recursion_quick_sort! with: :bilateral).to eq asc_expected_output
  end

  it 'recursion bilateral quick sort: desc' do
    expect(input_array.dup.recursion_quick_sort! with: :bilateral, order: :desc).to eq desc_expected_output
  end



  it 'stack unilateral quick sort: asc' do
    expect(input_array.dup.stack_quick_sort!).to eq asc_expected_output
  end

  it 'stack unilateral quick sort: desc' do
    expect(input_array.dup.stack_quick_sort! order: :desc).to eq desc_expected_output
  end

  it 'stack bilateral quick sort: asc' do
    expect(input_array.dup.stack_quick_sort! with: :bilateral).to eq asc_expected_output
  end

  it 'stack bilateral quick sort: desc' do
    expect(input_array.dup.stack_quick_sort! with: :bilateral, order: :desc).to eq desc_expected_output
  end

end