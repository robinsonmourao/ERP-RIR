class ListarTodosPage < SitePrism::Page
  def initialize(entidade)
    @entidade = entidade
    self.class.set_url("http://127.0.0.1:3000/#{entidade}")
  end

  def clicar_link_editar
    entidade_index = $objetos_map.rindex{ |obj| obj[0] == @entidade }
    if entidade_index
      entidade_id = $objetos_map[entidade_index][1]
      href = "a[href='/#{@entidade}/#{entidade_id}/edit']"
      find(href).click
    else
      puts "ERROR: Entidade '#{entidade}' não encontrada no mapa de objetos."
    end
  end
end
