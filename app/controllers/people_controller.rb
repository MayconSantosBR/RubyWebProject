require_relative 'modules/header'

class PeopleController < ApplicationController
    include HeaderGenerator

    def show
        @header = generate_header
        @form = PersonDto.new()

        render :index
    end

    def index
        @header = generate_header
        @form = PersonDto.new()

        render :index
    end

    def create
        @model = PersonDto.new(create_params)

        if @model.valid?
            @entity = Person.new
            @entity.name = @model.name
            @entity.personType = @model.personType

            if @model.personType == 'Física'
                @entity.cpfCnpj = @model.cpf
            else
                @entity.cpfCnpj = @model.cnpj
            end

            @entity.cellphone = @model.cellphone

            @entity.save

            redirect_to action: 'index'
        else
            redirect_to action: 'index'
        end
    end

    private def create_params
        params.require(:person_dto).permit(:name, :personType, :cpf, :cnpj, :cellphone)
    end
end
