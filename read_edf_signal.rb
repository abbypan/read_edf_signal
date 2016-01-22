#!/usr/bin/ruby

require 'rubygems'
require 'edfize'

fname = ARGV[0]
sig = ARGV[1] 

edf = Edfize::Edf.new(fname)

#edf.print_header

n = edf.number_of_data_records
i=0
while i<n do
    edf = Edfize::Edf.new(fname)
    edf.load_epoch(i,1)
    edf.signals.each do |signal|
        next if signal.label!=sig
        puts signal.physical_values[0]
    end 
    i=i+1
end
