
    get '/models' do
      @models = []
      column_names = History.column_names
      rows = History.all
      model = {"table_name": "history", "model_name": "history", "column_names": column_names, "rows": rows}
      @models.push(model)
      erb :aldy_show_sqlite3_tables
    end
    
