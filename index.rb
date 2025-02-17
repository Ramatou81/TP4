def operation(reponse)
  
  unless reponse.start_with?("What is") && reponse.end_with?("?")
  end

  expression = reponse[8..-2].strip
  expression.gsub!("multiplier par", "multiplier_par")
  expression.gsub!("diviser par", "diviser_par")

  jetons = expression.split
  resultat = nbr_jeton(jetons.shift)

  until jetons.empty?
    operateur = jetons.shift
    nombre = nbr_jeton(jetons.shift)

    case operateur
    when "plus"
      resultat += nombre
    when "moins"
      resultat -= nombre
    when "multiplier_par"
      resultat *= nombre
    when "diviser_par"
      resultat /= nombre
    end
  end

  resultat
end

def nbr_jeton(jetons)
  Integer(jetons)
end

puts operation("What is 5?")                           
puts operation("What is 5 plus 13?")                    
puts operation("What is 6 multiplier_par 4?")               
puts operation("What is 25 diviser par 5?")   