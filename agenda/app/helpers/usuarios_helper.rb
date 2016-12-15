# Helper methods defined here can be accessed in any controller or view in the application
require_relative "../../models/usuarios"

module Agenda
  class App
    module UsuariosHelper
      module_function

      # @methods CREATE #

      # @param nome string
      # @return Usuarios object
      # @name create
      # *Creates an object of Usuarios class and persists it on DB. Returns Usuarios.
      def create(nome,login,senha)

        # Testing if exists a Usuarios object with field "login" equals that came from request
        if Usuarios.exists?(login: login)
          raise ArgumentError,"Already exists a Usuarios with that login field!"
        else
          # Accessing active_record
          @usuario = Usuarios.new(:nome => nome, :login => login, :senha => senha)
          @usuario.save
          return @usuario
        end
      end

      # @methods RETRIEVE #

      # @param Usuarios.id integer
      # @return Usuarios object
      # @name get
      # *Returns the object for ID = 1
      def get(id)
        if Usuarios.exists?(id: id)
          @usuario = Usuarios.find(id);
          return @usuario
        else
          raise ArgumentError, 'This Usuarios do not exists!'
        end
      end

      # @param Usuarios.nome string
      # @return Usuarios object
      # @name getByNome
      # *Returns the first item or nil.
      def getByNome(nome)
        if Usuarios.exists?(nome: nome)
          @usuario = Usuarios.find_by(nome: nome);
          return @usuario
        else
          raise ArgumentError, 'This Usuarios do not exists!'
        end
      end

      # @methods UPDATE #

      # @param Usuarios.id integer, hash_attributes ...
      # @return Usuarios object
      # @name update
      # *Updates an object and persists it on DB.
      def update(id, attributes = {})
        # Testing each key
        attributes.each do |key,value|
          if(key!="id"&&key!="nome"&&key!="login"&&key!="senha")
            raise ArgumentError, "The hash contains invalid values!"
          end
        end
        # Testing if exists that Usuarios object
        if Usuarios.exists?(id: id)
          @usuario = Usuarios.update(id,attributes);
          return @usuario
        else
          raise ArgumentError, "The id doesn't refer to any Usuarios object!"
        end
      end

      # @methods DELETE #

      # @param Usuarios.id integer
      # @return nil
      # @name delete
      # *Deletes an object from DB
      def delete(id)
        if Usuarios.exists?(id: id)
          Usuarios.delete(id);
        else
          raise ArgumentError, 'This Usuarios do not exists!'
        end
      end
    end
    helpers UsuariosHelper
  end
end
