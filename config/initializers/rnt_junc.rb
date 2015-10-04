
# To generate Short name using first letter
# from each word and joing them.
class String
  def shortify
    word_length = self.scan(/\w+/).count
    word_length > 1 ? self.scan(/([\w])([\w]*)/).map(&:first).join : self
  end
end