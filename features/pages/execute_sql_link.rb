class ExecuteSqlLink < SitePrism::Page
  def initialize(query)
    self.class.set_url("http://localhost:3000/execute_sql?query=#{query}")
  end

  def visit_sql_page
    visit(url)
  end
end
