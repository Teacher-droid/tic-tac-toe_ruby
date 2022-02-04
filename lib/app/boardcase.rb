class Boardcase

    attr_accessor :case_name, :case_symbole
  
    def initialize(case_name,case_symbole) 
     @case_name = case_name.to_i            #defini chiffre pour la rappeler
     @case_symbole = case_symbole           #symbole de la case
    end
      
  end