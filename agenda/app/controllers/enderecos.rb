require 'sinatra/base'
require 'json'

Agenda::App.controllers :enderecos do

  # @route C

  # @POST /json
  # @param logradouro string, cidade string, estado string
  # @return Endereco object > json
  post "/criar" do
    # Reading json from request body
    request.body.rewind()
    @params = ActiveSupport::JSON.decode(request.body.read)

    begin
      # Accessing helper method. Could throw an Argument error.
      @endereco = Agenda::App::EnderecosHelper::create(params['logradouro'],params['cidade'],params['estado'])

      # Response
      status = 200
      content_type :json
      @endereco.to_json
    rescue ArgumentError => e
      status = 406, e.message # not acceptable
    end
  end

  # @route R

  # @POST /url
  # @param hash_attributes ...
  # @return Enderecos array > json
  post "/getAllWith" do
    # Reading json from request body
    request.body.rewind()
    @params = ActiveSupport::JSON.decode(request.body.read)

    begin
      # Accessing controller
      @array_enderecos = Agenda::App::EnderecosHelper::getAllWith(params)
      # Response
      status = 200
      content_type :json
      @array_enderecos.to_json
    rescue ArgumentError => e
      status = 404, e.message
    end
  end

  # @POST /url
  # @param hash_attributes ...
  # @return Enderecos array > json
  post "/getBy" do
    # Reading json from request body
    request.body.rewind()
    @params = ActiveSupport::JSON.decode(request.body.read)

    begin
      # Accessing controller
      @array_enderecos = Agenda::App::EnderecosHelper::getBy(params)
      # Response
      status = 200
      content_type :json
      @array_enderecos.to_json
    rescue ArgumentError => e
      status = 404, e.message
    end
  end

  # @route U

  # @PUT /json
  # @param hash_attributes ...
  # @return Enderecos object > json
  # @name updateEnderecos
  put "/update" do
    # Reading json from request body
    request.body.rewind()
    @params = ActiveSupport::JSON.decode(request.body.read)

    begin
      # Accessing controller
      @usuario = Agenda::App::EnderecosHelper::update(params["id"],params)

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
  # @param Enderecos.id integer
  # @return nil
  # @name deleteEnderecos
  delete "/delete" do
    # Reading json from request body
    request.body.rewind()
    @params = ActiveSupport::JSON.decode(request.body.read)

    begin
      # Accessing controller
      Agenda::App::EnderecosHelper::delete(params["id"])
      # Response
      status = 200
    rescue ArgumentError => e
      status = 404, e.message
    end
  end

end
