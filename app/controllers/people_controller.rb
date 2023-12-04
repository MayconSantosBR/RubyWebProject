require_relative 'modules/header'

class PeopleController < ApplicationController
    include HeaderGenerator
  
    def show
      set_header_and_form
      render :index
    end
  
    def index
      set_header_and_form
      render :index
    end
  
    def get
      @header = generate_header
      @people = Person.all
      render :list
    end
  
    def create
      @model = PersonDto.new(create_params)
      @entity = Person.new(name: @model.name, personType: @model.personType)
  
      if @model.valid?
        @entity.cpfCnpj = (@model.personType == 'Física') ? @model.cpf : @model.cnpj
        @entity.cellphone = @model.cellphone
  
        if @entity.save
          redirect_to action: 'index', notice: 'Person was successfully created.'
        else
          flash.now[:alert] = 'Error creating person.'
          render :index
        end
      else
        flash.now[:alert] = 'Validation error. Please check the form.'
        render :index
      end
    end
  
    def edit
        @person = Person.find(params[:id])
        
        set_header_and_form

        @is_update = 1
        
        @form.name = @person.name
        @form.personType = @person.personType == 0 ? 'Física' : 'Jurídica'
        @form.cpf = @person.cpfCnpj if @person.personType == 0
        @form.cnpj = @person.cpfCnpj if @person.personType == 1
        @form.cellphone = @person.cellphone

        render :index
    end

    def update
        @person = Person.find(params[:person_id])
        @model = PersonDto.new(create_params)
        
        if @model.valid?
            @person.cpfCnpj = (@model.personType == 'Física') ? @model.cpf : @model.cnpj
            @person.cellphone = @model.cellphone
    
            if @person.update(update_params)
                redirect_to action: 'get', notice: 'Person was successfully updated.'
            else
                flash.now[:alert] = 'Error creating person.'
                render :index
            end
        else
            flash.now[:alert] = 'Validation error. Please check the form.'
            render :index
        end
    end
    
    def destroy
      @person = Person.find(params[:person_id])
      if @person.destroy
        redirect_to action: 'get', notice: 'Person was successfully deleted.'
      else
        redirect_to action: 'get', alert: 'Error deleting person.'
      end
    end
  
    private
  
    def update_params
        params.require(:person_dto).permit(:name, :personType, :cpfCnpj, :cellphone)
    end

    def set_header_and_form
      @header = generate_header
      @form = PersonDto.new
      @is_update = 0
    end
  
    def create_params
      params.require(:person_dto).permit(:name, :personType, :cpf, :cnpj, :cellphone)
    end
  end
  
