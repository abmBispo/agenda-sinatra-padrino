require 'sinatra/base'
require 'json'

Agenda::App.controllers :usuarios do

  # @route C

  # @POST /json
  # @param nome string, login string, senha string
  # @return Usuarios object > json
  post "/criar" do
    # Reading json from request body
    request.body.rewind()
    @params = ActiveSupport::JSON.decode(request.body.read)

    begin
      # Accessing helper method. Could throw an Argument error.
      @usuario = Agenda::App::UsuariosHelper::create(params['nome'],params['login'],params['senha'])

      # Response
      status = 200
      content_type :json
      @usuario.to_json
    rescue ArgumentError => e
      status = 406, e.message # not acceptable
    end
  end

  # @route R

  # @GET /url
  # @param Usuarios.id integer
  # @return Usuarios object > json
  get "/:id" do
    begin
      # Accessing controller
      @usuario = Agenda::App::UsuariosHelper::get(params[:id])
      # Response
      status = 200
      content_type :json
      @usuario.to_json
    rescue ArgumentError => e
      status = 404, e.message
    end
  end

  # @GET /url
  # @param Usuarios.nome string
  # @return Usuarios object > json
  get "/nome/:nome" do
    begin
      # Accessing controller
      @usuario = Agenda::App::UsuariosHelper::getByNome(params[:nome])

      # Response
      status = 200
      content_type :json
      @usuario.to_json
    rescue ArgumentError => e
      status = 404, e.message
    end
  end

  # @route U

  # @PUT /json
  # @param hash_attributes ...
  # @return Usuarios object > json
  # @name updateUsuarios
  put "/update" do
    # Reading json from request body
    request.body.rewind()
    @params = ActiveSupport::JSON.decode(request.body.read)

    begin
      # Accessing controller
      @usuario = Agenda::App::UsuariosHelper::update(params["id"],params)

      # Response
      status = 200
      content_type :json
      @usuario.to_json
    rescue ArgumentError => e
      status = 406, e.message
    end
  end

  # @route D

  # @DELETE /json
  # @param Usuarios.id integer
  # @return nil
  # @name deleteUsuarios
  delete "/delete" do
    # Reading json from request body
    request.body.rewind()
    @params = ActiveSupport::JSON.decode(request.body.read)

    begin
      # Accessing controller
      Agenda::App::UsuariosHelper::delete(params["id"])
      # Response
      status = 200
    rescue ArgumentError => e
      status = 404, e.message
    end
  end
end
