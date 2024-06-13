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
    t.integer "codigo_fornecedor", null: false
    t.integer "codigo_tecnologia_link"
    t.integer "codigo_tipo_link"
    t.integer "velocidade_down", null: false
    t.integer "velocidade_up"
    t.integer "ip", null: false
    t.text "ip_fixo"
    t.text "pppoe_login"
    t.text "pppoe_senha"
    t.integer "link"
    t.integer "dia_vencimento", default: 25
    t.decimal "valor_mensal", precision: 11, scale: 2
    t.decimal "valor_instalacao", precision: 11, scale: 2
    t.integer "codigo_meio_pagamento"
    t.text "chave_pix"
    t.integer "nota_fiscal", default: 0
    t.integer "codigo_equipamento"
  end

  create_table "boletos", primary_key: ["codigo_atendimento", "vencimento", "codigo_grupo"], force: :cascade do |t|
    t.integer "codigo_fatura", null: false
    t.integer "codigo_atendimento", null: false
    t.integer "vencimento", null: false
    t.integer "codigo_grupo", null: false
    t.integer "grupo", null: false
    t.decimal "valor", precision: 11, scale: 2
    t.text "chave"
    t.date "data_pagamento"
    t.integer "codigo_local_pagamento"
    t.text "observacao"
    t.integer "status", null: false
  end

  create_table "clientes", primary_key: "codigo_cliente", force: :cascade do |t|
    t.text "nome_cliente", null: false
    t.text "endereco"
    t.text "bairro"
    t.integer "codigo_municipio"
    t.string "cep", limit: 8
    t.string "cnpj", limit: 14, null: false
    t.text "inscricao_estadual"
    t.text "inscricao_municipal"
  end

  create_table "contatos", primary_key: "codigo_contato", force: :cascade do |t|
    t.string "tabela", limit: 1, null: false
    t.integer "codigo_tipo_contato", null: false
    t.integer "codigo_meio_contato", null: false
    t.text "nome_pessoa"
    t.text "descricao", null: false
    t.text "observacao"
  end

  create_table "equipamentos", primary_key: "codigo_equipamento", force: :cascade do |t|
    t.integer "descricao", null: false
    t.text "mac_equipamento"
    t.text "serial_equipamento"
  end

  create_table "faturas", primary_key: "codigo_fatura", force: :cascade do |t|
    t.integer "codigo_atendimento", null: false
    t.integer "codigo_meio_pagamento", null: false
    t.text "chave"
    t.decimal "valor", precision: 11, scale: 2
    t.date "vencimento", default: -> { "strftime('%Y-%m-25', 'now')" }
    t.integer "codigo_grupo", null: false
    t.integer "instalacao", default: 0, null: false
    t.integer "codigo_status", null: false
  end

  create_table "fornecedor_cidades", primary_key: "codigo_fornecedor_cidade", force: :cascade do |t|
    t.integer "codigo_fornecedor", null: false
    t.integer "codigo_municipio", null: false
    t.integer "area"
    t.text "observacao"
  end

  create_table "fornecedores", primary_key: "codigo_fornecedor", force: :cascade do |t|
    t.text "nome_fornecedor", null: false
    t.text "endereco"
    t.text "bairro"
    t.integer "codigo_municipio"
    t.string "cep", limit: 8
    t.string "cnpj", limit: 14
    t.text "asn"
    t.integer "codigo_site"
  end

  create_table "grupos", primary_key: "codigo_grupo", force: :cascade do |t|
    t.integer "descricao", default: 1, null: false
  end

  create_table "local_pagamentos", primary_key: "codigo_local_pagamento", force: :cascade do |t|
    t.integer "descricao", null: false
  end

  create_table "logs", id: false, force: :cascade do |t|
    t.datetime "data", precision: nil, null: false
    t.integer "codigo_usuario", null: false
    t.text "comando", null: false
  end

  create_table "meio_contatos", primary_key: "codigo_meio_contato", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "meio_pagamentos", primary_key: "codigo_meio_pagamento", force: :cascade do |t|
    t.integer "descricao", default: 1
  end

  create_table "midias_sociais", id: false, force: :cascade do |t|
    t.string "tabela", limit: 1, null: false
    t.integer "codigo_tipo_midia_social"
    t.text "descricao", null: false
  end

  create_table "municipios", primary_key: "codigo_municipio", force: :cascade do |t|
    t.integer "codigo_uf", null: false
    t.text "nome_municipio", null: false
  end

  create_table "sites", primary_key: "codigo_site", force: :cascade do |t|
    t.text "designacao", null: false
    t.integer "codigo_cliente", null: false
    t.text "nome_site", null: false
    t.text "endereco"
    t.text "bairro"
    t.integer "codigo_municipio"
    t.string "cep", limit: 8
    t.decimal "coordenadalt"
    t.decimal "coordenadalg"
    t.integer "velocidade_contratada", null: false
    t.integer "codigo_tipo_link"
    t.decimal "sla"
    t.decimal "valor_mensal"
    t.decimal "valor_instalacao"
  end

  create_table "situacoes", primary_key: "codigo_situacao", force: :cascade do |t|
    t.integer "descricao", default: 5, null: false
  end

  create_table "status_codigo", id: false, force: :cascade do |t|
    t.integer "codigo_status", null: false
    t.text "descricao", default: "pendente", null: false
  end

  create_table "statuses", primary_key: "codigo_status", force: :cascade do |t|
    t.integer "codigo_acfs", null: false
    t.string "tabela", limit: 1, null: false
    t.integer "codigo_situacao", null: false
    t.date "data", default: -> { "CURRENT_DATE" }
  end

  create_table "tecnologia_links", primary_key: "codigo_tecnologia_link", force: :cascade do |t|
    t.integer "descricao", null: false
  end

  create_table "tipo_contatos", primary_key: "codigo_tipo_contato", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "tipo_links", primary_key: "codigo_tipo_link", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "tipo_midias_sociais", id: false, force: :cascade do |t|
    t.integer "codigo_midia_social"
    t.text "descricao", null: false
  end

  create_table "ufs", primary_key: "codigo_uf", force: :cascade do |t|
    t.string "sigla", limit: 2, null: false
    t.text "nome_estado", null: false
  end

  create_table "usuarios", primary_key: "codigo_usuario", force: :cascade do |t|
    t.text "password_digest", null: false
    t.text "nome", null: false
    t.integer "permissao", null: false
  end

  add_foreign_key "atendimentos", "equipamentos", column: "codigo_equipamento", primary_key: "codigo_equipamento"
  add_foreign_key "atendimentos", "fornecedores", column: "codigo_fornecedor", primary_key: "codigo_fornecedor"
  add_foreign_key "atendimentos", "meio_pagamentos", column: "codigo_meio_pagamento", primary_key: "codigo_meio_pagamento"
  add_foreign_key "atendimentos", "sites", column: "designacao", primary_key: "designacao"
  add_foreign_key "atendimentos", "tecnologia_links", column: "codigo_tecnologia_link", primary_key: "codigo_tecnologia_link"
  add_foreign_key "atendimentos", "tipo_links", column: "codigo_tipo_link", primary_key: "codigo_tipo_link"
  add_foreign_key "boletos", "atendimentos", column: "codigo_atendimento", primary_key: "codigo_atendimento"
  add_foreign_key "boletos", "faturas", column: "codigo_fatura", primary_key: "codigo_fatura"
  add_foreign_key "boletos", "faturas", column: "vencimento", primary_key: "vencimento"
  add_foreign_key "boletos", "grupos", column: "codigo_grupo", primary_key: "codigo_grupo"
  add_foreign_key "boletos", "local_pagamentos", column: "codigo_local_pagamento", primary_key: "codigo_local_pagamento"
  add_foreign_key "clientes", "municipios", column: "codigo_municipio", primary_key: "codigo_municipio"
  add_foreign_key "contatos", "meio_contatos", column: "codigo_meio_contato", primary_key: "codigo_meio_contato"
  add_foreign_key "contatos", "tipo_contatos", column: "codigo_tipo_contato", primary_key: "codigo_tipo_contato"
  add_foreign_key "faturas", "atendimentos", column: "codigo_atendimento", primary_key: "codigo_atendimento"
  add_foreign_key "faturas", "grupos", column: "codigo_grupo", primary_key: "codigo_grupo"
  add_foreign_key "faturas", "meio_pagamentos", column: "codigo_meio_pagamento", primary_key: "codigo_meio_pagamento"
  add_foreign_key "faturas", "status", column: "codigo_status", primary_key: "codigo_status"
  add_foreign_key "fornecedor_cidades", "fornecedores", column: "codigo_fornecedor", primary_key: "codigo_fornecedor"
  add_foreign_key "fornecedor_cidades", "municipios", column: "codigo_municipio", primary_key: "codigo_municipio"
  add_foreign_key "fornecedores", "municipios", column: "codigo_municipio", primary_key: "codigo_municipio"
  add_foreign_key "fornecedores", "sites", column: "codigo_site", primary_key: "codigo_site"
  add_foreign_key "logs", "usuarios", column: "codigo_usuario", primary_key: "codigo_usuario"
  add_foreign_key "midias_sociais", "tipo_midias_sociais", column: "codigo_tipo_midia_social", primary_key: "codigo_tipo_midia_social"
  add_foreign_key "municipios", "ufs", column: "codigo_uf", primary_key: "codigo_uf"
  add_foreign_key "sites", "clientes", column: "codigo_cliente", primary_key: "codigo_cliente"
  add_foreign_key "sites", "municipios", column: "codigo_municipio", primary_key: "codigo_municipio"
  add_foreign_key "sites", "tipo_links", column: "codigo_tipo_link", primary_key: "codigo_tipo_link"
  add_foreign_key "status_codigo", "status_table", column: "codigo_status", primary_key: "codigo_status"
  add_foreign_key "statuses", "situacoes", column: "codigo_situacao", primary_key: "codigo_situacao"
end
