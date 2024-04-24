# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 23) do
  create_table "atendimentos", primary_key: "codigo_atendimento", force: :cascade do |t|
    t.text "designacao", null: false
    t.integer "fornecedor", null: false
    t.integer "tecnologia"
    t.integer "tipo"
    t.integer "velocidade_down", null: false
    t.integer "velocidade_up"
    t.text "ip", null: false
    t.text "ip_fixo"
    t.text "pppoe_login"
    t.text "pppoe_senha"
    t.text "principal"
    t.integer "vencimento", default: 25, null: false
    t.decimal "valor_Mensal", precision: 11, scale: 2
    t.decimal "valor_instalacao", precision: 11, scale: 2
    t.integer "meio_pagamento", default: 0
    t.text "chave_pix"
    t.integer "nota_fiscal", default: 0
    t.integer "codigo_equipamento"
    t.text "mac_equipamento"
    t.text "serial_equipamento"
  end

  create_table "boletos", id: false, force: :cascade do |t|
    t.integer "codigo_fatura", null: false
    t.integer "grupo", null: false
    t.decimal "valor", precision: 11, scale: 2
    t.text "chave"
    t.date "data_pagamento"
    t.integer "local_pagamento"
    t.text "observacao"
    t.integer "status", null: false
  end

  create_table "clientes", primary_key: "codigo_cliente", force: :cascade do |t|
    t.text "nome", null: false
    t.text "endereco_cliente"
    t.text "bairro"
    t.integer "cidade"
    t.text "cep", limit: 8
    t.text "cnpj", limit: 14, null: false
    t.text "inscricao_estadual"
    t.text "inscricao_municipal"
  end

  create_table "contato_meio", primary_key: "codigo_contato_meio", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "contato_tipo", primary_key: "codigo_contato_tipo", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "contatos", id: false, force: :cascade do |t|
    t.integer "codigo_contato", null: false
    t.string "tabela", limit: 1, null: false
    t.integer "tipo", null: false
    t.integer "meio", null: false
    t.text "nome_pessoa"
    t.text "descricao", null: false
    t.text "observacao"
  end

  create_table "equipamentos", primary_key: "codigo_equipamento", force: :cascade do |t|
    t.string "descricao", limit: 1, null: false
  end

  create_table "faturas", primary_key: "codigo_fatura", force: :cascade do |t|
    t.integer "codigo_atendimento", null: false
    t.integer "meio_pagamento", null: false
    t.text "chave"
    t.decimal "valor", precision: 11, scale: 2
    t.date "vencimento"
    t.integer "agrupamento", default: 1, null: false
    t.integer "instalacao", default: 0, null: false
    t.integer "status", null: false
  end

  create_table "fornecedor_cidades", id: false, force: :cascade do |t|
    t.integer "codigo_fornecedor", null: false
    t.integer "codigo_cidade", null: false
    t.integer "area"
    t.text "observacao"
  end

  create_table "fornecedores", primary_key: "codigo_fornecedor", force: :cascade do |t|
    t.text "nome", null: false
    t.text "endereco_fornecedor"
    t.text "bairro"
    t.integer "cidade"
    t.string "cep", limit: 8
    t.string "cnpj", limit: 14
    t.text "asn"
    t.text "site_fornecedor"
  end

  create_table "grupos", primary_key: "codigo_grupo", force: :cascade do |t|
    t.integer "descricao", default: 1, null: false
  end

  create_table "local_pagamento", primary_key: "codigo_local_pagamento", force: :cascade do |t|
    t.string "descricao", limit: 1, null: false
  end

  create_table "logs", id: false, force: :cascade do |t|
    t.datetime "data", precision: nil, null: false
    t.integer "codigo_usuario", null: false
    t.text "comando", null: false
  end

  create_table "meios_pagamento", primary_key: "codigo_meio_pagamento", force: :cascade do |t|
    t.text "descricao", default: "1"
  end

  create_table "midia_social", id: false, force: :cascade do |t|
    t.string "tabela", limit: 1, null: false
    t.integer "codigo_tipo_midia_social"
    t.text "descricao", null: false
  end

  create_table "municipios", primary_key: "codigo_municipio", force: :cascade do |t|
    t.integer "codigo_uf", null: false
    t.text "nome"
  end

  create_table "sites", primary_key: "codigo_site", force: :cascade do |t|
    t.text "designacao", null: false
    t.integer "codigo_cliente", null: false
    t.text "nome", null: false
    t.text "endereco_site"
    t.text "bairro"
    t.integer "cidade"
    t.text "cep"
    t.decimal "coordenadalt"
    t.decimal "coordenadalg"
    t.integer "velocidade", null: false
    t.integer "tipo"
    t.decimal "sla"
    t.decimal "mensal"
    t.decimal "instalacao"
  end

  create_table "status", primary_key: "codigo_status", force: :cascade do |t|
    t.text "codigo_sfca", null: false
    t.string "tabela", limit: 1, null: false
    t.integer "situacao", null: false
    t.date "data", default: -> { "CURRENT_DATE" }, null: false
  end

  create_table "status_codigo", primary_key: "codigo_status_codigo", force: :cascade do |t|
    t.text "descricao", default: "pendente", null: false
  end

  create_table "tecnologia_link", primary_key: "codigo_tecnologia_link", force: :cascade do |t|
    t.string "descricao", limit: 1, null: false
  end

  create_table "tipo_link", primary_key: "codigo_tipo_link", force: :cascade do |t|
    t.string "descricao", limit: 1, null: false
  end

  create_table "tipo_midia_social", primary_key: "codigo_midia_social", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "ufs", primary_key: "codigo_uf", force: :cascade do |t|
    t.string "sigla", limit: 2
    t.text "nome"
  end

  create_table "usuarios", primary_key: "codigo_usuario", force: :cascade do |t|
    t.text "senha", null: false
    t.text "nome", null: false
    t.text "permissao", null: false
  end

  add_foreign_key "boletos", "faturas", column: "codigo_fatura", primary_key: "codigo_fatura"
  add_foreign_key "faturas", "atendimentos", column: "codigo_atendimento", primary_key: "codigo_atendimento"
  add_foreign_key "fornecedor_cidades", "fornecedores", column: "codigo_fornecedor", primary_key: "codigo_fornecedor"
  add_foreign_key "logs", "usuarios", column: "codigo_usuario", primary_key: "codigo_usuario"
  add_foreign_key "midia_social", "midia_social", column: "codigo_tipo_midia_social", primary_key: "codigo_midia_social"
  add_foreign_key "municipios", "ufs", column: "codigo_uf", primary_key: "codigo_uf"
  add_foreign_key "sites", "clientes", column: "codigo_cliente", primary_key: "codigo_cliente"
  add_foreign_key "status", "atendimento", column: "codigo_sfca", on_update: :cascade, on_delete: :cascade
  add_foreign_key "status", "clientes", column: "codigo_sfca", on_update: :cascade, on_delete: :cascade
  add_foreign_key "status", "fornecedores", column: "codigo_sfca", on_update: :cascade, on_delete: :cascade
  add_foreign_key "status", "sites", column: "codigo_sfca", on_update: :cascade, on_delete: :cascade
end
