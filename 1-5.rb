# 1.5
class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s                  # make sure it's a string
    attr_reader attr_name                       # create the attribute's getter
    attr_reader attr_name+"_history"            # create bar_history getter
    class_eval %Q{                              #"your code here, use %Q for multiline strings"
      def #{attr_name}=(new_value)
      @#{attr_name}_history ||= [nil]
      @#{attr_name}_history << new_value
      @#{attr_name} = new_value
    end
    }
  end
end


#class Foo
#  attr_accessor_with_history :bar
#  #end
#
#  #f = Foo.new # => #<Foo:0x127e678>
#  #f.bar = 3 # => 3
#  #f.bar = :wowzo # => :wowzo
#  #f.bar = 'boo!' # => 'boo!'
#  #f.bar_history # => [nil, 3, :wowzo, 'boo!']
#
#  #f = Foo.new
#  #f.bar = 1
#  #f.bar = 2
#  #f.bar_history # => if your code works, should be [nil,1,2]
#
#
#  ###########################
#  #a) [ELLS ex. 3.11] Extend the currency-conversion example from lecture so that you can write
#  #5.dollars.in(:euros)
#  #10.euros.in(:rupees)

class Numeric

  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}

  def method_missing(method_id)
    normalized = method_id.to_s.gsub(/s$/, '')      #remove any trailing s
    if @@currencies.has_key?(normalized)
      self * @@currencies[normalized]
    else
      super
    end
  end

  def in (other_ccy)
    normalized = other_ccy.to_s.gsub(/s$/, '')      #remove any trailing s
    if @@currencies.has_key?(normalized)
      self / @@currencies[normalized]
    end
  end
end


###########################


#b) Adapt your solution from the "palindromes" question so that instead of writing palindrome?
#("foo") you can write "foo".palindrome? HINT: this should require fewer than 5 lines
#of code.

class String
  def palindrome?
    s=self.downcase.gsub(/\W/,'')
    s==s.reverse
  end
end


###########################


#c) Adapt your palindrome solution so that it works on Enumerables. That is:
#[1,2,3,2,1].palindrome? # => true
#(It's not necessary for the collection's elements to be palindromes themselves--only that the
#top-level collection be a palindrome.) HINT: this should require fewer than 5 lines of code.
#Although hashes are considered Enumerables, your solution does not need to make sense for
#hashes (though it should not error).


module Enumerable
  def palindrome?
    self.to_a==self.to_a.reverse
  end
end


