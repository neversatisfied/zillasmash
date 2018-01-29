#!/usr/bin/ruby
#require 'optparse'

# v1.0
# 
# This is a ruby port of the C code provided at http://www.securiteam.com/windowsntfocus/5IP0A2KGVW.html
# 
# Input: filezilla encoded password. eg: 042040063063
# Output: cleartext password. eg: pass
#
# Notes: the character conversion loop can probably be removed and typecasting performed in the 
#        decoding loop for more concise code. 
#        
#        Future release will include argv parsing and the option to enter one password or to give 
#        an input file and decode all passwords in it.
#
#


ciph_key = 'FILEZILLA1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ'

# should decode to "pass"
#test_pass = '042040063063'

puts "Enter the password: "
test_pass = gets


# iterate over the encoded pass, every 3 digits is one dec char code
# turn into ascii
        #
#
# len=digit2char(buff);
# pos=len%strlen(m_key);
# buff[i]=buff[i]^m_key[(i+pos)%strlen(m_key)];
# where buff[] contains the ascii chars

arr_buf =  test_pass.scan(/.{3}/)
ciph_key = ciph_key.scan(/./)

arr_buf.each do |b|
        b = b.to_i
        b = b.chr
end




len = arr_buf.length
pos = len%ciph_key.length

temp = ciph_key.length


arr_buf.each_with_index do |val, index|
        k = ciph_key[(index+pos.to_i)%ciph_key.length]
        j = ciph_key.length
        temp = val.to_i^k.ord
        arr_buf[index] = temp.chr
end

puts arr_buf.join
