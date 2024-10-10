class SqlController < ApplicationController
  def execute
    sql_query = params[:query]

    result = ActiveRecord::Base.connection.execute(sql_query)

    render json: { status: 'success', data: result.to_a }, status: :ok
  rescue ActiveRecord::StatementInvalid => e
    render json: { status: 'error', message: e.message }, status: :unprocessable_entity
  end
end
