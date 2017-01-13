require "json"
require "rest-client"
require "inegi_denue/version"

module InegiDenue
  class Actions
    def buscar(params)
      puts !params[:condicion]
      if !params[:condicion] then params[:condicion] = "todos"; end
      if !params[:distancia] then params[:distancia] = 250; end
      puts "http://www3.inegi.org.mx/sistemas/api/denue/v1/consulta/buscar/#{params[:condicion]}/#{params[:coordenadas]}/#{params[:distancia]}/#{params[:token]}/"
      req = RestClient.get "http://www3.inegi.org.mx/sistemas/api/denue/v1/consulta/buscar/#{params[:condicion]}/#{params[:coordenadas]}/#{params[:distancia]}/#{params[:token]}/"
      return JSON.parse(req)
    end

    def ficha(id, token)
      req = RestClient.get "http://www3.inegi.org.mx/sistemas/api/denue/v1/consulta/ficha/#{id}/#{token}/"
      return JSON.parse(req)
    end
  end

  # Your code goes here...
end
