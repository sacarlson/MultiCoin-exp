#!/usr/bin/ruby
# utility to convert difficulty to nBits and nBits to difficulty format for MultiCoin and or bitcoin
# Copyright (c) 2011 by sacarlson   sacarlson@ipipi.com   
# Distributed under the MIT/X11 software license, see the accompanying
# file license.txt or http://www.opensource.org/licenses/mit-license.php.
puts "Convert difficulty in dec float to nBits format in hex and dec, and nBits format in hex to difficulty in dec float for Multicoin and bitcoin "
puts " first argv input is difficulty in decimal float, secound argv [optional] is nBits value in hex"
dDiff_string = ARGV[0]

min_difficulty_hex = "0000ffff"
 
min_difficulty = min_difficulty_hex.hex.to_f
#print "min_diffictulty = " + min_difficulty.to_s + "\n"


if dDiff_string != nil then
    dDiff = dDiff_string.to_f
end

print " dDiff dec = " + dDiff.to_s + "\n"
dDiff_float = dDiff.to_s.to_f

nShift = 29
while (nShift > 1 && dDiff > 1)
   dDiff = dDiff / 256
   nShift -= 1
end

#print "nShift = " + nShift.to_s + "\n"
nShift_hex = nShift.to_i.to_s(16)
#print "nShift hex = " + nShift_hex + "\n"
# use original  dDiff value below with dDiff_float

while nShift < 29
   #print " nShift now = " + nShift.to_s + "\n" 
   dDiff_float = dDiff_float / 256.0
   #print " dDiff = " + dDiff_float.to_s(16) + "\n"
   nShift +=1
end

#print "dDiff dec = " + dDiff_float.to_s + "\n"

nBits_masked = min_difficulty / dDiff_float

nBits_masked_hex = "%06x" % nBits_masked
#print "nBits_masked hex = " + nBits_masked_hex + "\n"
nBits_hex = nShift_hex + nBits_masked_hex
print "nBits hex = " + nBits_hex + "\n"
print "nBits dec = " + nBits_hex.hex.to_i.to_s + "\n"

nbits = nBits_hex

puts "\n convert nBits to difficulty  format \n"

#nbits = "1a09ec04"
#nbits = "1d0fffff"
if ARGV[1] != nil then
    nbits = ARGV[1]
end

print "nbits = " + nbits + "\n"
min_difficulty_hex = "0000ffff"
 
min_difficulty = min_difficulty_hex.hex.to_f
#print "min_diffictulty = " + min_difficulty.to_s + "\n"

nbits_big = nbits.hex.to_i
print "nbits dec = " + nbits_big.to_s + "\n"
nShift = (nbits_big >> 24) & 255
#print "nShift hex = " + nShift.to_s(16) + "\n"
#print "nShift dec = " + nShift.to_s + "\n"

masked_nbits = nbits_big  & "ffffff".hex.to_i
#print "masked hex = " + masked.to_i.to_s(16) + "\n"

dDiff = (min_difficulty / masked_nbits)
#print "dDiff here = " + dDiff.to_i.to_s(16) + "\n"

while nShift < 29
    #print " nShift now = " + nShift.to_s + "\n"
    dDiff = dDiff * 256.0
    #print " dDiff = " + dDiff.to_i.to_s(16) + "\n"
    nShift += 1
end

while (nShift > 29)
    #print " nShift now = " + nShift.to_s + "\n"
    dDiff = dDiff / 256.0
    #print " dDiff = " + dDiff.to_i.to_s(16) + "\n"
    nShift -= 1
end

dDiff_hex = dDiff.to_i.to_s(16)
print " dDiff hex = " + dDiff_hex + "\n"
print " dDiff dec = " + dDiff.to_s + "\n"


