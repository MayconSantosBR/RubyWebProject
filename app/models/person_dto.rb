class PersonDto
    include ActiveModel::Model
  
    attr_accessor :name, :personType, :cpf, :cnpj, :cellphone
  
    validates :name, presence: true
    validates :personType, presence: true
    validates :cpf, presence: true, if: -> { personType == 'Física' }
    validates :cnpj, presence: true, if: -> { personType == 'Jurídica' }
    validates :cellphone, presence: true
  end