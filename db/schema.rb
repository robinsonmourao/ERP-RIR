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
    t.text "nome_fornecedor", null: false
    t.integer "codigo_tecnologia_link"
    t.integer "codigo_tipo_link"
    t.decimal "velocidade_down", null: false
    t.decimal "velocidade_up"
    t.integer "ip", null: false
    t.text "ip_fixo"
    t.text "pppoe_login"
    t.text "pppoe_senha"
    t.integer "link"
    t.integer "dia_vencimento", default: 25
    t.string "valor_mensal", limit: 14
    t.string "valor_instalacao", limit: 14
    t.integer "codigo_meio_pagamento"
    t.text "chave_pix"
    t.integer "nota_fiscal", default: 0
    t.integer "codigo_equipamento"
  end

  create_table "boletos", primary_key: "codigo_boleto", force: :cascade do |t|
    t.text "codigo_atendimento_composto", null: false
    t.integer "codigo_fatura", null: false
    t.text "descricao_grupo", null: false
    t.integer "codigo_local_pagamento"
    t.integer "codigo_status", null: false
    t.date "vencimento", null: false
    t.text "chave"
    t.date "data_pagamento"
    t.string "valor_pagamento", limit: 14
    t.text "observacao"
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
    t.text "codigo_contato_composto"
    t.string "tabela", limit: 1, null: false
    t.integer "codigo_tipo_contato", null: false
    t.integer "codigo_meio_contato", null: false
    t.text "nome_pessoa"
    t.text "descricao", null: false
    t.text "descricao_tipo_contato"
    t.text "observacao"
  end

  create_table "equipamentos", primary_key: "codigo_equipamento", force: :cascade do |t|
    t.text "descricao", null: false
    t.text "mac_equipamento"
    t.text "serial_equipamento"
  end

  create_table "faturas", primary_key: "codigo_fatura", force: :cascade do |t|
    t.text "codigo_atendimento_composto", null: false
    t.integer "codigo_meio_pagamento", null: false
    t.text "chave"
    t.string "valor", limit: 14
    t.date "vencimento", default: -> { "strftime('%Y-%m-25', 'now')" }, null: false
    t.text "descricao_grupo", null: false
    t.integer "instalacao", default: 1, null: false
    t.integer "codigo_status", null: false
  end

  create_table "fornecedors", primary_key: "codigo_fornecedor", force: :cascade do |t|
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
    t.text "descricao", null: false
  end

  create_table "local_pagamentos", primary_key: "codigo_local_pagamento", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "meio_contatos", primary_key: "codigo_meio_contato", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "meio_pagamentos", primary_key: "codigo_meio_pagamento", force: :cascade do |t|
    t.integer "descricao", null: false
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
    t.decimal "velocidade_contratada", null: false
    t.integer "codigo_tipo_link"
    t.decimal "sla"
    t.string "valor_mensal", limit: 14
    t.string "valor_instalacao", limit: 14
  end

  create_table "situacoes", primary_key: "codigo_situacao", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "statuses", primary_key: "codigo_status", force: :cascade do |t|
    t.text "codigo_acfs_composto"
    t.text "descricao_acfs", null: false
    t.string "tabela", limit: 1
    t.integer "codigo_situacao", default: 5
    t.date "data", default: -> { "CURRENT_DATE" }
  end

  create_table "tecnologia_links", primary_key: "codigo_tecnologia_link", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "tipo_contatos", primary_key: "codigo_tipo_contato", force: :cascade do |t|
    t.text "descricao", null: false
  end

  create_table "tipo_links", primary_key: "codigo_tipo_link", force: :cascade do |t|
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
  add_foreign_key "atendimentos", "fornecedors", column: "nome_fornecedor", primary_key: "nome_fornecedor"
  add_foreign_key "atendimentos", "meio_pagamentos", column: "codigo_meio_pagamento", primary_key: "codigo_meio_pagamento"
  add_foreign_key "atendimentos", "sites", column: "designacao", primary_key: "designacao"
  add_foreign_key "atendimentos", "tecnologia_links", column: "codigo_tecnologia_link", primary_key: "codigo_tecnologia_link"
  add_foreign_key "atendimentos", "tipo_links", column: "codigo_tipo_link", primary_key: "codigo_tipo_link"
  add_foreign_key "boletos", "faturas", column: "codigo_fatura", primary_key: "codigo_fatura"
  add_foreign_key "boletos", "grupos", column: "descricao_grupo", primary_key: "descricao"
  add_foreign_key "boletos", "local_pagamentos", column: "codigo_local_pagamento", primary_key: "codigo_local_pagamento"
  add_foreign_key "boletos", "statuses", column: "codigo_status", primary_key: "codigo_status"
  add_foreign_key "clientes", "municipios", column: "codigo_municipio", primary_key: "codigo_municipio"
  add_foreign_key "contatos", "meio_contatos", column: "codigo_meio_contato", primary_key: "codigo_meio_contato"
  add_foreign_key "contatos", "tipo_contatos", column: "codigo_tipo_contato", primary_key: "codigo_tipo_contato"
  add_foreign_key "faturas", "grupos", column: "descricao_grupo", primary_key: "descricao"
  add_foreign_key "faturas", "meio_pagamentos", column: "codigo_meio_pagamento", primary_key: "codigo_meio_pagamento"
  add_foreign_key "faturas", "statuses", column: "codigo_status", primary_key: "codigo_status"
  add_foreign_key "fornecedors", "municipios", column: "codigo_municipio", primary_key: "codigo_municipio"
  add_foreign_key "fornecedors", "sites", column: "codigo_site", primary_key: "codigo_site"
  add_foreign_key "municipios", "ufs", column: "codigo_uf", primary_key: "codigo_uf"
  add_foreign_key "sites", "clientes", column: "codigo_cliente", primary_key: "codigo_cliente"
  add_foreign_key "sites", "municipios", column: "codigo_municipio", primary_key: "codigo_municipio"
  add_foreign_key "sites", "tipo_links", column: "codigo_tipo_link", primary_key: "codigo_tipo_link"
  add_foreign_key "statuses", "situacoes", column: "codigo_situacao", primary_key: "codigo_situacao"
end
