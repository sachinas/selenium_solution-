# Encoding: utf-8

require 'spec_helper'

describe 'Sort Data Table' do

  context 'With Attributes' do

    it 'in Ascending Order' do
      @driver.get 'http://the-internet.herokuapp.com/tables'
      @driver.find_element(css: '#table2 thead .dues').click
      dues = @driver.find_elements(css: '#table2 tbody .dues')
      due_values = []
      dues.each { |due| due_values << due.text.gsub(/\$/,'').to_f }
      (due_values == due_values.sort).should == true
    end

    it 'in Descending Order' do
      @driver.get 'http://the-internet.herokuapp.com/tables'
      @driver.find_element(css: '#table2 thead .dues').click
      @driver.find_element(css: '#table2 thead .dues').click
      dues = @driver.find_elements(css: '#table2 tbody .dues')
      due_values = []
      dues.each { |due| due_values << due.text.gsub(/\$/,'').to_f }
      (due_values == due_values.sort).should == false
    end

  end

end
