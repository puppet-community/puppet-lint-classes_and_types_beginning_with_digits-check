PuppetLint.new_check(:classes_and_types_beginning_with_digits) do
  def check
    tokens.each do |token|
      if (token.type == :CLASS) or (token.type == :DEFINE)
        if token.next_code_token.value =~ /^\d+/
          notify :warning, {
            :message => 'class or defined type found beginning with a digit',
            :line    => token.line,
            :column  => token.column,
            :token   => token,
          }
        end
      end
    end
  end

  def fix(problem)
    problem[:token].next_code_token.value.gsub!(/^\d+/,'')
  end
end
