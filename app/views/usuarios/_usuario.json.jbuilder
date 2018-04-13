json.extract! usuario, :id, :nombre, :cargo, :telefono, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
