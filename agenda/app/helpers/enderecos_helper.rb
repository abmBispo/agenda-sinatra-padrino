# Helper methods defined here can be accessed in any controller or view in the application

module Agenda
  class App
    module EnderecosHelper
      module_function

      # @methods CREATE #

      # @param logradouro string, cidade string, estado string,
      # @return Enderecos object
      # @name create
      # *Creates an object of Enderecos class and persists it on DB. Returns Enderecos.
      def create(logradouro,cidade,estado)
        # Testing if exists a Enderecos object equals that came from request
        if (Enderecos.exists?(logradouro: logradouro)&&
            Enderecos.exists?(cidade: cidade)&&
            Enderecos.exists?(estado: estado))
          raise ArgumentError,"Already exists this Endereco!"
        else
          # Accessing active_record
          @endereco = Enderecos.new(:logradouro => logradouro, :cidade => cidade, :estado => estado)
          @endereco.save
          return @endereco
        end
      end

      # @methods RETRIEVE #

      # @param Endereco.id integer
      # @return Endereco object
      # @name get
      # *Returns the object for ID = 1
      def get(id)
        if Enderecos.exists?(id: id)
          @endereco = Enderecos.find(id);
          return @endereco
        else
          raise ArgumentError, 'This Endereco do not exists!'
        end
      end

      # @param hash_attributes ...
      # @return Enderecos array
      # @name getAllWith
      # *Returns an array of Enderecos objects.
      def getAllWith(attributes = {})
        array_enderecos = Enderecos.where(attributes).limit(10000000)
        if array_enderecos.empty?
          raise ArgumentError, 'This set of Enderecos field do not exists!'
        else
          return array_enderecos
        end
      end

      # @param hash_attributes ...
      # @return Enderecos array
      # @name getBy
      # *Returns an array of Enderecos objects.
      def getBy(attributes = {})
        array_enderecos = []
        attributes.each do |k,v|
          @enderecos = Enderecos.where(k => v).limit(10000000)
          array_enderecos = (array_enderecos | @enderecos.to_a)
        end

        if array_enderecos.empty?
          raise ArgumentError, 'This set of Enderecos field do not exists!'
        else
          return array_enderecos
        end
      end

    end
    helpers EnderecosHelper
  end
end
