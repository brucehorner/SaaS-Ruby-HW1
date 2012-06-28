
# 1.1
#
def palindrome?(string)
  s=string.downcase.gsub(/\W/,'')
  s==s.reverse
end
#
#
def count_words(string)
  h={}
  string.downcase.split(/\W/).delete_if {|w|w.size==0}.each {|w|h[w]=h[w]?h[w]+1:1}
  h
end

